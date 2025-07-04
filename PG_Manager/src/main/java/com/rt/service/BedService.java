package com.rt.service;

import java.util.List;

import com.rt.entity.Bed;

public interface BedService {

	List<Bed> getAvailableBedsByRoom(Long roomId);

	

}
