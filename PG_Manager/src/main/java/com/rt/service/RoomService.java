package com.rt.service;

import com.rt.entity.Room;

import java.util.List;

public interface RoomService {

    void saveAll(List<Room> rooms);

    String getLastRoomNumber();

	Object getAllRooms();

	List<Room> getAllRoomDetails();
}
