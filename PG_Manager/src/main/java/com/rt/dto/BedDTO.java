package com.rt.dto;

import com.rt.entity.Bed;


public class BedDTO {
    private Long bedId;
    private String bedNumber;
    private String bedType;
    private String status;

    
    public BedDTO(Bed bed) {
        this.bedId = bed.getBedId();
        this.bedNumber = bed.getBedNumber();
        this.bedType = bed.getBedType();
        this.status = bed.getStatus();
    }

	public Long getBedId() {
		return bedId;
	}

	public void setBedId(Long bedId) {
		this.bedId = bedId;
	}

	public String getBedNumber() {
		return bedNumber;
	}

	public void setBedNumber(String bedNumber) {
		this.bedNumber = bedNumber;
	}

	public String getBedType() {
		return bedType;
	}

	public void setBedType(String bedType) {
		this.bedType = bedType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

    
}
