using DBClient.Model;
using DevExpress.Xpf.Grid;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DBClient.Views
{
  class EntityListView<TEntity> : ViewBase
    where TEntity : class, new()
  {
    Type detailView;
    GridControl tbl;
    public EntityListView()
    {
      tbl = new GridControl();

      this.Header = TableDefinitionsHelper.GetHeaderForEntity<TEntity>();
      this.detailView = TableDefinitionsHelper.GetDetailViewForEntity<TEntity>();

      this.Content = tbl;
      DataContext = this;

      this.CommandBindings.Add(new CommandBinding(ApplicationCommands.New, ExecuteNew, CanExecuteCommand));
      this.CommandBindings.Add(new CommandBinding(ApplicationCommands.Save, ExecuteSave, CanExecuteCommand));
      this.CommandBindings.Add(new CommandBinding(ApplicationCommands.Delete, ExecuteDelete, CanExecuteCommand));

      if (detailView != null)
        tbl.MouseDoubleClick += tbl_MouseDoubleClick;
    }

    async void tbl_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
      var view = Activator.CreateInstance(detailView, tbl.SelectedItem) as ViewBase;
      var mw = (MainWindow)Application.Current.MainWindow;

      await view.LoadData();
      mw.CreateRegister(view);


      mw.FocusRegister(view);
    }

    void CanExecuteCommand(object sender, CanExecuteRoutedEventArgs e)
    {
      e.CanExecute = true;
    }

    void ExecuteNew(object sender, ExecutedRoutedEventArgs e)
    {
      var newEntity = _dataSet.Create();
      Model.Set<TEntity>().Local.Add(newEntity);
    }

    async void ExecuteDelete(object sender, ExecutedRoutedEventArgs e)
    {
      var selectedEntity = tbl.SelectedItems;

      string msg = "Sollen die selektierten Entitäten gelöscht werden?";

      var res = MessageBox.Show(msg, "Löschen", MessageBoxButton.YesNo, MessageBoxImage.Question, MessageBoxResult.No);
      if (res == MessageBoxResult.Yes)
      {
        _dataSet.RemoveRange(selectedEntity.Cast<TEntity>());

        this.IsEnabled = false;

        await Model.SaveChangesAsync();

        this.IsEnabled = true;
      }
    }

    async void ExecuteSave(object sender, ExecutedRoutedEventArgs e)
    {
      this.IsEnabled = false;
      await Model.SaveChangesAsync();
      await this.LoadData();
      this.IsEnabled = true;
    }

    private DbSet<TEntity> _dataSet;

    protected override async Task LoadDataImpl()
    {
      _dataSet = Model.Set<TEntity>();
      await _dataSet.LoadAsync();

      tbl.ItemsSource = _dataSet.Local;

      await TableDefinitionsHelper.ConfigureColumnsForGrid<TEntity>(tbl, this.Model);
    }
  }
}
