using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Markup;

namespace DBClient.Views
{
  [ContentProperty("Columns")]
  public class TableDefinition
  {
    public TableDefinition()
    {
      this.Columns = new List<ColumnDefinition>();
    }

    public string Header { get; set; }

    public List<ColumnDefinition> Columns { get; set; }

    public Type DetailView { get; set; }
  }

  public class ColumnDefinition
  {
    public string Header { get; set; }

    public string FieldName { get; set; }

    public bool AllowEditing { get; set; }

    public Type References { get; set; }
  }
}
