package com.phuong.user_home_site;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phuong.model.Account;
import com.phuong.service.AccountService;
import com.phuong.utils.CookieUtils;
import com.phuong.utils.SessionUtils;

@Controller
@RequestMapping("/home")
public class LoginController {

	@Autowired
	private CookieUtils cookies;

	@Autowired
	private SessionUtils session;

	@Autowired
	private AccountService accountService;

	@Autowired
	private HttpServletRequest request;

	@GetMapping("/login")
	public String login(Model model) {
		String username = cookies.get("username");
		String password = cookies.get("password");
		model.addAttribute("usernameCookie", username);
		model.addAttribute("passwordCookie", password);
		return "home/login";
	}

	@PostMapping("/login")
	public String loginSuccess(Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean remember = Boolean.parseBoolean(request.getParameter("remember"));
		try {
			Account account = accountService.getById(username);
			if (!account.getPassword().equals(password)) {
				model.addAttribute("error", "Password Invalid!");
			} else {
				session.setAttribute("user", account);
				if (remember) {
					cookies.add("username", username, 10);
					cookies.add("password", password, 10);
				} else {
					cookies.remove("username");
					cookies.remove("password");
				}
				return "redirect:/home/index";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Username Invalid!");
		}
		return "home/login";
	}

	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		cookies.remove("username");
		cookies.remove("password");
		return "redirect:/home/index";
	}

}
