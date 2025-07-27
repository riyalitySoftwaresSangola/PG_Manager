package com.rt.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rt.entity.Meal;
import com.rt.entity.Tenant;
import com.rt.entity.User;
import com.rt.repository.MealRepository;
import com.rt.service.MealService;
import com.rt.service.TenantService;

@Controller
public class MealController {

    @Autowired
    private MealService mealService;

    @Autowired
    private TenantService tenantService;
    

    @Autowired
    private MealRepository mealRepository;


    @GetMapping("/addMeal")
    public String showMealForm(Model model) {
        model.addAttribute("tenants", tenantService.getAllTenants());
        return "MealManagement/mealEntry";
    }

    @PostMapping("/saveMealEntry")
    public String saveMealEntry(
            @RequestParam("customerId") Long tenantId,
            @RequestParam("mealDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate mealDate,
            @RequestParam(value = "meals", required = false) List<String> meals
    ) {
        System.out.println("Tenant ID: " + tenantId);
        System.out.println("Meal Date Received: " + mealDate);

        Tenant tenant = tenantService.findById(tenantId);
        if (tenant == null) {
            throw new RuntimeException("Tenant not found with ID: " + tenantId);
        }

        Meal meal = new Meal();
        meal.setMealDate(mealDate);
        meal.setTenant(tenant);

        meal.setBreakfast(meals != null && meals.contains("Breakfast"));
        meal.setLunch(meals != null && meals.contains("Lunch"));
        meal.setDinner(meals != null && meals.contains("Dinner"));

        mealService.saveMeal(meal);
        return "redirect:/addMeal?success";
    }
    
    @GetMapping("/api/meal/{id}")
    @ResponseBody
    public Map<String, Object> getMealDetails(@PathVariable Long id) {
        Meal meal = mealRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Meal not found"));

        Map<String, Object> response = new HashMap<>();
        response.put("id", meal.getId());
        response.put("mealDate", meal.getMealDate().toString());
        response.put("breakfast", meal.isBreakfast());
        response.put("lunch", meal.isLunch());
        response.put("dinner", meal.isDinner());
        response.put("tenantName", meal.getTenant().getFullName()); 

        return response;
    }


    

    @PostMapping("/updateMeal")
    public String updateMeal(
    		@RequestParam Long mealId, 
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate mealDate,
            @RequestParam(required = false) List<String> meals,
            HttpSession session,
            Model model) {

        Meal meal = mealService.findById(mealId);
        if (meal == null) {
            model.addAttribute("error", "Meal not found.");
            return "errorPage"; 
        }
  
        meal.setMealDate(mealDate);
        meal.setBreakfast(meals != null && meals.contains("Breakfast"));
        meal.setLunch(meals != null && meals.contains("Lunch"));
        meal.setDinner(meals != null && meals.contains("Dinner"));

        try {
            User user = (User) session.getAttribute("loggedInUser");
            meal.setUpdatedBy(user != null ? user.getUsername() : "System");
            meal.setUpdatedDate(LocalDateTime.now());
        } catch (Exception e) {
            e.printStackTrace();
        }

        mealService.saveMeal(meal);
        model.addAttribute("message", "Meal updated successfully.");

        return "redirect:/viewMeals"; 
    }


    @GetMapping("/viewMeals")
    public String viewMeals(Model model) {
//        model.addAttribute("meals", mealService.getMealsByDate(LocalDate.now()));
           model.addAttribute("meals", mealRepository.findAll() );

        return "MealManagement/viewMeals";
    }
    
    
    @GetMapping("/viewMeal")
    public String viewMeals(@RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
                            Model model) {
        if (date == null) {
            date = LocalDate.now(); 
        }
        model.addAttribute("meals", mealService.getMealsByDate(date));
        model.addAttribute("selectedDate", date); 
        return "MealManagement/viewMeals";
    }
}