package com.rt.service;

import com.rt.entity.Tenant;
import java.util.List;

public interface TenantService {

	
	    void saveTenant(Tenant tenant);
	    List<Tenant> getAllTenants();
	    Tenant getTenantById(Long id);
	    void deleteTenantById(Long id);
	

}
