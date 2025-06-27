package com.rt.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.entity.Bed;
import com.rt.entity.Tenant;
import com.rt.repository.BedRepository;
import com.rt.repository.TenantRepository;
import com.rt.service.AssignmentService;

@Service
public class AssignmentServiceImpl implements AssignmentService {

    @Autowired
    private TenantRepository tenantRepository;

    @Autowired
    private BedRepository bedRepository;

    public String assignBedToTenant(Long tenantId, Long bedId) {
        Tenant tenant = tenantRepository.findById(tenantId)
                .orElseThrow(() -> new RuntimeException("Tenant not found"));

        Bed bed = bedRepository.findById(bedId)
                .orElseThrow(() -> new RuntimeException("Bed not found"));

        if (!"Available".equalsIgnoreCase(bed.getStatus())) {
            return "Bed is not available";
        }

        // Update both sides
        bed.setStatus("Occupied");
        bed.setTenant(tenant); // optional
        tenant.setBed(bed);

        tenantRepository.save(tenant);
        bedRepository.save(bed);

        return "Bed assigned successfully";
    }
}
