using LowerWebApp.Domain.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LowerWebApp.Controllers
{
    public class DefaultController : Controller
    {
        private IReferenceRepository repository;

        public DefaultController(IReferenceRepository _repository)
        {
            repository = _repository;
        }

        // GET: Default
        public ViewResult Index()
        {
            return View(repository.References);
        }
    }
}