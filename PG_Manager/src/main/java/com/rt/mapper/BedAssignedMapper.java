package com.rt.mapper;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.rt.dto.responceDTO.BedAssignedResponseDTO;
import com.rt.entity.Bed;
import com.rt.entity.BedAssigned;
import com.rt.entity.Room;
import com.rt.entity.Tenant;

public class BedAssignedMapper {

//	public static BedAssignedResponseDTO toResponse(BedAssigned entity) {
//		return new BedAssignedResponseDTO.Builder().id(entity.getId())
//				.bedId(Optional.ofNullable(entity.getBed()).map(Bed::getBedId).orElse(null))
//				.bedNumber(Optional.ofNullable(entity.getBed()).map(Bed::getBedNumber).orElse(null))
//				.roomId(Optional.ofNullable(entity.getRoom()).map(Room::getId).orElse(null))
//				.roomNumber(Optional.ofNullable(entity.getRoom()).map(Room::getRoomNumber).orElse(null))
//				.tenantId(Optional.ofNullable(entity.getTenant()).map(Tenant::getId).orElse(null))
//				.tenantName(Optional.ofNullable(entity.getTenant()).map(Tenant::getFullName).orElse(null))
//				.assignDate(entity.getAssignDate()).vacateDate(entity.getVacateDate()).status(entity.getStatus())
//				.remarks(entity.getRemarks()).build();
//	}
//
//    public static List<BedAssignedResponseDTO> toResponseList(List<BedAssigned> list) {
//        return list.stream()
//                .map(BedAssignedMapper::toResponse)
//                .collect(Collectors.toList());
//    }
}
