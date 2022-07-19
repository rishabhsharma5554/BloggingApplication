package com.rishabhtech.blog.services;

import java.util.List;

import com.rishabhtech.blog.payloads.PostDTO;
import com.rishabhtech.blog.payloads.PostResponse;

public interface PostService {
	PostDTO createPost(PostDTO postDTO,Integer userId,Integer categoryId);
	PostDTO updatePost(PostDTO postDTO,Integer id);
	void deletePost(Integer id);
	PostResponse getAllPosts(Integer pageNo,Integer pageSize,String sortBy,String sortDir);
	PostDTO getPostById(Integer postId);
	List<PostDTO> getPostsByCategory(Integer categoryId);
	List<PostDTO> getPostsByUser(Integer userId);
	List<PostDTO> searchPosts(String keyword);
}
