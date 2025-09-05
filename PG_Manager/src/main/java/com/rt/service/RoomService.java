package com.rt.service;

import com.rt.entity.Bed;
import com.rt.entity.Room;

import java.util.List;

public interface RoomService {

    List<Room> saveAll(List<Room> rooms);

    String getLastRoomNumber();

	Object getAllRooms();

	List<Room> getAllRoomDetails();

	Room findById(long roomId);

	

	Room updateRoomWithBeds(Room updatedRoom);

	List<Room> getRoomsByStatus(String status);

	Room save(Room existingRoom);
}
