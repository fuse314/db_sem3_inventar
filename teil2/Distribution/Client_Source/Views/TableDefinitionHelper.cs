using DevExpress.Utils;
using DevExpress.Xpf.Editors.Settings;
using DevExpress.Xpf.Grid;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Data.Entity;
using DBClient.Model;

namespace DBClient.Views
{
  public static class TableDefinitionsHelper
  {
    public static string GetHeaderForEntity<TEntity>()
    {
      return GetTableDefinition<TEntity>().Header;
    }

    public static Type GetDetailViewForEntity<TEntity>()
    {
      return GetTableDefinition<TEntity>().DetailView;
    }

    public static async Task ConfigureColumnsForGrid<TEntity>(GridControl grid, InventarEntities model)
    {
      grid.Columns.BeginUpdate();
      grid.Columns.Clear();

      var tableDef = GetTableDefinition<TEntity>();
      var cols = new List<GridColumn>();
      foreach (var item in tableDef.Columns)
      {
        var newcol = new GridColumn()
        {
          Header = item.Header,
          FieldName = item.FieldName,
          AllowEditing = item.AllowEditing ? DefaultBoolean.True : DefaultBoolean.False
        };

        if (item.References != null)
        {
          var set = model.Set(item.References);
          await set.LoadAsync();
          newcol.EditSettings = new ComboBoxEditSettings() { ItemsSource = set.Local, DisplayMember = "Description", ValueMember = item.FieldName };
        }

        cols.Add(newcol);

      }

      grid.ColumnsSource = cols;

      grid.Columns.EndUpdate();
    }

    private static TableDefinition GetTableDefinition<TEntity>()
    {

      var cols = Application.Current.TryFindResource("TABLE_" + typeof(TEntity).Name.ToUpper()) as TableDefinition;
      return cols;
    }
  }
}
