using LowerWebApp.Domain.Abstract;
using LowerWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LowerWebApp.Domain.Concrete
{
    public class EFReferencesRepository : IReferenceRepository
    {
        public EFDbContext context = new EFDbContext();

        public IQueryable<Reference> References
        {
            get { return context.References; }
        }

        public IQueryable<Employee> Employees
        {
            get { return context.Employees; }
        }
    }
}
