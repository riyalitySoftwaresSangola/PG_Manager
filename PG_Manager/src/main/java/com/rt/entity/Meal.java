package com.rt.entity;

import javax.persistence.*;
import lombok.Data;
import java.time.LocalDate;

@Entity
@Data
@Table(name = "meals")
public class Meal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "meal_date", nullable = false)
    private LocalDate mealDate;

    @Column(nullable = false)
    private boolean breakfast;

    @Column(nullable = false)
    private boolean lunch;

    @Column(nullable = false)
    private boolean dinner;

    @ManyToOne
    @JoinColumn(name = "tenant_id", nullable = false)
    private Tenant tenant;
}