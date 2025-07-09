package com.rt.entity;

import java.time.LocalDate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Table(name = "complaint")  
@Data
public class Complaint {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type;

    @Column(length = 1000)
    private String description;

    private String status;

    private LocalDate createdDate;

    @NotNull(message = "Tenant must not be null")
    @ManyToOne
    @JoinColumn(name = "tenant_id", nullable = false)
    private Tenant tenant;
    
    
    @Column(length = 1000)
    private String remark;
    
    
    
	/*
	 * ALTER TABLE complaint ADD COLUMN remark VARCHAR(1000);
	 */
}
