package com.rt.service.Impl;



import com.rt.entity.Bed;
import com.rt.entity.Bill;
import com.rt.entity.Room;
import com.rt.repository.BedRepository;
import com.rt.repository.BillRepository;
import com.rt.service.BillService;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BillServiceImpl implements BillService {

    @Autowired
    private BillRepository billRepository;
    
    @Autowired
    private BedRepository bedRepository;

    @Override
    public void saveBill(Bill bill) {
        billRepository.save(bill);
    }

    @Override
    public Double getRentByCustomerId(Long tenantId) {
        Optional<Bed> bedOpt = bedRepository.findById(tenantId);
        if (bedOpt.isPresent()) {
            Bed bed = bedOpt.get();
            Room room = bed.getRoom();
            if (room != null) {
//            	System.out.println(room.getMonthlyRent());
                return room.getMonthlyRent();
            }
        }
        return 0.0; 
    }

	@Override
	public List<Bill> getAllBills() {
		List<Bill> bill = billRepository.findAll();
		return bill;
	}

	   @Override
	    public List<Bill> getBillsByCustomerId(Long customerId) {
	        return billRepository.findByCustomerId(customerId);
	    }

	@Override
	public Bill getBillById(Long billId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Bill getLatestBillByTenantId(Long tenantId) {
	    return billRepository.findTopByCustomerIdOrderByGeneratedDateDesc(tenantId);
	}


}
