package com.phuong.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phuong.model.Account;
import com.phuong.model.CartItem;
import com.phuong.model.Product;
import com.phuong.repository.CartItemReposittory;
import com.phuong.service.AccountService;
import com.phuong.service.ProductService;
import com.phuong.service.ShoppingCartService;
import com.phuong.utils.SessionUtils;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	Map<Integer, CartItem> map = new HashMap<>();

	@Autowired
	private ProductService productService;

	@Autowired
	private CartItemReposittory cartItemReposittory;

	@Autowired
	private AccountService accountService;

	@Autowired
	private SessionUtils session;


	@Override
	public CartItem add(Integer id) {
		CartItem item = map.get(id);
		if (item == null) {
			Product product = productService.getById(id);
			Account account = session.getAttibute("user");
			item = new CartItem();
			item.setId(product.getId());
			item.setName(product.getName());
			item.setImage(product.getImage());
			item.setPrice(product.getPrice());
			item.setProduct(productService.getById(product.getId()));
			if (account != null) {
				item.setAccount(accountService.getById(account.getUsername()));
			}
			item.setQuantity(1);
			map.put(id, item);

		} else {
			item.setQuantity(item.getQuantity() + 1);
		}
		cartItemReposittory.save(item);
		return item;
	}

	@Override
	public CartItem update(Integer id, Integer quantity) {
		CartItem item = cartItemReposittory.findById(id).get();
		item.setQuantity(quantity);
		cartItemReposittory.save(item);
		return item;
	}

	@Override
	public void remove(Integer id) {
		cartItemReposittory.deleteById(id);

	}

	@Override
	public void clear() {
		cartItemReposittory.deleteAll();

	}

	@Override
	public Collection<CartItem> getItems() {
		return cartItemReposittory.findAll();
	}

	@Override
	public Integer getCounts() {
		return map.values().stream().mapToInt(item -> item.getQuantity()).sum();
	}

	@Override
	public Double getAmounts() {
		return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
	}

	@Override
	public Double getTotals() {
		double total = 0;
		for (CartItem item : cartItemReposittory.findAll()) {
			total += (item.getPrice() * item.getQuantity());
		}
		return total;
	}

}
