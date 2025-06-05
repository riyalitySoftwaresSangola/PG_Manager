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
public class TenantController {

    @Autowired
    private TenantService tenantService;

    
//    @GetMapping("/tenantRegister")
//    public String showRegistrationForm(Model model) {
//        model.addAttribute("tenant", new Tenant());
//        return "tenant_register"; 
//    }

    @PostMapping("/userRegistration")
    public String registerTenant(
            @ModelAttribute("tenant") @Valid Tenant tenant,
            BindingResult result,
            @RequestParam("idProof") MultipartFile idProofFile,
            Model model) {

        System.out.println(tenant.getFullName());

        // Optional: handle form validation errors
        if (result.hasErrors()) {
        	System.out.print(result.getFieldError());
            return "tenant";
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
            return "tenant";
        }
  
        tenantService.saveTenant(tenant);
        model.addAttribute("successMessage", "Tenant registered successfully!");
        return "tenant";
    }


   @GetMapping("/list")
    public String listTenants(Model model) {
        model.addAttribute("tenants", tenantService.getAllTenants());
        return "tenant_list"; // JSP file: tenant_list.jsp
    }

   
    @GetMapping("/edit/{id}")
    public String editTenant(@PathVariable("id") Long id, Model model) {
        Tenant tenant = tenantService.getTenantById(id);
        if (tenant == null) {
            return "redirect:/tenant/list";
        }
        model.addAttribute("tenant", tenant);
        return "tenant_edit"; // JSP file: tenant_edit.jsp
    }

   
    @PostMapping("/update")
    public String updateTenant(
            @ModelAttribute("tenant") Tenant tenant,
            @RequestParam("idProof") MultipartFile idProofFile) {

        try {
            if (idProofFile != null && !idProofFile.isEmpty()) {
                // Define folder to save the image
                String uploadDir = "uploads/idProofs/";

                // Create folder if it doesn't exist
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

                // Save the file
                Path filePath = Paths.get(uploadDir, uniqueFileName);
                Files.copy(idProofFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Save file path to DB
                tenant.setIdProofPath(uploadDir + uniqueFileName);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        // Save updated tenant
        tenantService.saveTenant(tenant);
        return "redirect:/tenant/list";
    }


   
    @GetMapping("/delete/{id}")
    public String deleteTenant(@PathVariable("id") Long id) {
        tenantService.deleteTenantById(id);
        return "redirect:/tenant/list";
    }
}
