package com.phuong.user_home_site;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phuong.model.Account;
import com.phuong.service.AccountService;
import com.phuong.utils.SessionUtils;

@Controller
@RequestMapping("/home")
public class ChangepasswordController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private SessionUtils session;

	@Autowired
	private HttpServletRequest request;

	@GetMapping("/changepassword")
	public String showForm() {
		return "home/changepassword";
	}

	@PostMapping("/changepassword")
	public String showForm(Model model) {
		String username = request.getParameter("username");
		String current_password = request.getParameter("current_password");
		String new_password = request.getParameter("new_password");
		String confirm_password = request.getParameter("confirm_password");

		try {
			Account account = session.getAttibute("user");
			accountService.getById(username);
			if (!account.getPassword().equals(current_password)) {
				model.addAttribute("error", "Current Password Fail!");
			} else if (!new_password.equals(confirm_password)) {
				model.addAttribute("error", "2 Passwords Don't Match!");
			} else {
				account.setPassword(new_password);
				accountService.update(account);
				model.addAttribute("message", "Change Successfully!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Username Invalid!");
		}
		return "home/changepassword";
	}
}
