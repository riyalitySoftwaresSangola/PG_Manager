package com.rt.controller;

import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.entity.Tenant;
import com.rt.service.AssignmentService;
import com.rt.service.RoomService;
import com.rt.service.TenantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BedAssignedController {
	
	
	@Autowired
	private RoomService roomService ;
	
	@Autowired
	private TenantService tenantService ;
	
	@Autowired
	private AssignmentService assignmentService ;

	@RequestMapping("/bedAssigned")
	public String bedAssigedForm(Model model) {
		int id = 1;
		model.addAttribute("Rooms", roomService.getAllRooms() );
		
	List<Tenant> list =	tenantService.getAllTenants();
		
		System.out.println(list.lastIndexOf(list));
		model.addAttribute("customers", tenantService.getAllTenants()  );
		
		
		return "bedAssiged";
	}
//	@PostMapping("/assign")
//	public String assignBed(@RequestParam Long tenantId, @RequestParam Long bedId) {
//	    Tenant tenant = tenantService.findById(tenantId);
//	    Bed bed = bedService.findById(bedId);
//
//	    // Assign bed
//	    bed.setOccupied(true);
//	    tenant.setAssignedBed(bed);
//	    tenant.setStatus("Active");
//
//	    tenantService.save(tenant);
//	    bedService.save(bed);
//
//	    return "redirect:/beds/assign-form?success";
//	}
//
//	@GetMapping("/available")
//	@ResponseBody
//	public List<Bed> getAvailableBeds(@RequestParam Long roomId) {
//	    return bedService.findAvailableBedsByRoomId(roomId);
//	}

   
}
