package com.rt.dto.responceDTO;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ComplaintResponseDTO {
    private Long id;
    private String tenantName;
    private String type;
    private String description;
    private String status;
    private LocalDate createdDate;
    private String remark;
    
}
