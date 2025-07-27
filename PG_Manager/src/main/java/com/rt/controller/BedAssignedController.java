package com.rt.controller;

import com.rt.dto.BedDTO;
import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.entity.Tenant;
import com.rt.repository.BedRepository;
import com.rt.repository.RoomRepository;
import com.rt.service.AssignmentService;
import com.rt.service.BedService;
import com.rt.service.RoomService;
import com.rt.service.TenantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
@Controller
public class BedAssignedController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private TenantService tenantService;

	@Autowired
	private BedRepository bedRepository;
	
	@Autowired
	private BedService bedAssignedService ;

	@GetMapping("/bedAssigned")
	public String bedAssignedForm(Model model) {
		model.addAttribute("Rooms", roomService.getAllRooms());
		model.addAttribute("customers", tenantService.getAllTenants());
		return "Rooms/bedAssigned"; 
	}
	
	@GetMapping("/getBedsByRoomId/{roomId}")
	@ResponseBody
	public List<BedDTO> getBedsByRoomId(@PathVariable Long roomId) {
		List<Bed> beds = bedRepository.findByRoomId(roomId);
		return beds.stream().map(BedDTO::new).collect(Collectors.toList());
		
		
	}
	
	

	@PostMapping("/assignBed")
	public String assignBed(@RequestParam Long tenantId,
	                        @RequestParam Long roomId,
	                        @RequestParam("bedNumber") Long bedId,
	                        RedirectAttributes redirectAttributes) {
	    try {
	      
	        Tenant tenant = tenantService.findById(tenantId);
	        Bed bed = bedRepository.findById(bedId)
	                .orElseThrow(() -> new IllegalArgumentException("Invalid bed number"));

	        if (tenant != null && bed != null) {
	            bed.setStatus("Occupied");
	            tenant.setAssignedBed(bed);
	            tenant.setStatus("Active");

	            bedRepository.save(bed);
	            tenantService.save(tenant);
	        }

	       
	        bedAssignedService.assignBedToTenant(tenantId, roomId, bedId);
	        redirectAttributes.addFlashAttribute("successMessage", "✅ Bed assigned successfully!");

	    } catch (RuntimeException e) {
	        redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
	    }

	    return "redirect:/bedAssigned";
	}


	
}
