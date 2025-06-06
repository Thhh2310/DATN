﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Pet_Care.Models;

namespace Pet_Care.Controllers
{
    public class ServicesController : Controller
    {
        private readonly PetCareContext _context;

        public ServicesController(PetCareContext context)
        {
            _context = context;
        }

        // GET: Services
        public async Task<IActionResult> Index(int id)
        {
            ViewBag.ServiceCategories = _context.CategoryServices.ToList();

            var category = _context.CategoryServices.Find(id);
            if (category == null)
            {
                return NotFound();
            }

            var services = _context.Services
                .Where(s => s.CategoryServiceId == id)
                .ToList();

            ViewBag.ServiceName = category.CategoryServiceName;
            return View(services);
        }

        // GET: Services/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            ViewBag.ServiceCategories = _context.CategoryServices.ToList();

            if (id == null)
            {
                return NotFound();
            }

            var service = await _context.Services
                .Include(s => s.CategoryService)
                .FirstOrDefaultAsync(m => m.ServiceId == id);
            if (service == null)
            {
                return NotFound();
            }

            return View(service);
        }

        // GET: Services/Create
        public IActionResult Create()
        {
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceId");
            return View();
        }

        // POST: Services/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ServiceId,CategoryServiceId,ServiceName,Description,Price,Status,CreatedDate,Image,OldPrice")] Service service)
        {
            if (ModelState.IsValid)
            {
                _context.Add(service);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceId", service.CategoryServiceId);
            return View(service);
        }

        // GET: Services/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var service = await _context.Services.FindAsync(id);
            if (service == null)
            {
                return NotFound();
            }
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceId", service.CategoryServiceId);
            return View(service);
        }

        // POST: Services/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ServiceId,CategoryServiceId,ServiceName,Description,Price,Status,CreatedDate,Image,OldPrice")] Service service)
        {
            if (id != service.ServiceId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(service);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ServiceExists(service.ServiceId))
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
            ViewData["CategoryServiceId"] = new SelectList(_context.CategoryServices, "CategoryServiceId", "CategoryServiceId", service.CategoryServiceId);
            return View(service);
        }

        // GET: Services/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var service = await _context.Services
                .Include(s => s.CategoryService)
                .FirstOrDefaultAsync(m => m.ServiceId == id);
            if (service == null)
            {
                return NotFound();
            }

            return View(service);
        }

        // POST: Services/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var service = await _context.Services.FindAsync(id);
            if (service != null)
            {
                _context.Services.Remove(service);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ServiceExists(int id)
        {
            return _context.Services.Any(e => e.ServiceId == id);
        }
    }
}
