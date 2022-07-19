package com.phuong.user_home_site;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.model.Account;
import com.phuong.service.AccountService;
import com.phuong.service.MailService;

@Controller
@RequestMapping("/home")
public class ForgotpasswordController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private MailService mailService;

	@GetMapping("/forgotpassword")
	public String showForm() {
		return "home/forgotpassword";
	}

	@PostMapping("/forgotpassword")
	public String forgotPassword(Model model, @RequestParam("username") String username,
			@RequestParam("email") String email) {
		try {
			Account account = accountService.getById(username);
			if (!account.getEmail().equals(email)) {
				model.addAttribute("error", "Email Invalid!");
			} else {
				mailService.send(email, "Your Password",
						"<html><body><div style='border:1px slolid black;width:max-content;padding-left:5px;padding-right:5px;background-color:black;color:white;letter-spacing:5px;font-size:30px;'>"
								+ account.getPassword()
								+ "</div><br><b>You have recovered your password, now log in? <a href='http://localhost:8080/home/login'>Login Here</a></b></body></html>");
				model.addAttribute("message", "Please check your email!");
			}
		} catch (MessagingException e) {
			model.addAttribute("error", "Username Invalid!");
			e.getMessage();
		}
		return "home/forgotpassword";
	}
}
