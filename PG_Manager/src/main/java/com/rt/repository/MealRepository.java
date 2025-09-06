package com.rt.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.rt.entity.Meal;

public interface MealRepository extends JpaRepository<Meal, Long> {
    List<Meal> findByTenantId(Long tenantId);
    List<Meal> findByMealDate(LocalDate mealDate);
    List<Meal> findByTenantIdAndMealDateBetween(Long tenantId, LocalDate startDate, LocalDate endDate);

    @Query("SELECT m FROM Meal m WHERE MONTH(m.mealDate) = :month AND YEAR(m.mealDate) = :year")
    List<Meal> findByMonthAndYear(@Param("month") int month, @Param("year") int year);
}
