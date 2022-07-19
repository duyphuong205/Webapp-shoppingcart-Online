package com.phuong.DTO;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private Integer id;
	private String name;
	private String imageName;
	private MultipartFile imageFile;
	private Double price;
	private Date createdate;
	private Boolean avaiable;
	private String categoryId;
	private String description;
}
