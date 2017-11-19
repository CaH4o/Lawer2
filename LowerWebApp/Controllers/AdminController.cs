using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LowerWebApp.Domain.Abstract;

namespace LowerWebApp.Controllers
{
    public class AdminController : Controller
    {
        private IReferenceRepository mRepository;
        private String DB_PATH;

        public AdminController(IReferenceRepository _projectRepository)
        {

            mRepository = _projectRepository;

        }
        // GET: Admin
        public ViewResult Index()
        {
            return View();
        }
    }
}