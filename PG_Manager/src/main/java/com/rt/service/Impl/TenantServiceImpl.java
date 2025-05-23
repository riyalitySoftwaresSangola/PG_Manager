package com.rt.service.Impl;

import com.rt.entity.Tenant;
import com.rt.repository.TenantRepository;
import com.rt.service.TenantService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

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
    public void deleteTenantById(Long id) {
        tenantRepository.deleteById(id);
    }
}
