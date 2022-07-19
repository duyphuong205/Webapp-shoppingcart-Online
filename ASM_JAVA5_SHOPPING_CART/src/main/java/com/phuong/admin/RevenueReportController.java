package com.phuong.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phuong.repository.OrderDetailRepository;

@Controller
@RequestMapping("/admin")
public class RevenueReportController {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Autowired
	private HttpServletRequest request;

	@GetMapping("/revenue-report")
	public String viewForm(Model model) {
		model.addAttribute("revenues", orderDetailRepository.getRevenue());
		return "admin/revenue";
	}

	@PostMapping("/revenue-report")
	public String viewFormSuccess(Model model) throws ParseException {
		String dateA = request.getParameter("mindate");
		String dateB = request.getParameter("maxdate");
		Date minDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateA);
		Date maxDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateB);
		model.addAttribute("revenues", orderDetailRepository.getRevenueByDate(minDate, maxDate));
		return "admin/revenue";
	}

}
