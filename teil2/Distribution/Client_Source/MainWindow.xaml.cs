using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using DevExpress.Xpf.Core;
using DevExpress.Xpf.Ribbon;
using DevExpress.Xpf.Bars;
using DevExpress.Xpf.Grid;
using DevExpress.Xpf.Printing;
using System.ComponentModel;
using System.Collections.ObjectModel;
using DevExpress.Xpf.NavBar;


namespace DBClient
{
  public partial class MainWindow : DXRibbonWindow
  {
    public MainWindow()
    {
      InitializeComponent();
    }


    internal void CreateRegister(Views.ViewBase view)
    {
      var item = new DXTabItem();
      item.Content = view;
      item.SetBinding(DXTabItem.HeaderProperty, new Binding("Header") { Source = view });
      dxTabControl.Items.Add(item);
    }

    internal void FocusRegister(Views.ViewBase register)
    {
      foreach (DXTabItem item in this.dxTabControl.Items)
      {
        if (item.Content == register)
        {
          this.dxTabControl.SelectedItem = item;
          return;
        }
      }
    }

    public T GetRegisterOfType<T>()
    {
      foreach (DXTabItem item in this.dxTabControl.Items)
      {
        if (item.Content is T)
          return (T)item.Content;
      }

      return default(T);
    }
  }
}
