using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Pet_Care.Models;
using X.PagedList;

namespace Pet_Care.Areas.AdminQL.Controllers
{
    [Area("AdminQL")]
    public class CategoryServicesController : Controller
    {
        private readonly PetCareContext _context;

        public CategoryServicesController(PetCareContext context)
        {
            _context = context;
        }

        // GET: AdminQL/CategoryServices
        public async Task<IActionResult> Index(string account, int page = 1)
        {
            //số bản ghi trên một trang
            int limit = 5;

            var categoryService = await _context.CategoryServices.OrderBy(a => a.CategoryServiceId).ToPagedListAsync(page, limit);
            //nếu có tham số name trên url
            if (!String.IsNullOrEmpty(account))
            {
                categoryService = await _context.CategoryServices.Where(a => a.CategoryServiceName.Contains(account)).OrderBy(a => a.CategoryServiceName).ToPagedListAsync(page, limit);
            }
            ViewBag.keyword = account;
            return View(categoryService);

        }

        // GET: AdminQL/CategoryServices/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var categoryService = await _context.CategoryServices
                .FirstOrDefaultAsync(m => m.CategoryServiceId == id);
            if (categoryService == null)
            {
                return NotFound();
            }

            return View(categoryService);
        }

        // GET: AdminQL/CategoryServices/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: AdminQL/CategoryServices/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CategoryServiceId,CategoryServiceName,Description")] CategoryService categoryService)
        {
            if (ModelState.IsValid)
            {
                _context.Add(categoryService);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(categoryService);
        }

        // GET: AdminQL/CategoryServices/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var categoryService = await _context.CategoryServices.FindAsync(id);
            if (categoryService == null)
            {
                return NotFound();
            }
            return View(categoryService);
        }

        // POST: AdminQL/CategoryServices/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CategoryServiceId,CategoryServiceName,Description")] CategoryService categoryService)
        {
            if (id != categoryService.CategoryServiceId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(categoryService);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CategoryServiceExists(categoryService.CategoryServiceId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(categoryService);
        }

        // GET: AdminQL/CategoryServices/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var categoryService = await _context.CategoryServices
            //    .FirstOrDefaultAsync(m => m.CategoryServiceId == id);
            //if (categoryService == null)
            //{
            //    return NotFound();
            //}

            //return View(categoryService);
            var categoryService = _context.CategoryServices.FirstOrDefault(u => u.CategoryServiceId == id);
            if (categoryService == null)
            {
                // Nếu không tìm thấy người dùng, redirect đến danh sách hoặc hiển thị lỗi
                return NotFound();
            }

            // Tiến hành xóa người dùng
            _context.CategoryServices.Remove(categoryService);
            _context.SaveChanges();

            // Redirect về trang danh sách người dùng hoặc trang khác sau khi xóa thành công
            return RedirectToAction(nameof(Index));  // Giả sử bạn sẽ chuyển hướng về trang danh sách
        }

        private bool CategoryServiceExists(int id)
        {
            return _context.CategoryServices.Any(e => e.CategoryServiceId == id);
        }
    }
}
