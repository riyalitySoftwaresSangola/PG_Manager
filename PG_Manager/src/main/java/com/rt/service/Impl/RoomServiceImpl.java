package com.rt.service.Impl;

import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.repository.BedRepository;
import com.rt.repository.RoomRepository;
import com.rt.service.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomRepository roomRepository;
   
    
    @Autowired
    private BedRepository bedRepository;
    
    
//    @Override
//    public void saveAll(List<Room> rooms) {
////        roomRepository.saveAll(rooms);
//    	
//    	  List<Room> savedRooms = new ArrayList<>();
//        
//        for (Room room : rooms) {
//            Room savedRoom = roomRepository.save(room);
//
//            int bedCount = getBedCountByRoomType(room.getRoomType());
//
//            for (int i = 1; i <= bedCount; i++) {
//                Bed bed = new Bed();
//                bed.setBedNumber("Bed" + i);
//                bed.setBedType("Single");
//                bed.setStatus("Available");
//                bed.setRoom(savedRoom);  
//                
//                bedRepository.save(bed);
//                
//                savedRooms.add(savedRoom);
//            }
//        }
//        
//        
//    }
    
    
    @Override
    public List<Room> saveAll(List<Room> rooms) {
        List<Room> savedRooms = new ArrayList<>();

        for (Room room : rooms) {
         
            Room savedRoom = roomRepository.save(room);

           
            List<Bed> beds = new ArrayList<>();

            int bedCount = getBedCountByRoomType(room.getRoomType());

            for (int i = 1; i <= bedCount; i++) {
                Bed bed = new Bed();
                bed.setBedNumber("Bed" + i);
                bed.setBedType("Single");
                bed.setStatus("Available");
                bed.setRoom(savedRoom);

                Bed savedBed = bedRepository.save(bed);
                beds.add(savedBed);
            }


            savedRoom.setBeds(beds);

            savedRooms.add(savedRoom);
        }

        return savedRooms;
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
        return roomRepository.findById(roomId)
                .orElseThrow(() -> new RuntimeException("Room not found with ID: " + roomId));
    }

    @Override
    public List<Room> getRoomsByStatus(String status) {
        return roomRepository.findByStatus(status);
    }


    @Override
    public Room updateRoomWithBeds(Room updatedRoom) {
       
        Room existingRoom = roomRepository.findById(updatedRoom.getId())
                .orElseThrow(() -> new RuntimeException("Room not found with id: " + updatedRoom.getId()));

       
        existingRoom.setRoomNumber(updatedRoom.getRoomNumber());
        existingRoom.setRoomType(updatedRoom.getRoomType());
        existingRoom.setMonthlyRent(updatedRoom.getMonthlyRent());
        existingRoom.setAcAvailable(updatedRoom.isAcAvailable());
        existingRoom.setAttachedBathroom(updatedRoom.isAttachedBathroom());
        existingRoom.setStatus(updatedRoom.getStatus());

        Room savedRoom = roomRepository.save(existingRoom);

       
        List<Bed> existingBeds = bedRepository.findByRoomId(savedRoom.getId());

     
        int requiredBedCount = getBedCountByRoomType(savedRoom.getRoomType());

      
        if (requiredBedCount > existingBeds.size()) {
            for (int i = existingBeds.size() + 1; i <= requiredBedCount; i++) {
                Bed bed = new Bed();
                bed.setBedNumber("Bed" + i);
                bed.setBedType("Single");
                bed.setStatus("Available");
                bed.setRoom(savedRoom);
                bedRepository.save(bed);
            }
        }

        
        else if (requiredBedCount < existingBeds.size()) {
            List<Bed> extraBeds = existingBeds.subList(requiredBedCount, existingBeds.size());
            bedRepository.deleteAll(extraBeds);
        }

        
        for (int i = 0; i < Math.min(requiredBedCount, existingBeds.size()); i++) {
            Bed bed = existingBeds.get(i);
            bed.setBedNumber("Bed" + (i + 1));
            bed.setRoom(savedRoom);
            bedRepository.save(bed);
        }

       
        List<Bed> updatedBeds = bedRepository.findByRoomId(savedRoom.getId());
        savedRoom.setBeds(updatedBeds);

        return savedRoom;
    }

    @Override
    public Room save(Room room) {
        return roomRepository.save(room);
    }


   
}
