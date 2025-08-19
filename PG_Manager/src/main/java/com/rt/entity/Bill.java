package com.rt.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Entity
@Table(name = "bills")
public class Bill {

	  @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @NotNull(message = "Customer ID is required")
	    private Long customerId;

	    @NotBlank(message = "Billing month is required")
	    private String billingMonth;

	    @NotNull(message = "Rent is required")
	    @PositiveOrZero(message = "Rent must be 0 or more")
	    private Double rent;

	    @NotNull(message = "Meal charges are required")
	    @PositiveOrZero(message = "Meal charges must be 0 or more")
	    private Double mealCharges;

	    @NotNull(message = "Electricity charges are required")
	    @PositiveOrZero(message = "Electricity charges must be 0 or more")
	    private Double electricityCharges;

	    @NotNull(message = "Other charges are required")
	    @PositiveOrZero(message = "Other charges must be 0 or more")
	    private Double otherCharges;

	    @NotNull(message = "Total amount is required")
	    @PositiveOrZero(message = "Total amount must be 0 or more")
	    private Double totalAmount;

	    @NotBlank(message = "Status is required")
	    private String status;

	    @NotNull(message = "Generated date is required")
	    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	    private LocalDate generatedDate;

    public Bill() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getBillingMonth() {
        return billingMonth;
    }

    public void setBillingMonth(String billingMonth) {
        this.billingMonth = billingMonth;
    }

    public Double getRent() {
        return rent;
    }

    public void setRent(Double rent) {
        this.rent = rent;
    }

    public Double getMealCharges() {
        return mealCharges;
    }

    public void setMealCharges(Double mealCharges) {
        this.mealCharges = mealCharges;
    }

    public Double getElectricityCharges() {
        return electricityCharges;
    }

    public void setElectricityCharges(Double electricityCharges) {
        this.electricityCharges = electricityCharges;
    }

    public Double getOtherCharges() {
        return otherCharges;
    }

    public void setOtherCharges(Double otherCharges) {
        this.otherCharges = otherCharges;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getGeneratedDate() {
        return generatedDate;
    }

    public void setGeneratedDate(LocalDate generatedDate) {
        this.generatedDate = generatedDate;
    }
}
