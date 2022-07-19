package com.rishabhtech.blog.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rishabhtech.blog.Entities.Comment;

public interface CommentRepo extends JpaRepository<Comment, Integer> {

}
