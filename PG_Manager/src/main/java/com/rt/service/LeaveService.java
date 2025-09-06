package com.rt.service;

import java.util.List;

import com.rt.entity.LeaveRequest;

public interface LeaveService { 
	LeaveRequest saveLeave(LeaveRequest leaveRequest);

void approveLeave(Long leaveId);
void rejectLeave(Long leaveId);
List<LeaveRequest> getLeavesByTenant(Long tenantId);
List<LeaveRequest> getAllLeaves();
}