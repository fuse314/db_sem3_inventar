using DBClient.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace DBClient.Views
{
  public abstract class ViewBase : UserControl
  {
    public string Header { get; set; }

    protected InventarEntities Model { get; set; }

    public ViewBase()
    {
      Header = "Kein Titel";
    }

    public async Task LoadData()
    {
      if (Model == null)
        await Task.Run(() => this.Model = new InventarEntities());

      await LoadDataImpl();
    }

    protected abstract Task LoadDataImpl();
  }
}
