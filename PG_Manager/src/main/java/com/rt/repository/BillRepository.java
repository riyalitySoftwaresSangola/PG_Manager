package com.rt.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rt.entity.Bill;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {

	List<Bill> findByCustomerId(Long customerId);

	Bill findTopByCustomerIdOrderByGeneratedDateDesc(Long tenantId);
}
