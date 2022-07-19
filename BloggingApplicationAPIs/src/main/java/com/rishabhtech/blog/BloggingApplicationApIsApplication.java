package com.rishabhtech.blog;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.rishabhtech.blog.Entities.Role;
import com.rishabhtech.blog.config.AppConstants;
import com.rishabhtech.blog.repositories.RoleRepo;

@SpringBootApplication
public class BloggingApplicationApIsApplication implements CommandLineRunner{

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private RoleRepo roleRepo;
	
	public static void main(String[] args) {
		SpringApplication.run(BloggingApplicationApIsApplication.class, args);
	}

	@Bean
	public ModelMapper modelMapper() {
		return new ModelMapper();
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println(this.passwordEncoder.encode("xyz"));
		try {
			Role role = new Role();
			role.setId(AppConstants.ADMIN_USER);
			role.setName("ROLE_ADMIN");
			
			Role role2 = new Role();
			role2.setId(AppConstants.NORMAL_USER);
			role2.setName("ROLE_USER");
			
			List<Role> roles = List.of(role,role2);
			
			List<Role> result = this.roleRepo.saveAll(roles);
			result.forEach(r -> System.out.println(r.getName()));
		} catch (Exception e) {
				e.printStackTrace();
		}
	}

}