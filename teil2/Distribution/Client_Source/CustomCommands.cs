using DBClient.Model;
using DBClient.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace DBClient
{
  public static class CustomCommands
  {
    public static readonly ICommand Fakturieren = new RoutedCommand("Fakturieren", typeof(CustomerDetail));
    public static readonly ICommand OpenKunden = new OpenEntityTableCommand<customer>();
    public static readonly ICommand OpenDeviceType = new OpenEntityTableCommand<devicetype>();
    public static readonly ICommand OpenDeviceCategory = new OpenEntityTableCommand<devicecategory>();
    public static readonly ICommand OpenCommunicationType = new OpenEntityTableCommand<communicationtype>();
    public static readonly ICommand OpenMediumType = new OpenEntityTableCommand<mediumtype>();
    public static readonly ICommand OpenServiceType = new OpenEntityTableCommand<servicetype>();
    public static readonly ICommand OpenUnit = new OpenEntityTableCommand<unit>();
    public static readonly ICommand OpenRate = new OpenEntityTableCommand<rate>();
    public static readonly ICommand OpenDevice = new OpenEntityTableCommand<device>();
    public static readonly ICommand OpenLocation = new OpenEntityTableCommand<location>();
    public static readonly ICommand OpenPod = new OpenEntityTableCommand<pod>();
    public static readonly ICommand OpenInvoice = new OpenEntityTableCommand<invoice>();
    public static readonly ICommand OpenInvoicePosition = new OpenEntityTableCommand<invoiceposition>();

    public static readonly ICommand OpenCreateConfig = new OpenTabItemCommand<CreateConfig>(false);
  }
}