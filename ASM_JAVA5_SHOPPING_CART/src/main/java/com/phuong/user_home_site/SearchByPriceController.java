package com.phuong.user_home_site;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.model.Product;
import com.phuong.repository.CartItemReposittory;
import com.phuong.repository.ProductRepository;
import com.phuong.service.CategoryService;
import com.phuong.service.ShoppingCartService;

@Controller
@RequestMapping("/home")
public class SearchByPriceController {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CartItemReposittory cartItemReposittory;;

	@GetMapping("/search-by-price")
	public String searchPrice(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max, @RequestParam("page") Optional<Integer> pageIndex) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 8);
		Page<Product> listPage = productRepository.findByPrice(minPrice, maxPrice, pageable);
		model.addAttribute("pageProducts", listPage.getContent());
		model.addAttribute("pageNumber", listPage.getNumber());
		model.addAttribute("pageTotalPages", listPage.getTotalPages());
		model.addAttribute("categories", categoryService.getAll());
		model.addAttribute("cartSize", cartItemReposittory.findAll().size());
		return "home/shop";
	}
}
