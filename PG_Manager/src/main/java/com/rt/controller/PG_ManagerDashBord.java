package com.rt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PG_ManagerDashBord {
	
	
	
	@RequestMapping("/")
	public String indexPage() {
        return "index" ;
		
	}

}
