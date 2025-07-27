package com.rt.service;

import java.util.List;

import com.rt.dto.responceDTO.BedAssignedResponseDTO;
import com.rt.entity.Bed;

public interface BedService {

	
	void assignBedToTenant(Long tenantId, Long roomId, Long bedId);

	

}
