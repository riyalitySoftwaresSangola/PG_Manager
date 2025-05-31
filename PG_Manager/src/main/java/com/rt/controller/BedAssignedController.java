package com.rt.controller;

import com.rt.entity.Room;
import com.rt.entity.Tenant;
import com.rt.service.RoomService;
import com.rt.service.TenantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BedAssignedController {
	
	
	@Autowired
	private RoomService roomService ;
	
	@Autowired
	private TenantService tenantService ;
	

	@RequestMapping("/bedAssigned")
	public String bedAssigedForm(Model model) {
		int id = 1;
		model.addAttribute("Rooms", roomService.getAllRooms() );
		
	List<Tenant> list =	tenantService.getAllTenants();
		
		System.out.println(list.lastIndexOf(list));
		model.addAttribute("customers", tenantService.getAllTenants()  );
		
		
		return "bedAssiged";
	}

   
}
