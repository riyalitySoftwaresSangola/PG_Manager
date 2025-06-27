package com.rt.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

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

//    @ManyToOne
//    @JoinColumn(name = "room_id")
//    private Room room;

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

	// These two fields are not present in your table, so skip or add new columns
	// accordingly
	// private String idProofName;
	// private String idProofType;

	@Column(name = "agreed_to_terms")
	private Boolean agreedToTerms;

//    @OneToOne
//    @JoinColumn(name = "bed_assignment_id")
//    private BedAssignment bedAssignment;

	private String createdBy;

	@Column(name = "created_date", updatable = false)
	private LocalDateTime createdDate;

	@Column(name = "updated_by")
	private String updatedBy;

	@Column(name = "updated_date")
	private LocalDateTime updatedDate;

	  @OneToOne
	    @JoinColumn(name = "bed_id", unique = true)
	    private Bed assignedBed;

	public Tenant(Long id, String fullName, String email, String mobile, String gender, String aadhaar,
			String emergencyContact, LocalDate checkInDate, LocalDate checkOutDate, String status, String idProofPath,
			Boolean agreedToTerms, String createdBy, LocalDateTime createdDate, String updatedBy,
			LocalDateTime updatedDate, Bed assignedBed) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.aadhaar = aadhaar;
		this.emergencyContact = emergencyContact;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.status = status;
		this.idProofPath = idProofPath;
		this.agreedToTerms = agreedToTerms;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.updatedBy = updatedBy;
		this.updatedDate = updatedDate;
		this.assignedBed = assignedBed;
	}

	public void setBed(Bed bed) {
	    this.assignedBed = bed;
	}
	
	public Bed getBed() {
	    return assignedBed;
	}

	public Tenant() {
		super();
	}


	

	

}
