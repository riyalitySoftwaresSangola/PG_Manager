package com.rt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.rt.dto.requestDTO.ComplaintRequestDTO;
import com.rt.dto.responceDTO.ComplaintResponseDTO;
import com.rt.entity.Tenant;
import com.rt.service.ComplaintService;
import com.rt.service.TenantService;

import java.util.List;

import javax.validation.Valid;

@Controller
public class ComplaintController {

    @Autowired
    private ComplaintService complaintService;

    @Autowired
    private TenantService tenantService;

    @GetMapping("/complaintsForm")
    public String showComplaintForm(Model model) {
        List<Tenant> tenants = tenantService.getAllTenants();
        model.addAttribute("tenants", tenants);
        return "ComplaintAndLeaveManagement/complaint";
    }

    @PostMapping("/complaintSubmit")
    public String submitComplaint(@Valid @ModelAttribute("complaint") ComplaintRequestDTO dto, BindingResult result, Model model) {
        complaintService.saveComplaint(dto);
        
        
        
        if (result.hasErrors()) {
            model.addAttribute("tenants", tenantService.getAllTenants());
            return "ComplaintAndLeaveManagement/complaint";
        }
        return "redirect:/viewComplentList";
    }

    @GetMapping("/viewComplentList")
    public String viewAllComplaints(Model model) {
        List<ComplaintResponseDTO> complaints = complaintService.getAllComplaintResponses();
        
        model.addAttribute("complaints", complaints);
        return "ComplaintAndLeaveManagement/ViewComplent";
    }
    
    
    @PostMapping("/update-status")
    public String updateStatus(@RequestParam("complaintId") Long complaintId,
                               @RequestParam("status") String status,
                               @RequestParam(value = "remark", required = false) String remark) {
    	System.out.println(status);
        complaintService.updateComplaintStatusWithRemark(complaintId, status, remark);
        return "redirect:/viewComplentList";
    }

    
    
    
}
