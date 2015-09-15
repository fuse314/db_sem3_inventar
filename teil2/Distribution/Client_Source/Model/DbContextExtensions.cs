using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBClient.Model
{
  partial class InventarEntities
  {
    public static string ConnectionString { get; set; }

    public InventarEntities()
      : base(ConnectionString)
    {
    }
  }

  partial class customer
  {
    public string Description
    {
      get
      {
        return this.Name;
      }
    }
  }
}
