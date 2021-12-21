package com.project.chores.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.project.chores.models.Parent;
import com.project.chores.models.User;

@Controller
public class ChoreController {

	@GetMapping("/admin/createuser")
	public String createUser(@ModelAttribute Parent parent, Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute(new Parent());
		return "createUser.jsp";
	}
	
	
}
