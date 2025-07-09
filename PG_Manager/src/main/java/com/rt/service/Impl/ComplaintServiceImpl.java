package com.rt.service.Impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.dto.requestDTO.ComplaintRequestDTO;
import com.rt.dto.responceDTO.ComplaintResponseDTO;
import com.rt.entity.Complaint;
import com.rt.entity.Tenant;
import com.rt.repository.ComplaintRepository;
import com.rt.repository.TenantRepository;
import com.rt.service.ComplaintService;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ComplaintServiceImpl implements ComplaintService {

    @Autowired
    private ComplaintRepository complaintRepository;

    @Autowired
    private TenantRepository tenantRepo;

    @Override
    public void saveComplaint(ComplaintRequestDTO dto) {
        Tenant tenant = tenantRepo.findById(dto.getTenantId()).orElseThrow();

        Complaint complaint = new Complaint();
        complaint.setType(dto.getType());
        complaint.setDescription(dto.getDescription());
        complaint.setTenant(tenant);
        complaint.setStatus("Pending");
        complaint.setCreatedDate(LocalDate.now());

        complaintRepository.save(complaint);
    }

    @Override
    public List<ComplaintResponseDTO> getAllComplaintResponses() {
        return complaintRepository.findAll().stream().map(c -> {
            ComplaintResponseDTO dto = new ComplaintResponseDTO();
            dto.setId(c.getId());
            dto.setTenantName(c.getTenant().getFullName());
            dto.setType(c.getType());
            dto.setDescription(c.getDescription());
            dto.setStatus(c.getStatus());
            dto.setCreatedDate(c.getCreatedDate());
            dto.setRemark(c.getRemark());
            return dto;
        }).collect(Collectors.toList());
    }
    
    
    public void updateComplaintStatusWithRemark(Long complaintId, String status, String remark) {
        Complaint complaint = complaintRepository.findById(complaintId)
            .orElseThrow(() -> new IllegalArgumentException("Invalid complaint ID"));

        complaint.setStatus(status);

        if ("Pending".equalsIgnoreCase(status)) {
           
            complaint.setRemark(null);
        } else {

            complaint.setRemark(remark != null ? remark.trim() : null);
        }

        complaintRepository.save(complaint);
    }

}
