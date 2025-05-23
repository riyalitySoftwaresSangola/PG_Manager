package com.rt.entity;

import java.time.LocalDate;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Data
@Table(name = "tenants")
public class Tenant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    private String email;

    private String mobile;

    private String gender;

    private String aadhaar;

    @Column(name = "emergency_contact")
    private String emergencyContact;


@DateTimeFormat(pattern = "yyyy-MM-dd")
@Column(name = "check_in_date")
private LocalDate checkInDate;

@DateTimeFormat(pattern = "yyyy-MM-dd")
@Column(name = "check_out_date")
private LocalDate checkOutDate;
    private String status;

    // Mapping to id_proof_path (file path string) - if you want to store file path
    @Column(name = "id_proof_path")
    private String idProofPath;

    // Or if you want to store file contents in DB as BLOB
    // @Lob
    // private byte[] idProof;

    // These two fields are not present in your table, so skip or add new columns accordingly
    // private String idProofName;
    // private String idProofType;

    @Column(name = "agreed_to_terms")
    private Boolean agreedToTerms;
}
