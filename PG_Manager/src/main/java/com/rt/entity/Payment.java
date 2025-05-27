package com.rt.entity;

import javax.persistence.*;

import lombok.Data;

import java.time.LocalDate;

@Entity
@Data
@Table(name = "payments")
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long billId;

    private LocalDate paymentDate;

    private double amountPaid;

    private String paymentMode;

    private String transactionId;

   
}
