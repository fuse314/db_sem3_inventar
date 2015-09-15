using DBClient.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.EntityClient;
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
using System.Windows.Shapes;

namespace DBClient
{
  /// <summary>
  /// Interaction logic for SplashScreen.xaml
  /// </summary>
  public partial class SplashScreen : Window
  {


    public string Server
    {
      get { return (string)GetValue(ServerProperty); }
      set { SetValue(ServerProperty, value); }
    }

    // Using a DependencyProperty as the backing store for Server.  This enables animation, styling, binding, etc...
    public static readonly DependencyProperty ServerProperty =
        DependencyProperty.Register("Server", typeof(string), typeof(SplashScreen), new PropertyMetadata(null));



    public string Database
    {
      get { return (string)GetValue(DatabaseProperty); }
      set { SetValue(DatabaseProperty, value); }
    }

    // Using a DependencyProperty as the backing store for Database.  This enables animation, styling, binding, etc...
    public static readonly DependencyProperty DatabaseProperty =
        DependencyProperty.Register("Database", typeof(string), typeof(SplashScreen), new PropertyMetadata(null));



    public string Username
    {
      get { return (string)GetValue(UsernameProperty); }
      set { SetValue(UsernameProperty, value); }
    }

    // Using a DependencyProperty as the backing store for Username.  This enables animation, styling, binding, etc...
    public static readonly DependencyProperty UsernameProperty =
        DependencyProperty.Register("Username", typeof(string), typeof(SplashScreen), new PropertyMetadata(null));

    public SplashScreen()
    {
      InitializeComponent();
      this.Server = "yp.gma.name";
      this.Username = "inp1316_usr";
      passwd.Password = "xaPn4Qn5FU";
      this.Database = "inventar";
      this.DataContext = this;
    }

    private async void Button_Click(object sender, RoutedEventArgs e)
    {
      try
      {
        var connectionString = new MySql.Data.MySqlClient.MySqlConnectionStringBuilder();

        connectionString.Add("server", this.Server);
        connectionString.Add("user id", this.Username);
        connectionString.Add("password", this.passwd.Password);
        connectionString.Add("persistsecurityinfo", "True");
        connectionString.Add("database", this.Database);


        var conn = new MySql.Data.MySqlClient.MySqlConnection(connectionString.GetConnectionString(true));

        await conn.OpenAsync();

        EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
        entityBuilder.Provider = "MySql.Data.MySqlClient";
        string providerString = connectionString.GetConnectionString(true);

        entityBuilder.ProviderConnectionString = providerString;

        entityBuilder.Metadata = "res://*/Model.InventarModel.csdl|res://*/Model.InventarModel.ssdl|res://*/Model.InventarModel.msl";


        InventarEntities.ConnectionString = entityBuilder.ToString();


        var mw = new MainWindow();
        Application.Current.MainWindow = mw;
        mw.Show();
        this.Close();
      }
      catch (MySql.Data.MySqlClient.MySqlException mse)
      {
        MessageBox.Show(mse.ToString());
      }
    }
  }
}
