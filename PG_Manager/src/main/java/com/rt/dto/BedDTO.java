package com.rt.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.rt.entity.Bed;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.Getter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class BedDTO {

    @JsonProperty("bedId")
    private Long bedId;

    @JsonProperty("bedNumber")
    private String bedNumber;

    @JsonProperty("bedType")
    private String bedType;

    @JsonProperty("status")
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
