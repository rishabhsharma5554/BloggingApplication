package com.rishabhtech.blog.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rishabhtech.blog.Entities.Category;
import com.rishabhtech.blog.Entities.Post;
import com.rishabhtech.blog.Entities.User;

public interface PostRepo extends JpaRepository<Post, Integer> {
	
	//Custom Finder methods
	List<Post> findByUser(User user);
	List<Post> findByCategory(Category category);
	List<Post> findByTitleContaining(String title);
}
