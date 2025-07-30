package com.rt.service;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import java.util.Optional;

import com.rt.entity.Meal;

public interface MealService {
    void saveMeal(Meal meal);
    List<Meal> getMealsByTenant(Long tenantId);
    List<Meal> getMealsByDate(LocalDate date);
    List<Meal> getMealsForMonth(Long tenantId, YearMonth month);
	
	Meal findById(Long mealId);
	
}
