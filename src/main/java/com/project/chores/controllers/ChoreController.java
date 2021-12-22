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

import com.project.chores.models.Chore;
import com.project.chores.models.Reward;
import com.project.chores.models.User;
import com.project.chores.services.ChoreService;
import com.project.chores.services.UserService;

@Controller
public class ChoreController {
	
	@Autowired
	UserService userserv;
	
	@Autowired
	ChoreService choreService;
	
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
	
}		
