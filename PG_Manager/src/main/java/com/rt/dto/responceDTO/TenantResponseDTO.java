package com.rt.dto.responceDTO;


import java.time.LocalDate;

public class TenantResponseDTO {
    private Long tenantId;
    private String fullName;
    private String email;
    private String mobile;
    private String gender;
    private LocalDate checkInDate;
    private String status;

    
    public TenantResponseDTO() {}

    public TenantResponseDTO(Long tenantId, String fullName, String email, String mobile,
                             String gender, LocalDate checkInDate, String status) {
        this.tenantId = tenantId;
        this.fullName = fullName;
        this.email = email;
        this.mobile = mobile;
        this.gender = gender;
        this.checkInDate = checkInDate;
        this.status = status;
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
}