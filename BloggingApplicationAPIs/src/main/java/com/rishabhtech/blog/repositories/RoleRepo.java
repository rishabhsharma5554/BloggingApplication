package com.rishabhtech.blog.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rishabhtech.blog.Entities.Role;

public interface RoleRepo extends JpaRepository<Role, Integer> {

}
