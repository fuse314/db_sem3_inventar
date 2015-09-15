using DBClient.Views;
using System;
using System.Windows;
using System.Windows.Input;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBClient
{
  class OpenTabItemCommand<T> : ICommand
    where T : Views.ViewBase, new()
  {
    public bool AllowMultipleInstances { get; private set; }

    public OpenTabItemCommand(bool allowMultipleInstances)
    {
      AllowMultipleInstances = allowMultipleInstances;
    }

    public bool CanExecute(object parameter)
    {
      return true;
    }

    public async void Execute(object parameter)
    {
      var mw = (MainWindow)Application.Current.MainWindow;

      T register = mw.GetRegisterOfType<T>();
      if (register == null || AllowMultipleInstances)
      {
        register = new T();
        await register.LoadData();
        mw.CreateRegister(register as Views.ViewBase);
      }

      mw.FocusRegister(register as Views.ViewBase);
    }

#pragma warning disable 67
    public event EventHandler CanExecuteChanged;
#pragma warning restore 67
  }
}
