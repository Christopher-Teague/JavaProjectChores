package com.project.chores.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.chores.models.Chore;
import com.project.chores.models.Reward;
import com.project.chores.repositories.ChoreRepository;
import com.project.chores.repositories.RewardRepository;

@Service
public class ChoreService {

	@Autowired
	public ChoreRepository choreRepo;

	@Autowired
	public RewardRepository rewardRepo;
	
		// *** Create *** \\
	
	public Chore addChore(Chore chore) {
		chore.setAvailable(true);
		chore.setCompleted(false);
		return choreRepo.save(chore);
	}	

	public Reward addReward(Reward reward) {
		reward.setAvailable(true);
		reward.setRedeemed(false);		
		return rewardRepo.save(reward);
		
		
	}
	
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
	
	public List<Reward> allRewards() {
		return rewardRepo.findAll();
	}
	
	public Reward oneReward(Long id) {
		Optional<Reward> optionalReward = rewardRepo.findById(id);
		if(optionalReward.isPresent()) {
			return optionalReward.get();
		}
		return null;
	}

		//  UPDATE -future update \\
	
	public Chore updateChore(Chore chore) {
		return choreRepo.save(chore);
	}
	
		//  DELETE -future update \\
	
}
