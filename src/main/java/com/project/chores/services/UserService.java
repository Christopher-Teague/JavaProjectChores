package com.project.chores.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.project.chores.models.LoginUser;
import com.project.chores.models.User;
import com.project.chores.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;
    
    public List<User> allUsers() {
		return userRepo.findAll();
	}
    
    public User findOne(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}
    
    public User register(User newUser, BindingResult result) {
        if(userRepo.findByUserName(newUser.getUserName()).isPresent()) {
            result.rejectValue("userName", "Unique", "This user name is already in use!");
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
//            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
//            newUser.setPassword(hashed);
            return userRepo.save(newUser);
        }
    }
    
    public User login(LoginUser newLogin, BindingResult result) {
        if(result.hasErrors()) {
            return null;
        }
        Optional<User> potentialUser = userRepo.findByUserName(newLogin.getUserName());
        if(!potentialUser.isPresent()) {
            result.rejectValue("userName", "Unique", "Unknown user name!");
            return null;
        }
        User user = potentialUser.get();
        if(!newLogin.getPassword().equals(user.getPassword())) {
            result.rejectValue("password", "Matches", "Password entered is not correct!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
            return user;
        }
    }
    
    public User updateUser(User user) {
		return userRepo.save(user);
	}
}