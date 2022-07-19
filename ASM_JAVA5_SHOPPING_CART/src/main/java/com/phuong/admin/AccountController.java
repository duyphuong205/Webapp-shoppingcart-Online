package com.phuong.admin;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.DTO.AccountDTO;
import com.phuong.model.Account;
import com.phuong.repository.AccountRepository;
import com.phuong.service.AccountService;

@Controller
//@RestController
@RequestMapping("/admin")
public class AccountController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private ServletContext application;

	@GetMapping("/account")
	public String formAccount(Model model, @RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 5);
		Page<Account> pageList = accountRepository.findAll(pageable);
		model.addAttribute("pageAccounts", pageList.getContent());
		model.addAttribute("pageNumber", pageList.getNumber());
		model.addAttribute("pageTotalPages", pageList.getTotalPages());
		return "admin/accountList";
	}

	@GetMapping("/account/add")
	public String formAccountAdd(Model model) {
		model.addAttribute("accountDTO", new AccountDTO());
		return "admin/accountCrud";
	}

	@PostMapping("/account/add")
	public String formAccountAdd(@Validated @ModelAttribute("accountDTO") AccountDTO accountDTO, Errors errors) {
		if (errors.hasErrors()) {
			return "admin/accountCrud";
		}
		if (!accountDTO.getPhotoFile().isEmpty()) {
			String path = application.getRealPath("/");
			System.out.println(path);
			try {
				accountDTO.setPhotoName(accountDTO.getPhotoFile().getOriginalFilename());
				String filePath = path + "/images/" + accountDTO.getPhotoName();
				File file = new File(filePath);
				accountDTO.getPhotoFile().transferTo(file);
				accountDTO.setPhotoFile(null);

				Account acc = new Account();
				acc.setUsername(accountDTO.getUsername());
				acc.setFullname(accountDTO.getFullname());
				acc.setPassword(accountDTO.getPassword());
				acc.setEmail(accountDTO.getEmail());
				acc.setPhoto(accountDTO.getPhotoName());
				acc.setAdmin(accountDTO.getAdmin());
				acc.setActivated(accountDTO.getActivated());

				accountService.insert(acc);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/account";
	}

	@GetMapping("/account/edit/{username}")
	public String editAccount(Model model, @PathVariable("username") String username) {
		Account acc = accountService.getById(username);
		AccountDTO accountDTO = new AccountDTO();

		accountDTO.setUsername(acc.getUsername());
		accountDTO.setFullname(acc.getFullname());
		accountDTO.setPassword(acc.getPassword());
		accountDTO.setEmail(acc.getEmail());
		accountDTO.setActivated(acc.getActivated());
		accountDTO.setAdmin(acc.getAdmin());
		accountDTO.setPhotoName(acc.getPhoto());

		model.addAttribute("accountDTO", accountDTO);
		return "admin/accountCrud";
	}

	@PostMapping("/account/update")
	public String updateAccount(@ModelAttribute("accountDTO") AccountDTO accountDTO) throws Exception {

		Account acc = new Account();
		acc.setUsername(accountDTO.getUsername());
		acc.setFullname(accountDTO.getFullname());
		acc.setPassword(accountDTO.getPassword());
		acc.setEmail(accountDTO.getEmail());
		acc.setAdmin(accountDTO.getAdmin());
		acc.setActivated(accountDTO.getActivated());

		if (!accountDTO.getPhotoFile().isEmpty()) {
			String path = application.getRealPath("/");
			System.out.println(path);

			accountDTO.setPhotoName(accountDTO.getPhotoFile().getOriginalFilename());
			String filePath = path + "/images/" + accountDTO.getPhotoName();
			File file = new File(filePath);
			accountDTO.getPhotoFile().transferTo(file);
			// accountDTO.setPhotoFile(null);
			acc.setPhoto(accountDTO.getPhotoName());
		}
		accountService.update(acc);
		return "redirect:/admin/account/edit/" + acc.getUsername();
	}

	@GetMapping("/account/delete/{username}")
	public String delete(@PathVariable("username") String username) {
		accountService.delete(username);
		return "redirect:/admin/account";
	}

	@PostMapping("/account/search")
	public String search(Model model, @RequestParam("keyword") String keyword,
			@RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 5);
		Page<Account> searchList = accountRepository.findByKeyword(keyword, pageable);
		model.addAttribute("pageAccounts", searchList.getContent());
		return "admin/accountList";
	}

	@ModelAttribute("activated")
	public Map<Boolean, String> getActivated() {
		Map<Boolean, String> activated = new HashMap<>();
		activated.put(true, "Yes");
		activated.put(false, "No");
		return activated;
	}

	@ModelAttribute("roles")
	public Map<Boolean, String> getRoles() {
		Map<Boolean, String> role = new HashMap<>();
		role.put(true, "Admin");
		role.put(false, "User");
		return role;
	}
}
