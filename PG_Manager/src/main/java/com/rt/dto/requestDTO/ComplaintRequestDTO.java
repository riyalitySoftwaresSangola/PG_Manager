package com.rt.dto.requestDTO;

import lombok.Data;

@Data
public class ComplaintRequestDTO {
    private Long tenantId;
    private String type;
    private String description;
    private String remark;
  
}
