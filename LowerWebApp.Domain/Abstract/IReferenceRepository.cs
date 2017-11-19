using LowerWebApp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LowerWebApp.Domain.Abstract
{
    public interface IReferenceRepository
    {
        IQueryable<Reference> References { get; }
        IQueryable<Employee> Employees { get; }
    }
}
