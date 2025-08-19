package com.rt.service;

import java.util.List;

import com.rt.entity.Bill;

public interface BillService {

	void saveBill(Bill bill);

	Double getRentByCustomerId(Long tenantId);

	List<Bill> getAllBills();

	List<Bill> getBillsByCustomerId(Long tenantId);

	Bill getBillById(Long billId);

	Bill getLatestBillByTenantId(Long tenantId);

}
