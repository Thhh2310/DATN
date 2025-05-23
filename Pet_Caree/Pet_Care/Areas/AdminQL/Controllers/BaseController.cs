﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Pet_Care.Areas.AdminQL.Controllers
{
    [Area("AdminQL")]
    public class BaseController : Controller, IActionFilter
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.Session.GetString("AdminLogin") == null)
            {
                context.Result = new RedirectToRouteResult(
                    new RouteValueDictionary(new { Controller = "Login", Action = "Index", Areas = "AdminQL" }));
            }
            base.OnActionExecuting(context);
        }
    }
}
