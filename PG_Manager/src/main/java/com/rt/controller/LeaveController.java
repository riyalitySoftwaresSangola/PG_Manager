package com.rt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rt.entity.LeaveRequest;
import com.rt.entity.Tenant;
import com.rt.service.LeaveService;
import com.rt.service.TenantService;

@Controller
public class LeaveController {

	@Autowired
	private LeaveService leaveService;

	@Autowired
	private TenantService tenantService;

	@GetMapping("/leave")
	public String ApplyLeaveForm(Model model) {

		model.addAttribute("customers", tenantService.getAllTenants());

		return "ComplaintAndLeaveManagement/leave";
	}

	

	@PostMapping("/submitLeaveRequest")
	public String applyLeave(@ModelAttribute("leaveRequest") LeaveRequest leaveRequest,
			RedirectAttributes redirectAttributes) {
		leaveService.saveLeave(leaveRequest);
		redirectAttributes.addFlashAttribute("success", "Leave request submitted successfully!");
		return "redirect:/all";
	}

	

	@GetMapping("/all")
	public String getAllLeaves(Model model) {
		model.addAttribute("leaves", leaveService.getAllLeaves());
		return "ComplaintAndLeaveManagement/LeavesList";
	}

	@GetMapping("/approveLeave/{leaveId}")
	public String approveLeave(@PathVariable Long leaveId, RedirectAttributes redirectAttributes) {
		leaveService.approveLeave(leaveId);
		redirectAttributes.addFlashAttribute("success", "Leave approved!");
		return "redirect:/all";
	}

	@GetMapping("/rejectLeave/{leaveId}")
	public String rejectLeave(@PathVariable Long leaveId, RedirectAttributes redirectAttributes) {
		leaveService.rejectLeave(leaveId);
		redirectAttributes.addFlashAttribute("error", "Leave rejected!");
		return "redirect:/all";
	}
}
