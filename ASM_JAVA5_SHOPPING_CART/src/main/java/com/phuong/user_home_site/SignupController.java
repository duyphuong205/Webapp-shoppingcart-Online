package com.phuong.user_home_site;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phuong.DTO.AccountDTO;
import com.phuong.model.Account;
import com.phuong.repository.AccountRepository;
import com.phuong.service.AccountService;

@Controller
//@RestController
@RequestMapping("/home")
public class SignupController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private ServletContext application;

	@GetMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("accountDTO", new AccountDTO());
		return "home/signup";
	}

	@PostMapping("/signup")
	public String signup(@Validated @ModelAttribute("accountDTO") AccountDTO accountDTO, Errors errors) {
		if (errors.hasErrors()) {
			return "home/signup";
		}
		if (!accountDTO.getPhotoFile().isEmpty()) {
			// duong dan vat ly
			String path = application.getRealPath("/");
			System.out.println(path);
			try {
				// ten file upload
				accountDTO.setPhotoName(accountDTO.getPhotoFile().getOriginalFilename());
				// thu muc chua anh
				String filePath = path + "/images/" + accountDTO.getPhotoName();
				File file = new File(filePath);
				accountDTO.getPhotoFile().transferTo(file);
				accountDTO.setPhotoFile(null);

				Account account = new Account();
				account.setUsername(accountDTO.getUsername());
				account.setFullname(accountDTO.getFullname());
				account.setPassword(accountDTO.getPassword());
				account.setEmail(accountDTO.getEmail());
				account.setPhoto(accountDTO.getPhotoName());
				account.setActivated(true);
				account.setAdmin(false);

				accountService.insert(account);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/home/index";
	}

}