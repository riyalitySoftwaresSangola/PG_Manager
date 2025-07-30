package com.rt.service.Impl;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.entity.Meal;
import com.rt.repository.MealRepository;
import com.rt.service.MealService;

@Service
public class MealServiceImpl implements MealService {

    @Autowired
    private MealRepository mealRepository;

    @Override
    public void saveMeal(Meal meal) {
        mealRepository.save(meal);
    }

    @Override
    public List<Meal> getMealsByTenant(Long tenantId) {
        return mealRepository.findByTenantId(tenantId);
    }

    @Override
    public List<Meal> getMealsByDate(LocalDate date) {
        return mealRepository.findByMealDate(date);
    }

    @Override
    public List<Meal> getMealsForMonth(Long tenantId, YearMonth month) {
        LocalDate start = month.atDay(1);
        LocalDate end = month.atEndOfMonth();
        return mealRepository.findByTenantIdAndMealDateBetween(tenantId, start, end);
    }

    @Override
    public Meal findById(Long mealId) {
        return mealRepository.findById(mealId).orElse(null);
    }

}
