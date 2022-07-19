package com.rishabhtech.blog.payloads;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class CategoryDTO {
	private Integer categoryId;
	@NotEmpty
	@Size(min = 4 , message = "Mnimium size of category title is 4")
	private String categoryTitle;
	@NotEmpty
	@Size(min = 10 , message = "Mnimium size of category Discription is 4")
	private String categoryDescription;
}
