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
    public class PetsController : Controller
    {
        private readonly PetCareContext _context;

        public PetsController(PetCareContext context)
        {
            _context = context;
        }

        // GET: AdminQL/Pets
        public async Task<IActionResult> Index(string account, int page = 1)
        {
            //số bản ghi trên một trang
            int limit = 5;

            var pet = await _context.Pets.OrderBy(a => a.PetId).ToPagedListAsync(page, limit);
            //nếu có tham số name trên url
            if (!String.IsNullOrEmpty(account))
            {
                pet = await _context.Pets.Where(a => a.PetName.Contains(account)).OrderBy(a => a.PetName).ToPagedListAsync(page, limit);
            }
            ViewBag.keyword = account;
            return View(pet);

        }

        // GET: AdminQL/Pets/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pet = await _context.Pets
                .Include(p => p.Category)
                .Include(p => p.Customer)
                .FirstOrDefaultAsync(m => m.PetId == id);
            if (pet == null)
            {
                return NotFound();
            }

            return View(pet);
        }

        // GET: AdminQL/Pets/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "Type");
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName");
            return View();
        }

        // POST: AdminQL/Pets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PetId,CustomerId,CategoryId,PetName,Age,Weight,Color,Notes")] Pet pet)
        {
            if (ModelState.IsValid)
            {
                _context.Add(pet);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", pet.CategoryId);
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "CustomerId", pet.CustomerId);
            return View(pet);
        }

        // GET: AdminQL/Pets/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pet = await _context.Pets.FindAsync(id);
            if (pet == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "Type", pet.CategoryId);
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "FullName", pet.CustomerId);
            return View(pet);
        }

        // POST: AdminQL/Pets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PetId,CustomerId,CategoryId,PetName,Age,Weight,Color,Notes")] Pet pet)
        {
            if (id != pet.PetId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(pet);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PetExists(pet.PetId))
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
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", pet.CategoryId);
            ViewData["CustomerId"] = new SelectList(_context.Customers, "CustomerId", "CustomerId", pet.CustomerId);
            return View(pet);
        }

        // GET: AdminQL/Pets/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            //if (id == null)
            //{
            //    return NotFound();
            //}

            //var pet = await _context.Pets
            //    .Include(p => p.Category)
            //    .Include(p => p.Customer)
            //    .FirstOrDefaultAsync(m => m.PetId == id);
            //if (pet == null)
            //{
            //    return NotFound();
            //}

            //return View(pet);
            var pet = _context.Pets.FirstOrDefault(u => u.PetId == id);
            if (pet == null)
            {
                // Nếu không tìm thấy người dùng, redirect đến danh sách hoặc hiển thị lỗi
                return NotFound();
            }

            // Tiến hành xóa người dùng
            _context.Pets.Remove(pet);
            _context.SaveChanges();

            // Redirect về trang danh sách người dùng hoặc trang khác sau khi xóa thành công
            return RedirectToAction(nameof(Index));  // Giả sử bạn sẽ chuyển hướng về trang danh sách
        }

        private bool PetExists(int id)
        {
            return _context.Pets.Any(e => e.PetId == id);
        }
    }
}
