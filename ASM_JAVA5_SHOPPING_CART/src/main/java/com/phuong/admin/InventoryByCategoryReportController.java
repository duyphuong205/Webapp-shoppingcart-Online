package com.phuong.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phuong.model.InventoryReport;
import com.phuong.repository.ProductRepository;

@Controller
@RequestMapping("/admin")
public class InventoryByCategoryReportController {

	@Autowired
	private ProductRepository productRepository;

	@GetMapping("/inventory-by-category")
	public String showView(Model model) {
		List<InventoryReport> listReport = productRepository.findInventoryByCategory();
		model.addAttribute("inventories", listReport);
		return "admin/inventory";
	}

}
