package com.rt.service;

import com.rt.dto.responceDTO.TenantResponseDTO;
import com.rt.entity.Room;
import com.rt.entity.Tenant;
import java.util.List;
import java.util.Optional;

public interface TenantService {

	
	    void saveTenant(Tenant tenant);
	    List<Tenant> getAllTenants();
	    Tenant getTenantById(Long id);
	    void deleteTenantById(Long id);
		TenantResponseDTO convertToDTO(Tenant tenant);
		List<TenantResponseDTO> convertToDTOList(List<Tenant> tenants);
		List<Tenant> getTenantsByStatus(String status);
		
		Tenant findById(Long tenantId);
		Room AssignedBedToTenant(Long tenantId, Long roomId, Long bedId);
		void save(Tenant tenant);
	

}
