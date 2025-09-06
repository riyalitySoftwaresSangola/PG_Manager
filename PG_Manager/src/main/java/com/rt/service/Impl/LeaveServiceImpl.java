package com.rt.service.Impl;


import com.rt.entity.LeaveRequest;
import com.rt.entity.LeaveStatus;
import com.rt.repository.LeaveRequestRepository;
import com.rt.repository.TenantRepository;
import com.rt.service.LeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveServiceImpl implements LeaveService {

    @Autowired
    private LeaveRequestRepository leaveRequestRepository;

    @Autowired
    private TenantRepository tenantRepository;

    @Override
    public LeaveRequest saveLeave(LeaveRequest leaveRequest) {
       
        if (leaveRequest.getTenant() != null && leaveRequest.getTenant().getId() != null) {
            leaveRequest.setTenant(
                tenantRepository.findById(leaveRequest.getTenant().getId())
                        .orElseThrow(() -> new RuntimeException("Tenant not found"))
            );
        } else {
            throw new RuntimeException("Tenant information missing in leave request");
        }

        leaveRequest.setStatus(LeaveStatus.PENDING); // default
        return leaveRequestRepository.save(leaveRequest);
    }

    @Override
    public void approveLeave(Long leaveId) {
        LeaveRequest leave = leaveRequestRepository.findById(leaveId)
                .orElseThrow(() -> new RuntimeException("Leave not found"));
        leave.setStatus(LeaveStatus.APPROVED);
        leaveRequestRepository.save(leave);
    }

    @Override
    public void rejectLeave(Long leaveId) {
        LeaveRequest leave = leaveRequestRepository.findById(leaveId)
                .orElseThrow(() -> new RuntimeException("Leave not found"));
        leave.setStatus(LeaveStatus.REJECTED);
        leaveRequestRepository.save(leave);
    }

    @Override
    public List<LeaveRequest> getLeavesByTenant(Long tenantId) {
        return leaveRequestRepository.findByTenantId(tenantId);
    }

    @Override
    public List<LeaveRequest> getAllLeaves() {
        return leaveRequestRepository.findAll();
    }
}
