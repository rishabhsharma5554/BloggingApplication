package com.rishabhtech.blog;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.rishabhtech.blog.repositories.UserRepo;

@SpringBootTest
class BloggingApplicationApIsApplicationTests {

	@Autowired
	private UserRepo userRepo;
	
	@Test
	void contextLoads() {
	}

	@Test
	public void userRepoTest()
	{
		String className = this.userRepo.getClass().getName();
		Package packageName = this.userRepo.getClass().getPackage();
		System.out.println("Class Name - "+className);
		System.out.println("Package Name - "+packageName);
	}
}
