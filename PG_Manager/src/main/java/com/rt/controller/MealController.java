package com.rt.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rt.entity.Meal;
import com.rt.entity.Tenant;
import com.rt.service.MealService;
import com.rt.service.TenantService;

@Controller
public class MealController {

    @Autowired
    private MealService mealService;

    @Autowired
    private TenantService tenantService;

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


    @GetMapping("/viewMeals")
    public String viewMeals(Model model) {
        model.addAttribute("meals", mealService.getMealsByDate(LocalDate.now()));
        return "MealManagement/viewMeals";
    }
}
