package com.rt.service.Impl;

import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.repository.BedRepository;
import com.rt.repository.RoomRepository;
import com.rt.service.BedService;
import com.rt.service.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BedServiceImpl implements BedService {

    @Autowired
    private RoomRepository roomRepository;
   
    
    @Autowired
    private BedRepository bedRepository;


	@Override
	public List<Bed> getAvailableBedsByRoom(Long roomId) {
//		 return bedRepository.findAvailableBedsByRoom(roomId);
		return null;
	}


	



   
}
