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
  class PositionForDisplay
  {
    public string Rechnungsposition { get; set; }
    public decimal Value { get; set; }
  }

  /// <summary>
  /// Interaction logic for InvoiceDetail.xaml
  /// </summary>
  public partial class InvoiceDetail : ViewBase
  {
    invoice _invoiceToDisplay;

    public InvoiceDetail(invoice invoiceToDisplay)
    {
      _invoiceToDisplay = invoiceToDisplay;
      this.Header = "Rechnung " + _invoiceToDisplay.ID_Invoice;
      InitializeComponent();
    }

    protected override Task LoadDataImpl()
    {
      var positions = from pos in Model.invoiceposition
                      where pos.ID_Invoice == _invoiceToDisplay.ID_Invoice
                      select pos;

      var guthaben = (from x in Model.v_invoices
                      where x.ID_Invoice == _invoiceToDisplay.ID_Invoice
                      select new { OhneGutschrift = x.BetragOhneGutschrift ?? 0, MitGutschrift = x.BetragMitGutschrift ?? 0 }).First();


      List<PositionForDisplay> lst = new List<PositionForDisplay>();
      foreach (var item in positions)
      {
        lst.Add(new PositionForDisplay() { Rechnungsposition = item.Description, Value = item.Price.GetValueOrDefault(0) });
      }

      lst.Add(new PositionForDisplay() { Rechnungsposition = "Rechnungsbetrag: ", Value = guthaben.OhneGutschrift });
      lst.Add(new PositionForDisplay() { Rechnungsposition = "Bereits geleistete Zahlungen: ", Value = guthaben.MitGutschrift - guthaben.OhneGutschrift });
      lst.Add(new PositionForDisplay() { Rechnungsposition = "Unser Guthaben: ", Value = guthaben.MitGutschrift });

      this.tblPositions.ItemsSource = lst;

      return Task.FromResult<bool>(true);

    }
  }
}
