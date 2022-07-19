package com.phuong.admin;

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

import com.phuong.model.CartItem;
import com.phuong.repository.CartItemReposittory;

@Controller
@RequestMapping("/admin")
public class CartItemController {

	@Autowired
	private CartItemReposittory cartItemReposittory;

	@GetMapping("/cartitem")
	public String cart_itemView(Model model, @RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 5);
		Page<CartItem> pageCartItem = cartItemReposittory.findAll(pageable);
		model.addAttribute("pageCartItems", pageCartItem.getContent());
		model.addAttribute("pageNumber", pageCartItem.getNumber());
		model.addAttribute("pageTotals", pageCartItem.getTotalPages());
		return "admin/cartitemList";
	}

	@GetMapping("/cartitem/delete/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cartItemReposittory.deleteById(id);
		return "redirect:/admin/cartitem";
	}

	@PostMapping("/cartitem/search")
	public String search(Model model, @RequestParam("page") Optional<Integer> pageIndex,
			@RequestParam("keyword") Optional<String> keyword) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 5);
		Page<CartItem> pageCartItem;
		if (keyword.isPresent()) {
			pageCartItem = cartItemReposittory.findByKeyword(keyword.get(), pageable);
		} else {
			pageCartItem = cartItemReposittory.findAll(pageable);
		}
		model.addAttribute("pageCartItems", pageCartItem.getContent());
		model.addAttribute("pageNumber", pageCartItem.getNumber());
		model.addAttribute("pageTotals", pageCartItem.getTotalPages());
		return "admin/cartitemList";
	}
}
