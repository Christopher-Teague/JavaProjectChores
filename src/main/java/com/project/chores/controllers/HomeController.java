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
import com.project.chores.models.LoginUser;
import com.project.chores.models.Reward;
import com.project.chores.models.User;
import com.project.chores.services.ChoreService;
import com.project.chores.services.RewardService;
import com.project.chores.services.UserService;


@Controller
public class HomeController {

	@Autowired
	ChoreService choreService;

	@Autowired
	RewardService rewardService;
	
	@Autowired
	private UserService userServ;
	
	@GetMapping("/")
	public String index(Model model) {
	    model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
	        BindingResult result, Model model, HttpSession session) {
	    userServ.register(newUser, result);
	    if(result.hasErrors()) {
	        model.addAttribute("newLogin", new LoginUser());
	        return "createUser.jsp";
	    } 
	    if(!newUser.getIsParent()) {
	    session.setAttribute("user_id", newUser.getId());
	    session.setAttribute("userName", newUser.getUserName());
//	    newUser.setPointTotal(0);
	    return "redirect:/dashboard";
	    }
	    if(newUser.getIsParent()) {
	    	session.setAttribute("user_id", newUser.getId());
		    session.setAttribute("userName", newUser.getUserName());
	    }
		    return "redirect:/parentDashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	        BindingResult result, Model model, HttpSession session) {
	    User user = userServ.login(newLogin, result);
	    if(result.hasErrors()) {
	        model.addAttribute("newUser", new User());
	        return "index.jsp";
	    }
	    if(user.getIsParent()) {
	    session.setAttribute("user_id", user.getId());
	    session.setAttribute("userName", user.getUserName());
	    return "redirect:/parentDashboard";
	    }
	    session.setAttribute("user_id", user.getId());
	    session.setAttribute("userName", user.getUserName());
	    return "redirect:/dashboard";
	    
		}

	 //   CHILDRENS DASHBOARD   \\
	@GetMapping("/dashboard")	
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
			}
		List<Chore> chores = choreService.allChores();
		List<Reward> rewards = rewardService.allRewards();
		model.addAttribute("chores", chores);
		model.addAttribute("rewards", rewards);
		return "childDashboard.jsp";
		}

	@GetMapping("/parentDashboard") 
	public String parentDashboard(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		List<Chore> chores = choreService.allChores();
		List<Reward> rewards = rewardService.allRewards();
		model.addAttribute("chores", chores);
		model.addAttribute("rewards", rewards);
		return "parentDashboard.jsp";
	}

	@GetMapping("/logout") 
		public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
