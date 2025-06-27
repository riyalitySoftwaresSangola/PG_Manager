package com.rt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import com.rt.entity.Tenant;
import com.rt.service.TenantService;

import javax.validation.Valid;

import java.io.File;
import java.io.IOException;

@Controller
public class BookingController {

    @Autowired
    private TenantService tenantService;

    @GetMapping("/assign-bed")
    public String showAssignBedForm(Model model) {
        model.addAttribute("tenant", new Tenant());
        return "assign-bed"; 
    }

//    @PostMapping("/assign-bed")
//    public String assignBed(@ModelAttribute("tenant") Tenant tenant, Model model) {
//        String message = tenantService.assignBedToTenant(tenant);
//        model.addAttribute("message", message);
//        return "assign-bed";
//    }

    @GetMapping("/tenants")
    public String viewAllTenants(Model model) {
        model.addAttribute("tenants", tenantService.getAllTenants());
        return "tenant-list"; 
    }
}

