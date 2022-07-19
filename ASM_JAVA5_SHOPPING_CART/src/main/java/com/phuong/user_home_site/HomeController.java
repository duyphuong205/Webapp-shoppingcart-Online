package com.phuong.user_home_site;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phuong.service.CategoryService;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private CategoryService categoryService;

	@GetMapping(value = {"", "/" })
	public String doGetRedirectIndex() {
		return "redirect:/home/index";
	}

	@GetMapping("/index")
	public String showHomePage(Model model) {
		model.addAttribute("categories", categoryService.getAll());
		return "home/index";
	}

	@GetMapping("/contact")
	public String contact(Model model) {
		model.addAttribute("categories", categoryService.getAll());
		return "home/contact";
	}

	@GetMapping("/about")
	public String about(Model model) {
		model.addAttribute("categories", categoryService.getAll());
		return "home/about";
	}

	@GetMapping("/service")
	public String service(Model model) {
		model.addAttribute("categories", categoryService.getAll());
		return "home/service";
	}

}
