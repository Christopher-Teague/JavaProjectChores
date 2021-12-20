package com.project.chores.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.chores.models.User;
import com.project.chores.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	public UserRepository userRepo;
	
	public List<User> allUsers() {
		return userRepo.findAll();		
	}
	
	public User oneUser(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		}
			return null;
	}
	
	
}
