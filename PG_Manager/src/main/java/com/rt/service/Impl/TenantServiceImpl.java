package com.rt.service.Impl;

import com.rt.dto.responceDTO.TenantResponseDTO;
import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.entity.Tenant;
import com.rt.repository.BedRepository;
import com.rt.repository.RoomRepository;
import com.rt.repository.TenantRepository;
import com.rt.service.TenantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TenantServiceImpl implements TenantService {

    @Autowired
    private TenantRepository tenantRepository;
    
    @Autowired
    private RoomRepository roomRepository;
    
    
    @Autowired
    private BedRepository bedRepository;

    @Override
    public void saveTenant(Tenant tenant) {
        
        if (tenant.getCheckInDate() == null) {
            tenant.setCheckInDate(LocalDate.now());
        }

        
        if (tenant.getCheckOutDate() == null) {
            tenant.setCheckOutDate(tenant.getCheckInDate().plusMonths(1));
        }
        
        tenant.setCreatedDate(LocalDateTime.now());


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
    public List<Tenant> getTenantsByStatus(String status) {
        return tenantRepository.findByStatus(status);
    }


	@Override
	public Tenant findById(Long tenantId) {
		Optional<Tenant> ExistingTenant = tenantRepository.findById(tenantId);
		Tenant tenant = null;
		if(ExistingTenant.isPresent()) {
			
			 tenant = ExistingTenant.get();
			 System.out.println("data : = > "+ tenant );
		}
		return tenant;
	}


	
	


	@Override
	public Room AssignedBedToTenant(Long tenantId, Long roomId, Long bedId) {
		Tenant tenant = findById(bedId);
//		Optional<Bed> ExistingBed =bedRepository.findById(bedId);
		  
		
		 
//		if(ExistingBed.isPresent()) {
//			
//			 System.out.println("data : = > "+  ExistingBed.get());
//			 
//			
//		}
			return null;
	}


	@Override
	public void save(Tenant tenant) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<Tenant> findTenantsByMonth(int year, int monthValue) {
	    LocalDate startDate = LocalDate.of(year, monthValue, 1);
	    LocalDate endDate = startDate.withDayOfMonth(startDate.lengthOfMonth());

	    return tenantRepository.findByCheckInDateBetween(startDate, endDate);
	}


	

	
    
    
}
