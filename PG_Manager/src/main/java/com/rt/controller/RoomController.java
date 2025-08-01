package com.rt.controller;

import com.rt.entity.Room;
import com.rt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class RoomController {

    @Autowired
    private RoomService roomService;

//    @GetMapping("/add")
//    public String showAddRoomForm(Model model) {
//       
//        return "Rooms/roomManagementForm";
//    }
    
    @RequestMapping("/roomManagementForm")
	public String roomManagementForm() {
		return "Rooms/roomManagementForm";

	}

    @PostMapping("/addRooms")
    public String addRooms(
            @RequestParam("roomCount") int roomCount,
            @RequestParam("roomType") String roomType,
            @RequestParam("monthlyRent") double monthlyRent,
            @RequestParam(value = "acAvailable", required = false) boolean acAvailable,
            @RequestParam(value = "attachedBathroom", required = false) boolean attachedBathroom,
            @RequestParam("status") String status) {

       
        List<Room> rooms = new ArrayList<>();

      
        String lastRoomNumber = roomService.getLastRoomNumber(); 
        int startNumber = 1;
        try {
            if (lastRoomNumber != null) {
                startNumber = Integer.parseInt(lastRoomNumber) + 1;
            }
        } catch (NumberFormatException e) {
           
            startNumber = 1;
        }

        for (int i = 0; i < roomCount; i++) {
            Room room = new Room();

            
            room.setRoomNumber(String.valueOf(startNumber + i));

            room.setRoomType(roomType);
            room.setMonthlyRent(monthlyRent);
            room.setAcAvailable(acAvailable);
            room.setAttachedBathroom(attachedBathroom);
            room.setStatus(status);

            rooms.add(room);
        }

        roomService.saveAll(rooms);

        return "Rooms/roomManagementForm"; 
    }


   

    @GetMapping("/allRooms")
    public String showRoomsWithBeds(Model model) {
        try {
            List<Room> rooms = roomService.getAllRoomDetails();
            model.addAttribute("rooms", rooms);
        } catch (Exception e) {
            System.err.println("Error fetching room details: " + e.getMessage());
            model.addAttribute("error", "Failed to load room data.");
        }
        return "Rooms/viewRooms";
    }

}
