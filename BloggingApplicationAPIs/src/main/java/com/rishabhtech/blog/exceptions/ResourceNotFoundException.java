package com.rishabhtech.blog.exceptions;

import lombok.*;

@Getter
@Setter
public class ResourceNotFoundException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String resourceName;
	String fieldName;
	long fieldValue;
	String stringField;
	public ResourceNotFoundException(String resourceName, String fieldName, long fieldValue) {
		super(String.format("%s not found with %s : %s", resourceName,fieldName,fieldValue));
		this.resourceName = resourceName;
		this.fieldName = fieldName;
		this.fieldValue = fieldValue;
	}
	
	public ResourceNotFoundException(String resourceName, String fieldName, String stringField) {
		super(String.format("%s not found with %s : %s", resourceName,fieldName,stringField));
		this.resourceName = resourceName;
		this.fieldName = fieldName;
		this.stringField = stringField;
	}
	
}
