package com.rt.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.rt.entity.Bill;
import com.rt.entity.Tenant;
import com.rt.service.BillService;
import com.rt.service.TenantService;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

@Controller
public class BillingController {

    @Autowired
    private TenantService tenantService;

    @Autowired
    private BillService billService;

    
    @RequestMapping("/billingForm")
    public String showBillingPage(Model model) {
        List<Tenant> tenants = tenantService.getAllTenants();

        model.addAttribute("tenants", tenants);
        model.addAttribute("bill", new Bill());
//        model.addAttribute("statuses", BillStatus.values());
//        model.addAttribute("generatedDate", LocalDate.now());

        return "BillingAndPayment/billingForm"; 
    }
    
    @RequestMapping("/billingHistory")
    public String BillingPage(Model model) {
    	
    	 List<Bill> bills = billService.getAllBills(); 
    	 
         model.addAttribute("bills", bills); 
        return "BillingAndPayment/bills"; 
    }
    
    
//    @GetMapping("/getRentByCustomerId")
//    public ResponseEntity<?> getRentByCustomerId(@RequestParam("id") Long tenantId) {
//    	
//    	
//		return null;
//     
//    }
    
    @GetMapping("/getRentByCustomerId")
    @ResponseBody
    public ResponseEntity<Map<String, Double>> getRentByCustomerId(@RequestParam("id") Long tenantId) {
      
    	Double rent = billService.getRentByCustomerId(tenantId);  
        Map<String, Double> response = new HashMap< >();
        response.put("rent", rent != null ? rent : 0.0);
        return ResponseEntity.ok(response);
       
        
    }
    
    @PostMapping("/generateBill")
    public String generateBill(@Valid @ModelAttribute Bill bill, BindingResult result) {
        if (result.hasErrors()) {
            return "BillingAndPayment/billingForm"; 
        }

        bill.setGeneratedDate(LocalDate.now()); 
        billService.saveBill(bill);
        return "redirect:/billingHistory?success";
    }

}
