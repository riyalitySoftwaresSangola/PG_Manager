package com.rt.service.Impl;

import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.repository.BedRepository;
import com.rt.repository.RoomRepository;
import com.rt.service.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomRepository roomRepository;
   
    
    @Autowired
    private BedRepository bedRepository;
    
    
    @Override
    public void saveAll(List<Room> rooms) {
//        roomRepository.saveAll(rooms);
        
        for (Room room : rooms) {
            Room savedRoom = roomRepository.save(room);

            int bedCount = getBedCountByRoomType(room.getRoomType());

            for (int i = 1; i <= bedCount; i++) {
                Bed bed = new Bed();
                bed.setBedNumber("Bed" + i);
                bed.setBedType("Single");
                bed.setStatus("Available");
                bed.setRoom(savedRoom);  
                bedRepository.save(bed);
            }
        }
        
        
    }

    private int getBedCountByRoomType(String type) {
        switch (type.toLowerCase()) {
            case "single": return 1;
            case "double": return 2;
            case "triple": return 3;
            default: return 1;
        }
        }

	@Override
    public String getLastRoomNumber() {
        return roomRepository.findLastRoomNumber();
    }

    @Override
    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }
    
    
    @Override
    public List<Room> getAllRoomDetails() {
        try {
            
        List<Room>	list = roomRepository.findAll(); 
        System.out.println(list.get(1));
        	return list ;
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch room data from DB", e);
        }
    }

	@Override
	public Room findById(long roomId) {
		Optional<Room> ExistingRoom = roomRepository.findById(roomId);
		System.out.println(ExistingRoom);
		Room room = null ;
//		if(ExistingRoom.isPresent()) {
//			room = ExistingRoom.get();
//			System.out.println(room);
//		}
		
		return null;
	}



   
}
