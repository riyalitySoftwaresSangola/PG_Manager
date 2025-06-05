package com.rt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeConteroller {

	@RequestMapping("/admin/dashboard")
	public String indexPage() {
        return "index" ;
		
	}
	@RequestMapping("/customerRegistration")
	public String createEvent() {
        return "tenant" ;
		
	}
	
	

	
	@RequestMapping("/roomManagementForm")
	public String roomManagementForm() {
        return "roomManagementForm" ;
		
	}
	
	//@RequestMapping("/bedAssigned")
	//public String bedAssigedForm() {
		       
	//	return "bedAssiged";
	//}
	
	@GetMapping("/mealEntry")
	public String mealEntryForm() {
	    return "mealEntry";
	}

	@RequestMapping("/billingForm")
	public String billingForm() {
		
		return "billingForm";
	}
	
	@RequestMapping("/paymentEntry")
	public String paymentEntry() {
		
		return "paymentEntry";
	}
	
	@RequestMapping("/complaints")
	public String complaints() {
		
		return "complaints";
	}
	
	@RequestMapping("/leave")
	public String leave() {
		
		return "leave";
	}
	
	
      
	

}
