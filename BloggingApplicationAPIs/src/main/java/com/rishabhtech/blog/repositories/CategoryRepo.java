package com.rishabhtech.blog.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rishabhtech.blog.Entities.Category;

public interface CategoryRepo extends JpaRepository<Category, Integer> {

}
