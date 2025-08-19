package com.rt.dto.requestDTO;

import lombok.Data;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

@Data
public class BillRequestDTO {
    private Long customerId;
    private String billingMonth;
    private Double rent;
    private Double mealCharges;
    private Double electricityCharges;
    private Double otherCharges;
    private String status;
    
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate generatedDate;
}
