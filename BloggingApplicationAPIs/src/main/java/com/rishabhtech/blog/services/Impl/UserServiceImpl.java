package com.rishabhtech.blog.services.Impl;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rishabhtech.blog.Entities.Role;
import com.rishabhtech.blog.Entities.User;
import com.rishabhtech.blog.config.AppConstants;
import com.rishabhtech.blog.exceptions.ResourceNotFoundException;
import com.rishabhtech.blog.payloads.UserDTO;
import com.rishabhtech.blog.repositories.RoleRepo;
import com.rishabhtech.blog.repositories.UserRepo;
import com.rishabhtech.blog.services.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private RoleRepo roleRepo;
	
	@Override
	public UserDTO createUser(UserDTO userDto) {
		User user = this.dtoToUserEntity(userDto);
		User savedUser = this.userRepo.save(user);
		return this.userEntityToDTO(savedUser);
	}

	@Override
	public UserDTO updateUser(UserDTO userDTO, Integer userId) {
		/// if user not found in DB
		User user = this.userRepo.findById(userId)
				.orElseThrow(() -> new ResourceNotFoundException("user", "id", userId));
		user.setName(userDTO.getName());
		user.setEmail(userDTO.getEmail());
		user.setPassword(userDTO.getPassword());
		user.setAbout(userDTO.getAbout());

		User updatedUser = this.userRepo.save(user);
		UserDTO userDTO1 = this.userEntityToDTO(updatedUser);

		return userDTO1;
	}

	@Override
	public UserDTO getUserById(Integer userId) {
		User user = this.userRepo.findById(userId).orElseThrow(()-> new ResourceNotFoundException("user","id",userId));
//		UserDTO userDTO = this.userEntityToDTO(user);
//		return userDTO;
		return this.userEntityToDTO(user);
	}

	@Override
	public List<UserDTO> getAllUsers() {
		List<User> users= this.userRepo.findAll();
		List<UserDTO> userDTOs = users.stream().map(user -> this.userEntityToDTO(user)).collect(Collectors.toList());
		
		return userDTOs;
	}

	@Override
	public void deleteUser(Integer userId) {
		User user = this.userRepo.findById(userId).orElseThrow(()-> new ResourceNotFoundException("user","id",userId));
		this.userRepo.delete(user);
	}

	// Entity to DTO
	private User dtoToUserEntity(UserDTO userDto) {
//		User user = new User();
//		user.setId(userDto.getId());
//		user.setName(userDto.getName());
//		user.setAbout(userDto.getAbout());
//		user.setPassword(userDto.getPassword());
//		user.setEmail(userDto.getEmail());
//		return user;
		User user = this.modelMapper.map(userDto, User.class);
		return user;
	}
	
	
	
	//  DTO to Entity 
	public UserDTO userEntityToDTO(User user) {
//		UserDTO userDto = new UserDTO();
//		userDto.setId(user.getId());
//		userDto.setName(user.getName());
//		userDto.setPassword(user.getPassword());
//		userDto.setEmail(user.getEmail());
//		userDto.setAbout(user.getAbout());
//		return userDto;
		
		UserDTO userDTO = this.modelMapper.map(user, UserDTO.class);
		return userDTO;
	}

	@Override
	public UserDTO registerNewUser(UserDTO userDTO) {
		User user = this.modelMapper.map(userDTO,User.class);
		
		//encoded password
		user.setPassword(this.passwordEncoder.encode(user.getPassword()));
		
		//roles
		Role role = this.roleRepo.findById(AppConstants.NORMAL_USER).get();
		
		
		user.getRoles().add(role);
		User newUser = this.userRepo.save(user);
		return this.modelMapper.map(newUser, UserDTO.class);
	}
}
