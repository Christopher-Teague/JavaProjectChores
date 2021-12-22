package com.project.chores.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.chores.models.Chore;
import com.project.chores.models.Reward;
import com.project.chores.models.User;
import com.project.chores.services.ChoreService;
import com.project.chores.services.RewardService;
import com.project.chores.services.UserService;

@Controller
public class ChoreController {
	
	@Autowired
	UserService userserv;
	
	@Autowired
	ChoreService choreService;
	
	@Autowired
	RewardService rewardService;
	
	//     Parent Mapping     \\

	@GetMapping("/admin/createuser")
	public String createUser(Model model) {
		model.addAttribute("newUser", new User());
		return "createUser.jsp";
	}
	
	@GetMapping("/chore/new")
	public String newChore(HttpSession session, @ModelAttribute("newChore") Chore newChore,
				@ModelAttribute("newReward") Reward newReward, Long id) {	
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		return "createChore.jsp";
	}

	@PostMapping("/chore/new")
	public String processNewChore(@Valid @ModelAttribute("newChore") Chore newChore,
			 BindingResult result, Long id) {	
		if(result.hasErrors()) {
			return "createChore.jsp";			
		}
		choreService.addChore(newChore);
		return "redirect:/edit/choreList";
	}
	
	@PostMapping("/reward/new")
	public String processNewChore(@Valid @ModelAttribute("newReward") Reward newReward,
			BindingResult result, Long id) {	
		if(result.hasErrors()) {
			return "createChore.jsp";			
		}
		newReward.setRedeemed(false);
		choreService.addReward(newReward);
		return "redirect:/edit/choreList";
	}
	
	@GetMapping("/edit/choreList")
	public String editChoreList(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
			}
		List<Chore> chores = choreService.allChores();
		List<Reward> rewards = choreService.allRewards();
		model.addAttribute("chores", chores);
		model.addAttribute("rewards", rewards);
		return "editChoreList.jsp";
	}
	
	@PutMapping("/choreList/add")
	public String choreListAdd(@RequestParam ("selectChore")Long id, Model model) {
		Chore chore = choreService.oneChore(id);
		chore.setListed(true);
		choreService.updateChore(chore);
		return "redirect:/edit/choreList";
	}

	@PutMapping("/choreList/remove")
	public String choreListRemove(@RequestParam ("selectChore")Long id, Model model) {
		Chore chore = choreService.oneChore(id);
		chore.setListed(false);
		choreService.updateChore(chore);
		return "redirect:/edit/choreList";
	}
	
	@PutMapping("/rewardList/add")
	public String rewardListAdd(@RequestParam ("selectReward")Long id, Model model) {
		Reward reward = rewardService.oneReward(id);
		reward.setListed(true);
		rewardService.updateReward(reward);
		return "redirect:/edit/choreList";
	}
	
	@PutMapping("/rewardList/remove")
	public String rewardListRemove(@RequestParam ("selectReward")Long id, Model model) {
		Reward reward = rewardService.oneReward(id);
		reward.setListed(false);
		rewardService.updateReward(reward);
		return "redirect:/edit/choreList";
	}
	
	
	
	//     Child Mapping     \\
	
	@GetMapping("/chore/complete")
	public String completeChore(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
			}
		List<Chore> chores = choreService.allChores();
		List<Reward> rewards = choreService.allRewards();
		model.addAttribute("chores", chores);
		model.addAttribute("rewards", rewards);
		return "childCompleteChore.jsp";
	}
	
	@PutMapping("/childChore/add")
	public String childChoreAdd(HttpSession session, @RequestParam ("selectChore")Long id ) {
		Chore chore = choreService.oneChore(id);
		Long userId = (Long) session.getAttribute("user_id");
		System.out.println("***********");
		System.out.println(session.getAttribute("user_id"));
		System.out.println(userId);
	
		System.out.println("***********");
		User user = userserv.findOne(userId);
		chore.setUser(user);
		chore.setWorking(true);
		choreService.updateChore(chore);
		return "redirect:/dashboard";
	}
}		
