package com.rt.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rt.entity.Meal;

public interface MealRepository extends JpaRepository<Meal, Long> {
    List<Meal> findByTenantId(Long tenantId);
    List<Meal> findByMealDate(LocalDate mealDate);
    List<Meal> findByTenantIdAndMealDateBetween(Long tenantId, LocalDate startDate, LocalDate endDate);
}
