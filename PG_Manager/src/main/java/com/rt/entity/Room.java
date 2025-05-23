package com.rt.entity;

import javax.persistence.*;

import lombok.Data;

@Entity
@Data
@Table(name = "rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "room_number")
    private String roomNumber;

    @Column(name = "room_type")
    private String roomType;

    @Column(name = "monthly_rent")
    private double monthlyRent;

    @Column(name = "ac_available")
    private boolean acAvailable;

    @Column(name = "attached_bathroom")
    private boolean attachedBathroom;

    @Column(name = "status")
    private String status;
}
