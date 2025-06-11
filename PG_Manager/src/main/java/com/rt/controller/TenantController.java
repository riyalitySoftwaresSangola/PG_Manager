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
import java.time.LocalDateTime;
import java.util.List;

import com.rt.dto.tenantDTO.TenantRequestDTO;
import com.rt.entity.Tenant;
import com.rt.entity.User;
import com.rt.service.TenantService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.io.File;
import java.io.IOException;

@Controller
public class TenantController {

    @Autowired
    private TenantService tenantService;

    
    @GetMapping("/tenantRegister")
    public String showRegistrationForm(Model model) {
        model.addAttribute("tenant", new Tenant());
        return "Tenant/tenant"; 
    }

    @PostMapping("/userRegistration")
    public String registerTenant(
            @ModelAttribute("tenant") @Valid Tenant tenant,
            BindingResult result,
            @RequestParam("idProof") MultipartFile idProofFile,
            Model model,
            HttpSession session) {
    	
    	
    	try{
    		
    		User user =(User) session.getAttribute("loggedInUser");
        	
            tenant.setCreatedBy(user.getEmail());

            System.out.println(tenant.getFullName());
    		
    		
    	}catch (Exception e) {
            e.printStackTrace();
           
        }
    	
    	
        if (result.hasErrors()) {
        	System.out.print(result.getFieldError());
            return "Tenant/tenant";
        }
      
        try {
            if (idProofFile != null && !idProofFile.isEmpty()) {
               
                String uploadDir = "uploads/idProofs/";

               
                File uploadFolder = new File(uploadDir);
                if (!uploadFolder.exists()) {
                    uploadFolder.mkdirs();
                }

              
                String originalFilename = idProofFile.getOriginalFilename();
                String fileExtension = "";
                if (originalFilename != null && originalFilename.contains(".")) {
                    fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
                }

              
                String uniqueFileName = System.currentTimeMillis() + fileExtension;

          
                Path filePath = Paths.get(uploadDir, uniqueFileName);

               
                Files.copy(idProofFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                
                tenant.setIdProofPath(uploadDir + uniqueFileName);
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("uploadError", "Failed to upload ID proof.");
            return "Tenant/tenant";
        }
  
        tenantService.saveTenant(tenant);
        model.addAttribute("successMessage", "Tenant registered successfully!");
        return "Tenant/tenant";
    }


   @GetMapping("/allTenants")
    public String listTenants(Model model) {
	 List<Tenant>  Tenants =  tenantService.getAllTenants();
        model.addAttribute("tenants", tenantService.convertToDTOList(Tenants));
        return "Tenant/tenantList"; 
    }

   
    @GetMapping("/UpdateTenant")
    public String editTenant(@RequestParam Long id, Model model) {
        Tenant tenant = tenantService.getTenantById(id);
        if (tenant == null) {
            return "redirect:/allTenants";
        }
        model.addAttribute("tenant", tenant);
        return "Tenant/upadateTenant"; 
    }

   
    @PostMapping("/update")
    public String updateTenant(
            @ModelAttribute("tenant") TenantRequestDTO dto,
            @RequestParam("idProof") MultipartFile idProofFile) {
    	

        try {
            if (idProofFile != null && !idProofFile.isEmpty()) {
              
                String uploadDir = "uploads/idProofs/";

                
                File uploadFolder = new File(uploadDir);
                if (!uploadFolder.exists()) {
                    uploadFolder.mkdirs();
                }

                // Generate a unique file name
                String originalFilename = idProofFile.getOriginalFilename();
                String fileExtension = "";
                if (originalFilename != null && originalFilename.contains(".")) {
                    fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
                }
                String uniqueFileName = System.currentTimeMillis() + fileExtension;

                
                Path filePath = Paths.get(uploadDir, uniqueFileName);
                Files.copy(idProofFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                
                dto.setIdProofPath(uploadDir + uniqueFileName);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        

   	 Tenant existingTenant = tenantService.getTenantById(dto.getTenantId());
   	    
   	 
        existingTenant.setFullName(dto.getFullName());
	    existingTenant.setEmail(dto.getEmail());
	    existingTenant.setMobile(dto.getMobile());
	    existingTenant.setGender(dto.getGender());
	    existingTenant.setCheckInDate(dto.getCheckInDate());
	    existingTenant.setStatus(dto.getStatus());
	    existingTenant.setUpdatedBy(dto.getUpdatedBy());
	    existingTenant.setUpdatedDate(LocalDateTime.now());
	

       
        tenantService.saveTenant(existingTenant);
        return "redirect:/allTenants";
    }


   
    @GetMapping("/delete/{id}")
    public String deleteTenant(@PathVariable("id") Long id) {
        tenantService.deleteTenantById(id);
        return "redirect:/allTenants";
    }
}
