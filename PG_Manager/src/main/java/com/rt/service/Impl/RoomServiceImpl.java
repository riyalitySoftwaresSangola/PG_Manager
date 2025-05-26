package com.rt.service.Impl;

import com.rt.entity.Room;
import com.rt.repository.RoomRepository;
import com.rt.service.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomRepository roomRepository;

    @Override
    public void saveAll(List<Room> rooms) {
        roomRepository.saveAll(rooms);
    }

    @Override
    public String getLastRoomNumber() {
        return roomRepository.findLastRoomNumber();
    }

    @Override
    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }


   
}
