using LowerWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LowerWebApp.Domain.Concrete
{
    public class EFDbContext : DbContext
    {
        public EFDbContext()
        {
            var instance = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
        }
        public DbSet<Reference> References { get; set; }
    }
}
