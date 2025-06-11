package com.rt.service.Impl;

import com.rt.dto.tenantDTO.TenantResponseDTO;
import com.rt.entity.Tenant;
import com.rt.repository.TenantRepository;
import com.rt.service.TenantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TenantServiceImpl implements TenantService {

    @Autowired
    private TenantRepository tenantRepository;

    @Override
    public void saveTenant(Tenant tenant) {
        
        if (tenant.getCheckInDate() == null) {
            tenant.setCheckInDate(LocalDate.now());
        }

        
        if (tenant.getCheckOutDate() == null) {
            tenant.setCheckOutDate(tenant.getCheckInDate().plusMonths(1));
        }

        tenantRepository.save(tenant);
    }


    @Override
    public Tenant getTenantById(Long id) {
        Optional<Tenant> tenant = tenantRepository.findById(id);
        return tenant.orElse(null);
    }

    @Override
    public List<Tenant> getAllTenants() {
        return tenantRepository.findAll();
    }
    
    @Override
    public List<TenantResponseDTO> convertToDTOList(List<Tenant> tenants) {
        return tenants.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    
    
    @Override
    public TenantResponseDTO convertToDTO(Tenant tenant) {
        return new TenantResponseDTO(
            tenant.getId(),
            tenant.getFullName(),
            tenant.getEmail(),
            tenant.getMobile(),
            tenant.getGender(),
            tenant.getCheckInDate(),
            tenant.getStatus()
        );
    }


    @Override
    public void deleteTenantById(Long id) {
        tenantRepository.deleteById(id);
    }


	@Override
	public String assignBedToTenant(Tenant tenant) {
		// TODO Auto-generated method stub
		return null;
	}
    
    
}
