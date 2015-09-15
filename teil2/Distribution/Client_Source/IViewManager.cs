using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DBClient
{
  public interface IViewManager
  {
    void CreateNewRegister<TView>() where TView : Views.ViewBase;
  }
}
