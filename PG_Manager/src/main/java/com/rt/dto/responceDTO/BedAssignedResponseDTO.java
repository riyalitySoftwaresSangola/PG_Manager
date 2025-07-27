package com.rt.dto.responceDTO;

import java.time.LocalDate;

public class BedAssignedResponseDTO {

    private Long id;
    private Long bedId;
    private String bedNumber;
    private Long roomId;
    private String roomNumber;
    private Long tenantId;
    private String tenantName;
    private LocalDate assignDate;
    private LocalDate vacateDate;
    private String status;
    private String remarks;

   
    public static class Builder {
        private final BedAssignedResponseDTO dto = new BedAssignedResponseDTO();

        public Builder id(Long id) {
            dto.id = id;
            return this;
        }

        public Builder bedId(Long bedId) {
            dto.bedId = bedId;
            return this;
        }

        public Builder bedNumber(String bedNumber) {
            dto.bedNumber = bedNumber;
            return this;
        }

        public Builder roomId(Long roomId) {
            dto.roomId = roomId;
            return this;
        }

        public Builder roomNumber(String roomNumber) {
            dto.roomNumber = roomNumber;
            return this;
        }

        public Builder tenantId(Long tenantId) {
            dto.tenantId = tenantId;
            return this;
        }

        public Builder tenantName(String tenantName) {
            dto.tenantName = tenantName;
            return this;
        }

        public Builder assignDate(LocalDate assignDate) {
            dto.assignDate = assignDate;
            return this;
        }

        public Builder vacateDate(LocalDate vacateDate) {
            dto.vacateDate = vacateDate;
            return this;
        }

        public Builder status(String status) {
            dto.status = status;
            return this;
        }

        public Builder remarks(String remarks) {
            dto.remarks = remarks;
            return this;
        }

        public BedAssignedResponseDTO build() {
            return dto;
        }
    }

   
    public Long getId() { return id; }
    public Long getBedId() { return bedId; }
    public String getBedNumber() { return bedNumber; }
    public Long getRoomId() { return roomId; }
    public String getRoomNumber() { return roomNumber; }
    public Long getTenantId() { return tenantId; }
    public String getTenantName() { return tenantName; }
    public LocalDate getAssignDate() { return assignDate; }
    public LocalDate getVacateDate() { return vacateDate; }
    public String getStatus() { return status; }
    public String getRemarks() { return remarks; }
}
