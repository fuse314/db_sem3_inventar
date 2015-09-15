using DBClient.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
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
  /// <summary>
  /// Interaction logic for CustomerDetail.xaml
  /// </summary>
  public partial class CustomerDetail : ViewBase
  {
    customer _customerFromSearch;
    public customer Data { get; private set; }

    public CustomerDetail(customer customerFromSearch)
    {
      _customerFromSearch = customerFromSearch;

      InitializeComponent();


      this.CommandBindings.Add(new CommandBinding(CustomCommands.Fakturieren, FakturierePod, CanExecuteCommand));
      this.CommandBindings.Add(new CommandBinding(ApplicationCommands.Save, Save, (o, e) => e.CanExecute = true));
    }

    private async void Save(object sender, ExecutedRoutedEventArgs e)
    {
      await this.Model.SaveChangesAsync();
    }

    void CanExecuteCommand(object sender, CanExecuteRoutedEventArgs e)
    {
      if (tblPods.SelectedItem != null)
        e.CanExecute = true;
    }

    void FakturierePod(object sender, ExecutedRoutedEventArgs e)
    {
      var p = tblPods.SelectedItem as pod;


      Model.P_PodBill(p.ID_Pod);
      Model.invoice.Local.Clear();
      Model.invoiceposition.Local.Clear();

      MessageBox.Show("POD fakturiert.");
    }


    protected override Task LoadDataImpl()
    {
      Data = (from x in Model.customer
              where x.ID_Customer == _customerFromSearch.ID_Customer
              select x).First();

      this.Header = "Kunde - " + Data.Name;

      var pods = from x in Model.pod
                 where x.ID_Customer == Data.ID_Customer
                 select x;

      this.tblPods.ItemsSource = pods.ToList();

      var rechnungen = from x in Model.v_invoices
                       where x.ID_Customer == Data.ID_Customer
                       select x;




      this.tblRechnungen.ItemsSource = rechnungen.ToList();

      this.DataContext = Data;

      return Task.FromResult<bool>(true);

    }

    private async void tblRechnungen_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
      if (tblRechnungen.SelectedItem != null)
      {
        v_invoices i = tblRechnungen.SelectedItem as v_invoices;

        var invoice = Model.invoice.Find(i.ID_Invoice);

        var view = new InvoiceDetail(invoice);

        ((MainWindow)Application.Current.MainWindow).CreateRegister(view);
        await view.LoadData();

      }
    }
  }
}
