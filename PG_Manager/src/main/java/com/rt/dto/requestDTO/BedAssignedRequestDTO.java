package com.rt.dto.requestDTO;

import java.time.LocalDate;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class BedAssignedRequestDTO {

    @NotNull(message = "Bed ID is required")
    private Long bedId;

    @NotNull(message = "Room ID is required")
    private Long roomId;

    @NotNull(message = "Tenant ID is required")
    private Long tenantId;

    @NotNull(message = "Assign Date is required")
    private LocalDate assignDate;

    private LocalDate vacateDate;

    private String status;

    private String remarks;

   
}
