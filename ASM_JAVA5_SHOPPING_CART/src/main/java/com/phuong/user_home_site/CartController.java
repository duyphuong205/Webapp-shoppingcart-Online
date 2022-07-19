package com.phuong.user_home_site;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.model.CartItem;
import com.phuong.repository.CartItemReposittory;
import com.phuong.service.AccountService;
import com.phuong.service.CategoryService;
import com.phuong.service.ShoppingCartService;

@Controller
@RequestMapping("/home")
public class CartController {

	@Autowired
	private ShoppingCartService cart;

	@Autowired
	private CartItemReposittory cartItemReposittory;
	
	@Autowired
	private CategoryService categoryService;
	
	
	@GetMapping("/cart/view")
	public String showView(Model model) {
		model.addAttribute("cart", cart.getItems());
		model.addAttribute("totals", cart.getTotals());
		model.addAttribute("cartSize", cartItemReposittory.findAll().size());
		model.addAttribute("categories", categoryService.getAll());
		return "home/cart";
	}

	@GetMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/home/shop";
	}

	@GetMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/home/cart/view";
	}

	@PostMapping("/cart/update")
	public String update(@RequestParam("id") Integer id, @RequestParam("quantity") Integer quantity) {
		CartItem item = cartItemReposittory.findById(id).get();
		cart.update(item.getId(), quantity);
		return "redirect:/home/cart/view";
	}

	@GetMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/home/cart/view";
	}
}
