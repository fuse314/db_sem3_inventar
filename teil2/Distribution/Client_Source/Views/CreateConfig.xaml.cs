using DBClient.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
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
  /// Interaction logic for InvoiceDetail.xaml
  /// </summary>
  public partial class CreateConfig : ViewBase
  {


    public int ID_Device
    {
      get { return (int)GetValue(ID_DeviceProperty); }
      set { SetValue(ID_DeviceProperty, value); }
    }

    // Using a DependencyProperty as the backing store for ID_Device.  This enables animation, styling, binding, etc...
    public static readonly DependencyProperty ID_DeviceProperty =
        DependencyProperty.Register("ID_Device", typeof(int), typeof(CreateConfig), new PropertyMetadata(0));



    public CreateConfig()
    {
      this.Header = "Erzeuge Gerätekonfiguration";
      InitializeComponent();
      this.DataContext = this;
    }

    protected override Task LoadDataImpl()
    {
      return Task.FromResult(true);
    }

    private void Button_Click(object sender, RoutedEventArgs e)
    {
      var device = Model.device.First(x => x.ID_Device == ID_Device);

      var pod = (from y in Model.pod
                 where y.ID_Pod == (from x in Model.location
                                    where x.ID_Location == device.ID_Location
                                    select x.ID_Pod).FirstOrDefault()
                 select y).FirstOrDefault();

      var networkInterfaces = from iface in Model.networkinterface
                              where iface.ID_Device == ID_Device
                              select iface;

      var relInterfaces = from relIface in Model.relnetworkinterface
                          where networkInterfaces.Any(x => x.ID_Networkinterface == relIface.ID_NetworkinterfaceA ||
                                                           x.ID_Networkinterface == relIface.ID_NetworkinterfaceB)
                          select relIface;

      var relVlans = from x in Model.relnetworkinterfacevlan
                     where relInterfaces.Any(y => y.ID_RelNetworkinterface == x.ID_RelNetworkinterface)
                     select x.ID_VLAN;

      StringBuilder sb = new StringBuilder();

      foreach (var item in relVlans)
      {
        var vlan = Model.vlan.Find(item);
        sb.AppendFormat("vlan {0}{1}", item, Environment.NewLine);
        sb.AppendFormat("   name {0}{1}", vlan.Identifier, Environment.NewLine);
      }
      sb.AppendLine();

      foreach (var item in networkInterfaces)
      {
        var vlanRel = (from x in relInterfaces
                       join y in Model.relnetworkinterfacevlan on x.ID_RelNetworkinterface equals y.ID_RelNetworkinterface
                       where x.ID_NetworkinterfaceA == item.ID_Networkinterface ||
                             x.ID_NetworkinterfaceB == item.ID_Networkinterface
                       select y).FirstOrDefault();
        if (vlanRel != null)
        {
          var vlan = Model.vlan.Find(vlanRel.ID_VLAN);

          sb.AppendFormat("interface vlan {0}{1}", vlanRel.ID_VLAN, Environment.NewLine);

          sb.AppendFormat("   nameif {0}{1}", item.Description, Environment.NewLine);
          sb.AppendLine("   security level 10");

          var ipaddr = IPAddressFromLong(item.IPv4_Address.GetValueOrDefault(0));

          var subnet = IPAddressFromLong(item.IPv4_SubnetMask.GetValueOrDefault(0));
          sb.AppendFormat("ip address {0} {1} {2}", ipaddr, subnet, Environment.NewLine);
          if (item.IPv4_DefaultGateway.HasValue)
          {
            var gw = IPAddressFromLong(item.IPv4_DefaultGateway.GetValueOrDefault(0));
            sb.AppendFormat("ip default-gateway {0} {1}", ipaddr, Environment.NewLine);
          }
        }
        else
        {
          sb.AppendFormat("interface {0}", Environment.NewLine);

          sb.AppendFormat("   nameif {0}{1}", item.Description, Environment.NewLine);
          sb.AppendLine("   security level 10");

          var ipaddr = IPAddressFromLong(item.IPv4_Address.GetValueOrDefault(0));

          var subnet = IPAddressFromLong(item.IPv4_SubnetMask.GetValueOrDefault(0));
          sb.AppendFormat("   ip address {0} {1} {2}", ipaddr, subnet, Environment.NewLine);
          if (item.IPv4_DefaultGateway.HasValue)
          {
            var gw = IPAddressFromLong(item.IPv4_DefaultGateway.GetValueOrDefault(0));
            sb.AppendFormat("   ip default-gateway {0} {1}", ipaddr, Environment.NewLine);
          }
        }
      }

      sb.AppendLine();

      var users = from x in Model.credential
                  join y in Model.reldevicecredential on x.ID_Credential equals y.ID_Credential
                  where y.ID_Device == ID_Device
                  select x;


      foreach (var item in users)
      {
        sb.AppendFormat("username {0}{1}", item.UserName, Environment.NewLine);
        sb.AppendFormat("   privilege {0}{1}", item.PrivilegeLevel, Environment.NewLine);
        sb.AppendFormat("   password {0}{1}", item.Password, Environment.NewLine);
      }


      sb.AppendLine();

      var ipAddr = IPAddressFromLong(pod.NameServer.GetValueOrDefault(0));
      sb.AppendFormat("ip domain-name {0}{1}", pod.DomainName, Environment.NewLine);
      sb.AppendFormat("ip name-server {0}{1}", ipAddr, Environment.NewLine);
      sb.AppendFormat("clock timezone {0}{1}", pod.TimeZone, Environment.NewLine);
      ipAddr = IPAddressFromLong(pod.SntpServer.GetValueOrDefault(0));
      sb.AppendFormat("sntp server {0}{1}", ipAddr, Environment.NewLine);

      this.configOutput.Text = sb.ToString().Trim(new char[] { ' ', '\r', '\n' }); ;
    }

    private static IPAddress IPAddressFromLong(long val)
    {
      if (val == 0) { return IPAddress.None; }
      var bytes = BitConverter.GetBytes(val);
      return new IPAddress(bytes.Take(4).Reverse().ToArray());
    }
  }
}
