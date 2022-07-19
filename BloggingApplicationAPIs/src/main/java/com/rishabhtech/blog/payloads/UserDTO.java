package com.rishabhtech.blog.payloads;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.rishabhtech.blog.Entities.Role;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class UserDTO {

	private Integer id;
	@NotEmpty
	@Size(min = 4, message = "User name must be min of 4 Characters.")
	private String name;
	@Email(message = "Givem email address is invalid.")
	private String email;
	@NotEmpty
	@Size(min = 3,max=10, message = "Password must be min of 4 Characters & max 7  Characters.")
	private String password;
	@NotEmpty
	private String about;
	
	private Set<RoleDTO> roles = new HashSet<>();
}