package com.rt.service;

import com.rt.dto.tenantDTO.TenantResponseDTO;
import com.rt.entity.Tenant;
import java.util.List;

public interface TenantService {

	
	    void saveTenant(Tenant tenant);
	    List<Tenant> getAllTenants();
	    Tenant getTenantById(Long id);
	    void deleteTenantById(Long id);
		TenantResponseDTO convertToDTO(Tenant tenant);
		List<TenantResponseDTO> convertToDTOList(List<Tenant> tenants);
		List<Tenant> getTenantsByStatus(String status);
		Tenant findById(Long tenantId);
	

}
