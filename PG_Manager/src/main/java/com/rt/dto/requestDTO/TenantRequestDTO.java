package com.rt.dto.requestDTO;

import java.time.LocalDate;

import javax.persistence.Column;

import org.springframework.format.annotation.DateTimeFormat;

public class TenantRequestDTO {

	private Long tenantId;
    private String fullName;
    private String email;
    private String mobile;
    private String gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkInDate;
    private String status;
    private String updatedBy; 
    
    private String idProofPath;

    public TenantRequestDTO() {
		super();
	}

	
    public TenantRequestDTO(Long tenantId, String fullName, String email, String mobile, String gender,
			LocalDate checkInDate, String status, String updatedBy, String idProofPath) {
		super();
		this.tenantId = tenantId;
		this.fullName = fullName;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.checkInDate = checkInDate;
		this.status = status;
		this.updatedBy = updatedBy;
		this.idProofPath = idProofPath;
	}



	public Long getTenantId() {
        return tenantId;
    }

    public void setTenantId(Long tenantId) {
        this.tenantId = tenantId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	
	public String getIdProofPath() {
		return idProofPath;
	}

	public void setIdProofPath(String idProofPath) {
		this.idProofPath = idProofPath;
	}

	

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
}
