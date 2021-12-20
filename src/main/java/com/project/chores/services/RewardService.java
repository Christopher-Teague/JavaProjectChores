package com.project.chores.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.chores.models.Reward;
import com.project.chores.repositories.RewardRepository;

@Service	
public class RewardService {

	@Autowired
	public RewardRepository rewardRepo;
		
		//  Create  \\
	
		//  RETRIEVE  \\
	
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
	
		//  UPDATE  \\
	
		//  DELETE  \\
		
}
