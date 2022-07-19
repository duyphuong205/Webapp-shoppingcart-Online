package com.phuong.user_home_site;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.model.Product;
import com.phuong.repository.CartItemReposittory;
import com.phuong.repository.ProductRepository;
import com.phuong.service.CategoryService;
import com.phuong.service.ProductService;
import com.phuong.service.ShoppingCartService;

@Controller
@RequestMapping("/home")
public class ShopController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private CartItemReposittory cartItemReposittory;

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/shop")
	public String homeShop(Model model, @RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 8);
		Page<Product> page = productRepository.findAll(pageable);
		model.addAttribute("pageProducts", page.getContent());
		model.addAttribute("pageNumber", page.getNumber());
		model.addAttribute("pageTotalPages", page.getTotalPages());
		model.addAttribute("categories", categoryService.getAll());
		model.addAttribute("cartSize", cartItemReposittory.findAll().size());
		return "home/shop";
	}

	@GetMapping("/category/{id}")
	public String findProductByCategoryId(Model model, @PathVariable("id") String id,
			@RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 8);
		Page<Product> page = productService.findProductByCategoryId(id, pageable);
		model.addAttribute("categories", categoryService.getAll());
		model.addAttribute("pageProducts", page.getContent());
		model.addAttribute("pageNumber", page.getNumber());
		model.addAttribute("pageTotalPages", page.getTotalPages());
		return "home/shop";
	}

	@GetMapping("/productDeatail/{id}")
	public String viewProduct(Model model, @PathVariable("id") Integer id) {
		model.addAttribute("product", productService.getById(id));
		model.addAttribute("cartSize", cartItemReposittory.findAll().size());
		return "home/detail";
	}

	@PostMapping("/search")
	public String formSearch(@RequestParam("keyword") String keyword, Model model,
			@RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 8);
		Page<Product> page = productRepository.findByKeyword(keyword, pageable);
		model.addAttribute("pageProducts", page.getContent());
		model.addAttribute("categories", categoryService.getAll());
		return "home/shop";
	}
}
