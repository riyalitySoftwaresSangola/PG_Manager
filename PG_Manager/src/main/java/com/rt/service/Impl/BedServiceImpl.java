package com.rt.service.Impl;

import com.rt.dto.responceDTO.BedAssignedResponseDTO;
import com.rt.entity.Bed;
import com.rt.entity.BedAssigned;
import com.rt.entity.Room;
import com.rt.entity.Tenant;
import com.rt.mapper.BedAssignedMapper;
import com.rt.repository.BedAssignedRepository;
import com.rt.repository.BedRepository;
import com.rt.repository.RoomRepository;
import com.rt.repository.TenantRepository;
import com.rt.service.BedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class BedServiceImpl implements BedService {

    @Autowired
    private RoomRepository roomRepository;
   
    
    @Autowired
    private BedRepository bedRepository;
    
    @Autowired
    private TenantRepository tenantRepository;

    @Autowired
    private BedAssignedRepository bedAssignedRepository ;

	


	
	 
    @Override
    public void assignBedToTenant(Long tenantId, Long roomId, Long bedId) {

       
        Tenant tenant = tenantRepository.findById(tenantId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid tenant ID"));

        if (!"Active".equalsIgnoreCase(tenant.getStatus())) {
            throw new RuntimeException("Tenant is not active. Cannot assign bed.");
        }

       
        List<BedAssigned> tenantAssignments = bedAssignedRepository.findByTenant_IdAndStatus(tenantId, "Assigned");
        if (!tenantAssignments.isEmpty()) {
            throw new RuntimeException("This tenant is already assigned a bed.");
        }

      
        List<BedAssigned> bedAssignments = bedAssignedRepository.findByBed_BedIdAndStatus(bedId, "Assigned");
        if (!bedAssignments.isEmpty()) {
            throw new RuntimeException("This bed is already assigned to another tenant.");
        }

        
        Room room = roomRepository.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid room ID"));

        Bed bed = bedRepository.findByBedIdAndRoomId(bedId, roomId)
                .orElseThrow(() -> new IllegalArgumentException("Bed not found for provided Bed ID and Room ID."));

       
        BedAssigned bedAssigned = new BedAssigned();
        bedAssigned.setTenant(tenant);
        bedAssigned.setRoom(room);
        bedAssigned.setBed(bed);
        bedAssigned.setAssignDate(LocalDate.now());
        bedAssigned.setStatus("Assigned");

        bedAssignedRepository.save(bedAssigned);
    }



//	@Override
//	public List<BedAssignedResponseDTO> getAllBedAssignments() {
//		// TODO Auto-generated method stub
//		return null;
//	}


	





   
}
