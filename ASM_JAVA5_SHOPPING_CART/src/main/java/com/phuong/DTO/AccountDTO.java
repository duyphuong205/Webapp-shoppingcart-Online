package com.phuong.DTO;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountDTO {
	@NotBlank(message = "Username can not be empty!")
	private String username;
	@NotBlank(message = "Fullname can not be empty!")
	private String fullname;
	@NotBlank(message = "Password can not be empty!")
	private String password;
	@NotBlank(message = "Email can not be empty!")
	@Email(message = "Email is invalid!")
	private String email;
	private String photoName;
	private Boolean activated;
	private Boolean admin;
	private MultipartFile photoFile;

}
