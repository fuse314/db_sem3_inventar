using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBClient
{
  class OpenEntityTableCommand<TEntity> : OpenTabItemCommand<Views.EntityListView<TEntity>>
    where TEntity : class, new()
  {
    public OpenEntityTableCommand() : base(false) { }
  }
}
