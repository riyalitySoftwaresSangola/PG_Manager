package com.rt.service;



import java.util.List;

import com.rt.dto.requestDTO.ComplaintRequestDTO;
import com.rt.dto.responceDTO.ComplaintResponseDTO;

public interface ComplaintService {
    void saveComplaint(ComplaintRequestDTO dto);
    List<ComplaintResponseDTO> getAllComplaintResponses();
	void updateComplaintStatusWithRemark(Long complaintId, String status, String remark);
}
