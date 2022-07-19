package com.rishabhtech.blog.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rishabhtech.blog.payloads.APIResponse;
import com.rishabhtech.blog.payloads.CommentDTO;
import com.rishabhtech.blog.services.CommentService;

@RestController
@RequestMapping("/api/")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@PostMapping("/post/{postId}/comments")
	public ResponseEntity<CommentDTO> createComment(@RequestBody CommentDTO comment, @PathVariable Integer postId) {
		CommentDTO createComment = this.commentService.createComment(comment, postId);
		return new ResponseEntity<CommentDTO>(createComment, HttpStatus.CREATED);

	}

	@DeleteMapping("/comments/{commentId}")
	public ResponseEntity<APIResponse> deleteComment(@PathVariable Integer commentId) {
		this.commentService.deleteComment(commentId);
		return new ResponseEntity<APIResponse>(new APIResponse("comment deleted Succesfully!", true), HttpStatus.OK);
	}

}
