using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LowerWebApp.Domain.Entities
{
    public class Reference
    {
        [Key]
        public string Lable { get; set; }
        public string EN_name { get; set; }
        public string Ru_name { get; set; }
    }
}
