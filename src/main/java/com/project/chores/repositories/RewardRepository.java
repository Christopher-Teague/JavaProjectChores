package com.project.chores.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.project.chores.models.Reward;

@Repository
public interface RewardRepository extends CrudRepository<Reward, Long> {
	List<Reward> findAll();

}
