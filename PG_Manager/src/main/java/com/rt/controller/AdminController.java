package com.rt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

	
	@RequestMapping("/Adminpage")
	public String LoginPage() {
		
		return "AuthPages/AuthLogin";
		
	}
	
	@RequestMapping("/Admin")
	public String adminPannal(@RequestParam String exampleEmail,
			               @RequestParam String examplePassword,
			               Model model
			    ) {
		if(exampleEmail != null&&examplePassword!=null) {
		if(exampleEmail=="Ram@gmail.com"&&examplePassword=="Ram@123") {
			
			model.addAttribute("role","Admin");
			return"index";
			
		}else {
			
			model.addAttribute("role","User");
			return"index";
			
		}
		
		}
		return "AuthPages/AuthLogin";
		
	}
	
	
	
	
	
}
