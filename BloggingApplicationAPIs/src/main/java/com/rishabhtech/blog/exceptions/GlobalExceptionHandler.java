package com.rishabhtech.blog.exceptions;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.rishabhtech.blog.payloads.APIResponse;

@RestControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(ResourceNotFoundException.class)
	public ResponseEntity<APIResponse> resourceNotFoundExceptionHandler(ResourceNotFoundException ex) {
		String message = ex.getMessage();
		APIResponse apiResp = new APIResponse(message, false);
		return new ResponseEntity<APIResponse>(apiResp, HttpStatus.NOT_FOUND);
	}
	
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<Map<String,String>> MethodArgumentNotValidExceptionHandler(MethodArgumentNotValidException ex)
	{
		Map<String,String> resp = new HashMap<>();
		ex.getBindingResult().getAllErrors().forEach((error)->
		{
			String fieldName = ((FieldError)error).getField();
			String message = error.getDefaultMessage();
			resp.put(fieldName, message);
		});
		return new ResponseEntity<Map<String,String>>(resp,HttpStatus.BAD_REQUEST);
	}
	
	@ExceptionHandler(APIException.class)
	public ResponseEntity<APIResponse> handleAPIException(APIException ex) {
		String message = ex.getMessage();
		APIResponse apiResp = new APIResponse(message, true);
		return new ResponseEntity<APIResponse>(apiResp, HttpStatus.BAD_REQUEST);
	}
}