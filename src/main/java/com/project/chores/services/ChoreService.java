package com.project.chores.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.chores.models.Chore;
import com.project.chores.repositories.ChoreRepository;

@Service
public class ChoreService {

	@Autowired
	public ChoreRepository choreRepo;
	
		// *** Create *** \\
	
		// RETRIEVE \\
	
	public List<Chore> allChores() {
		return choreRepo.findAll();		
	}
	
	public Chore oneChore(Long id) {
		Optional<Chore> optionalChore = choreRepo.findById(id);
		if(optionalChore.isPresent()) {
			return optionalChore.get();
		}
			return null;
	}

		//  UPDATE -future update \\
	
		//  DELETE -future update \\
	
}
