package com.phuong.user_home_site;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.model.Account;
import com.phuong.model.CartItem;
import com.phuong.model.Order;
import com.phuong.model.OrderDetail;
import com.phuong.model.Product;
import com.phuong.repository.CartItemReposittory;

import com.phuong.service.AccountService;
import com.phuong.service.CategoryService;
import com.phuong.service.MailService;
import com.phuong.service.OrderDetailService;
import com.phuong.service.OrderService;
import com.phuong.service.ProductService;
import com.phuong.service.ShoppingCartService;
import com.phuong.utils.SessionUtils;

@Controller
@RequestMapping("/home")
public class CheckoutController {

	@Autowired
	private ShoppingCartService cart;

	@Autowired
	private CartItemReposittory cartItemReposittory;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SessionUtils session;

	@Autowired
	private AccountService accountService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private MailService mailService;

	@GetMapping("/checkout")
	public String checkout(Model model) {
		model.addAttribute("cart", cart.getItems());
		model.addAttribute("totals", cart.getTotals());
		model.addAttribute("cartSize", cartItemReposittory.findAll().size());
		model.addAttribute("categories", categoryService.getAll());
		return "home/checkout";
	}

	@PostMapping("/checkout")
	public String checkout(@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("email") String email,Model model) {
		Account accCurrent = session.getAttibute("user");
		if (accCurrent != null) {
			accountService.getById(accCurrent.getUsername());
			Order order = new Order();
			order.setAccount(accCurrent);
			order.setCreatedate(new Date());
			order.setPhone(phone);
			order.setAddress(address);
			orderService.insert(order);
			for (CartItem item : cart.getItems()) {
				OrderDetail order_detail = new OrderDetail();
				order_detail.setPrice(item.getPrice());
				order_detail.setQuantity(item.getQuantity());
				order_detail.setOrder(order);
				Product product = productService.getById(item.getProduct().getId());
				order_detail.setProduct(product);
				orderDetailService.insert(order_detail);
			}
			cart.clear();

			try {
				List<OrderDetail> items = orderDetailService.getAll();
				String fullname = "";
				String addressOrder = "";
				String phoneOrder = "";
				String productName = "";
				int quantity = 0;
				double price = 0;
				double total = 0;
				for (OrderDetail item : items) {
					fullname = item.getOrder().getAccount().getFullname();
					addressOrder = item.getOrder().getAddress();
					phoneOrder = item.getOrder().getPhone();
					productName = item.getProduct().getName();
					quantity = item.getQuantity();
					price = item.getPrice();
					total += (item.getPrice() * item.getQuantity());
				}
				mailService.send(email, "XÁC NHẬN ĐƠN HÀNG",
						"<html><body><h1 style='color:#8A2BE2;margin-left: 15%;'>THÔNG TIN CHI TIẾT ĐƠN HÀNG</h1><table style='text-align:center;border:1px solid black;background:#008B8B;color:white;width:70%;'><thead><tr><th>Fullname</th><th>Address</th><th>Phone</th><th>Product</th><th>Quantity</th><th>Price</th></tr></thead><tbody><tr><td>"
								+ fullname + "</td><td>" + addressOrder + "</td><td>" + phoneOrder + "</td><td>"
								+ productName + "</td><td>" + quantity + "</td><td>" + price
								+ "</td></tr></tbody></table><b style='color:red'>Tổng Tiền Thanh Toán: " + " " + total + " " + "Vnđ"
								+ " </p></body></html>");
				model.addAttribute("message", "Payment success. Please check your email for order details!");
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		return "home/checkout";
	}
}
