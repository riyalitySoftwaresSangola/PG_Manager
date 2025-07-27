package com.rt.entity;


import java.time.LocalDate;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;



import javax.persistence.*;

@Entity
@Table(name = "bedAssigned")
public class BedAssigned {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Bed is required")
    @ManyToOne
    @JoinColumn(name = "bed_id")
    private Bed bed;

    @NotNull(message = "Room is required")
    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @NotNull(message = "Tenant is required")
    @ManyToOne
    @JoinColumn(name = "tenant_id")
    private Tenant tenant;

    @NotNull(message = "Assign date is required")
    @Column(name = "assign_date")
    private LocalDate assignDate;

    @Column(name = "vacate_date")
    private LocalDate vacateDate;

    private String status;

    private String remarks;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Bed getBed() {
        return bed;
    }

    public void setBed(Bed bed) {
        this.bed = bed;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public void setTenant(Tenant tenant) {
        this.tenant = tenant;
    }

    public LocalDate getAssignDate() {
        return assignDate;
    }

    public void setAssignDate(LocalDate assignDate) {
        this.assignDate = assignDate;
    }

    public LocalDate getVacateDate() {
        return vacateDate;
    }

    public void setVacateDate(LocalDate vacateDate) {
        this.vacateDate = vacateDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}