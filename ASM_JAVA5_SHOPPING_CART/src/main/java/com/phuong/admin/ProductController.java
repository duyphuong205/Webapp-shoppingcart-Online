package com.phuong.admin;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.phuong.DTO.ProductDTO;
import com.phuong.model.Category;
import com.phuong.model.Product;
import com.phuong.repository.CategoryRepository;
import com.phuong.repository.ProductRepository;
import com.phuong.service.CategoryService;
import com.phuong.service.ProductService;

@Controller
//@RestController
@RequestMapping("/admin")
public class ProductController {

	@Autowired
	private ServletContext application;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductRepository productRepository;

	@GetMapping("/product")
	public String formProduct(Model model, @RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 10);
		Page<Product> page = productRepository.findAll(pageable);
		model.addAttribute("pageProducts", page.getContent());
		model.addAttribute("pageNumber", page.getNumber());
		model.addAttribute("pageTotalPages", page.getTotalPages());
		return "admin/productList";
	}

	@PostMapping("/product/search")
	public String formSearch(@RequestParam("keyword") String keyword, Model model,
			@RequestParam("page") Optional<Integer> pageIndex) {
		Pageable pageable = PageRequest.of(pageIndex.orElse(0), 10);
		Page<Product> page = productRepository.findByKeyword(keyword, pageable);
		model.addAttribute("pageProducts", page.getContent());
		model.addAttribute("pageNumber", page.getNumber());
		model.addAttribute("pageTotalPages", page.getTotalPages());
		return "admin/productList";
	}

	@GetMapping("/product/add")
	public String showFormAdd(Model model) {
		model.addAttribute("productDTO", new ProductDTO());
		model.addAttribute("categories", categoryService.getAll());
		return "admin/productCrud";
	}

	@PostMapping("/product/add")
	public String postFormAdd(@ModelAttribute("productDTO") ProductDTO productDTO) {
		if (!productDTO.getImageFile().isEmpty()) {
			String path = application.getRealPath("/");
			System.out.println(path);
			try {
				productDTO.setImageName(productDTO.getImageFile().getOriginalFilename());
				String filePath = path + "/images/" + productDTO.getImageName();
				File file = new File(filePath);
				productDTO.getImageFile().transferTo(file);
				productDTO.setImageFile(null);

				Product product = new Product();
				product.setId(productDTO.getId());
				product.setName(productDTO.getName());
				product.setCreatedate(new Date());
				product.setAvaiable(productDTO.getAvaiable());
				product.setCategory(categoryService.getById(productDTO.getCategoryId()));
				product.setDescription(productDTO.getDescription());
				product.setImage(productDTO.getImageName());
				product.setPrice(productDTO.getPrice());

				productService.insert(product);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return "redirect:/admin/product";
	}

	@GetMapping("/product/edit/{id}")
	public String editProduct(@PathVariable("id") Integer id, Model model) {
		Product pr = productService.getById(id);
		ProductDTO prDTO = new ProductDTO();
		prDTO.setId(pr.getId());
		prDTO.setName(pr.getName());
		prDTO.setAvaiable(pr.getAvaiable());
		prDTO.setCategoryId(pr.getCategory().getId());
		prDTO.setDescription(pr.getDescription());
		prDTO.setImageName(pr.getImage());
		prDTO.setPrice(pr.getPrice());

		model.addAttribute("productDTO", prDTO);
		model.addAttribute("categories", categoryService.getAll());
		return "admin/productCrud";
	}

	@PostMapping("/product/update")
	public String updateProduct(@ModelAttribute("productDTO") ProductDTO productDTO) throws Exception {
		Product pr = new Product();
		pr.setId(productDTO.getId());
		pr.setName(productDTO.getName());
		pr.setPrice(productDTO.getPrice());
		pr.setDescription(productDTO.getDescription());
		pr.setCategory(categoryService.getById(productDTO.getCategoryId()));
		pr.setAvaiable(productDTO.getAvaiable());
		pr.setCreatedate(new Date());

		if (!productDTO.getImageFile().isEmpty()) {
			String path = application.getRealPath("/");
			productDTO.setImageName(productDTO.getImageFile().getOriginalFilename());
			String filePath = path + "/images/" + productDTO.getImageName();
			File file = new File(filePath);
			productDTO.getImageFile().transferTo(file);

			pr.setImage(productDTO.getImageName());
		}
		productService.update(pr);
		return "redirect:/admin/product/edit/" + pr.getId();
	}

	@GetMapping("/product/delete/{id}")
	public String deletePr(@PathVariable("id") Integer id) {
		productService.delete(id);
		return "redirect:/admin/product";
	}

	@ModelAttribute("avaiables")
	public Map<Boolean, String> getAvaiable() {
		Map<Boolean, String> avaiable = new HashMap<>();
		avaiable.put(true, "Stocking");
		avaiable.put(false, "Out of stock");
		return avaiable;
	}

}
