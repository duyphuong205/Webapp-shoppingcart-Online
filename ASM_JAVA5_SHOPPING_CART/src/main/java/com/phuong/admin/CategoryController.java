package com.phuong.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.model.Category;
import com.phuong.repository.CategoryRepository;
import com.phuong.service.CategoryService;

@Controller
//@RestController
@RequestMapping("/admin")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping("/category")
	public String formCategory(Model model, @RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 5);
		Page<Category> listPage = categoryRepository.findAll(pageable);
		model.addAttribute("pageCategories", listPage);
		return "admin/categoryList";
	}

	@GetMapping("/category/add")
	public String formCategoryAdd(Model model) {
		model.addAttribute("category", new Category());
		return "admin/categoryCrud";
	}

	@PostMapping("/category/add")
	public String categoryPost(@ModelAttribute("category") Category category) {
		categoryService.insert(category);
		return "redirect:/admin/category";
	}

	@GetMapping("/category/edit/{id}")
	public String formCategoryAdd(@PathVariable("id") String id, Model model) {
		Category category = categoryService.getById(id);
		model.addAttribute("category", category);
		return "admin/categoryCrud";
	}

	@PostMapping("/category/update")
	public String updateCategory(@ModelAttribute("category") Category category) {
		categoryService.update(category);
		return "redirect:/admin/category/edit/" + category.getId();
	}

	@GetMapping("/category/delete/{id}")
	public String deleteCategory(@PathVariable("id") String id) {
		categoryService.delete(id);
		return "redirect:/admin/category";
	}

	@PostMapping("/category/search")
	public String searchBykeyword(Model model, @RequestParam("keyword") String keyword,
			@RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 5);
		Page<Category> searchList = categoryRepository.findByKeyword(keyword, pageable);
		model.addAttribute("pageCategories", searchList);
		return "admin/categoryList";
	}
}
