using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LowerWebApp.Domain.Abstract;
using LowerWebApp.Domain.Entities;

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

        //[HttpPost]
        [HttpGet]
        public JsonResult DoAction()
        {
            dynamic result = new { };
            if (Request["action"] != null)
            {
                String actionString = Request["action"];
                DB_PATH = Server.MapPath("~/App_Data/");
                switch (actionString)
                {
                    case "auth":
                        {
                            if (Request["username"] != null)
                            {
                                String usernameString = Request["username"];

                                Employee emp =
                                    mRepository.Employees
                                    //.Where(currentEmp => currentEmp.name_employee == Request["username"])
                                    //.Where(currentEmp => true)
                                    //.Where(currentEmp => currentEmp.name_employee == "asd")
                                    .Where(currentEmp => currentEmp.name_employee == usernameString)
                                    .FirstOrDefault();

                                if (emp != null)
                                {
                                    result = "ok";
                                }
                                else
                                {
                                    result = "not found";
                                }
                            }
                            break;
                        }
                    case "edit-page-data":
                        {
                            /*if (Request["id"] != null
                                && Request["title"] != null
                                && Request["content"] != null)
                            {
                                try
                                {
                                    mRepository.UpdatePageDataById(
                                            Int32.Parse(Request["id"])
                                            , Request["title"]
                                            , Request["content"]
                                            , DB_PATH);
                                    result = new { ok = "ok" };
                                }
                                catch (Exception)
                                {

                                    result = new { error = "error" };
                                }
                            }*/
                            break;
                        }
                    case "get-page-data":
                        {
                            /*if (Request["id"] != null)
                            {
                                try
                                {
                                    PageData pd =
                                        mRepository.GetPageDataById(
                                                Int32.Parse(Request["id"])
                                                , DB_PATH);
                                    if (pd != null)
                                    {
                                        result =
                                            new
                                            {
                                                id = pd.id
                                                ,
                                                title = pd.title
                                                ,
                                                content = pd.content
                                            };
                                    }
                                    else
                                    {
                                        throw new Exception();
                                    }
                                }
                                catch (Exception ex)
                                {

                                    result = new { error = "error", message = ex.Message };
                                }
                            }*/
                            break;
                        }
                    case "get-pages-data-lazy":
                        {
                            /*try
                            {
                                IEnumerable<PageData> pd =
                                    mRepository.GetPagesTitles(DB_PATH);
                                if (pd != null)
                                {
                                    result =
                                        new
                                        {
                                            pagesData = pd.ToArray()
                                        };
                                }
                                else
                                {
                                    throw new Exception();
                                }
                            }
                            catch (Exception)
                            {

                                result = new { error = "error" };
                            }*/
                            break;
                        }
                    case "get-pages-data":
                        {
                            /*try
                            {
                                IEnumerable<PageData> pd =
                                    mRepository.GetPagesData(DB_PATH);
                                if (pd != null)
                                {
                                    result =
                                        new
                                        {
                                            pagesData = pd.ToArray()
                                        };
                                }
                                else
                                {
                                    throw new Exception();
                                }
                            }
                            catch (Exception)
                            {

                                result = new { error = "error" };
                            }*/
                            break;
                        }
                    default:
                        break;
                }
            }
            //
            /*var result =
                from item in mRepository.Project
                where (item.Id == _projectId)
                select new { item.Id, item.User, item.Width, item.Height };*/
            return Json(result, JsonRequestBehavior.AllowGet);
            //return Json(result);
        }
    }
}