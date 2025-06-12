package com.rt.repository;

import com.rt.entity.Tenant;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TenantRepository extends JpaRepository<Tenant, Long> {
	
	List<Tenant> findByStatus(String status);

}
