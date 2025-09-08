package com.rt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rt.entity.User;
import com.rt.service.UserService;




@Controller
public class StaffController {
	
	@Autowired
	private  UserService userService;
	
	
	@RequestMapping("/addManagerStaff")
	public String addManagerStaff() {
		return "User/addManagerStaff";

	}
	
	@GetMapping("/viewManagersStaff")
	public String viewManagersStaff(Model model) {
	    List<User> users = userService.findManagersAndStaff();
	    model.addAttribute("users", users);
	    return "User/viewManagerStaff";  
	}

	
	@PostMapping("/addManagerStaff")
	public String addUser(@ModelAttribute User user,
	                      @RequestParam("role") String role,
	                      RedirectAttributes redirectAttributes) {
	    try {
	        userService.registerUserWithRole(user, role);
	        redirectAttributes.addFlashAttribute("successMessage", "User created successfully!");
	    } catch (Exception e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("errorMessage", "Failed to create user. Try again.");
	    }
	    return "redirect:/addManagerStaff";  
	}
	
	


	
}
