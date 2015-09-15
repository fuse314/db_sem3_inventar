using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Windows;

namespace DBClient
{
  /// <summary>
  /// Interaction logic for App.xaml
  /// </summary>
  public partial class App : Application
  {
    protected override void OnStartup(StartupEventArgs e)
    {
      AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;
      this.DispatcherUnhandledException += App_DispatcherUnhandledException;
      base.OnStartup(e);
    }

    void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
    {
      MessageBox.Show(e.ExceptionObject.ToString());
    }

    void App_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
    {
      e.Handled = true;
      MessageBox.Show(e.Exception.ToString());
    }
  }
}
