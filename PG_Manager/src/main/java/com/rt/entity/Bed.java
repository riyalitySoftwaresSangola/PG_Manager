package com.rt.entity;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bedId;

    private String bedNumber;    // ➕ Added
    private String bedType;      // e.g., Single, Double
    private String status;       // e.g., Available, Occupied

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @OneToOne(mappedBy = "assignedBed")
    private Tenant tenant;

	
}
