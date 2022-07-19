package com.rishabhtech.blog.payloads;

import lombok.Data;

@Data
public class JWTAuthRequest {

	// email - username
	private String username;
	private String password;
}
