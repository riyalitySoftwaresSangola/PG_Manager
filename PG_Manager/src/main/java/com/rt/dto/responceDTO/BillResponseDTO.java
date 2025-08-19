package com.rt.dto.responceDTO;

import lombok.Data;
import java.time.LocalDate;

@Data
public class BillResponseDTO {
    private Long id;
    private String tenantName;
    private String billingMonth;
    private Double rent;
    private Double mealCharges;
    private Double electricityCharges;
    private Double otherCharges;
    private Double totalAmount;
    private String status;
    private LocalDate generatedDate;
}
