package com.rt.controller;

import com.rt.dto.BedDTO;
import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.entity.Tenant;
import com.rt.repository.BedRepository;
import com.rt.repository.RoomRepository;
import com.rt.service.AssignmentService;
import com.rt.service.RoomService;
import com.rt.service.TenantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

	@GetMapping("/bedAssigned")
	public String bedAssignedForm(Model model) {
		model.addAttribute("Rooms", roomService.getAllRooms());
		model.addAttribute("customers", tenantService.getAllTenants());
		return "bedAssigned"; // JSP name
	}

	@PostMapping("/assignBed")
	public String assignBed(@RequestParam Long tenantId,
	                        @RequestParam Long roomId,
	                        @RequestParam Long bedNumber) {

		// Fetch tenant and bed
		Tenant tenant = tenantService.findById(tenantId);
		Bed bed = bedRepository.findById(bedNumber).orElse(null);

		if (tenant != null && bed != null) {
			bed.setStatus("Occupied");
			tenant.setAssignedBed(bed);
			tenant.setStatus("Active");

			bedRepository.save(bed);
			tenantService.save(tenant);
		}
		return "redirect:/bedAssigned";
	}

	@GetMapping("/getBedsByRoomId/{roomId}")
	@ResponseBody
	public List<BedDTO> getBedsByRoomId(@PathVariable Long roomId) {
		List<Bed> beds = bedRepository.findByRoomId(roomId);
		return beds.stream().map(BedDTO::new).collect(Collectors.toList());
	}
}
