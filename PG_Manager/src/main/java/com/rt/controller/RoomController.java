package com.rt.controller;

import com.rt.entity.Room;
import com.rt.entity.Tenant;
import com.rt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
            @RequestParam("status") String status,
            Model model) {

       
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

       
        
        try {
            List<Room> savedRooms = roomService.saveAll(rooms);

            int totalBeds = savedRooms.stream()
                    .mapToInt(r -> r.getBeds() != null ? r.getBeds().size() : 0)
                    .sum();

            model.addAttribute("successMessage",
                    roomCount + " rooms added successfully with  " + totalBeds + " beds.");
        } catch (Exception e) {
            model.addAttribute("errorMessage",
                    "Failed to add rooms: " + e.getMessage());
        }


        return "Rooms/roomManagementForm"; 
    }

    @GetMapping("/UpdateRoom")
    public String showUpdateRoomForm(@RequestParam("id") Long roomId, Model model) {

        Room room = roomService.findById(roomId);

        if (room == null) {
            
            model.addAttribute("errorMessage", "Room not found with ID: " + roomId);
            return "Rooms/viewRooms"; 
        }

        model.addAttribute("room", room);

        return "Rooms/updateRoom"; 
    }
    
    
    
//    @PostMapping("/updateRoom")
//    public String updateRoom(
//            @RequestParam("roomId") Long roomId,
//            @RequestParam("roomNumber") String roomNumber,
//            @RequestParam("roomType") String roomType,
//            @RequestParam("monthlyRent") Double monthlyRent,
//            @RequestParam(value = "acAvailable", required = false) String acAvailable,
//            @RequestParam(value = "attachedBathroom", required = false) String attachedBathroom,
//            @RequestParam("status") String status,
//            RedirectAttributes redirectAttributes) {
//
//       
//        Room existingRoom = roomService.findById(roomId);
//        if (existingRoom == null) {
//            redirectAttributes.addFlashAttribute("errorMessage", "Room not found!");
//            return "redirect:/rooms";
//        }
//
//       
//        existingRoom.setRoomNumber(roomNumber);
//        existingRoom.setRoomType(roomType);
//        existingRoom.setMonthlyRent(monthlyRent);
//        existingRoom.setAcAvailable(acAvailable != null);
//        existingRoom.setAttachedBathroom(attachedBathroom != null);
//        existingRoom.setStatus(status);
//
//     
//        roomService.updateRoomWithBeds(existingRoom);
//
//       
//        redirectAttributes.addFlashAttribute("successMessage", "Room updated successfully!");
//
//        return "redirect:/allRooms";
//    }

    
    @PostMapping("/updateRoom")
    public String updateRoom(
            @RequestParam("roomId") Long roomId,
            @RequestParam("roomNumber") String roomNumber,
            @RequestParam("roomType") String roomType,
            @RequestParam("monthlyRent") Double monthlyRent,
            @RequestParam(value = "acAvailable", required = false) String acAvailable,
            @RequestParam(value = "attachedBathroom", required = false) String attachedBathroom,
            @RequestParam("status") String status,
            RedirectAttributes redirectAttributes) {

        try {
            Room existingRoom = roomService.findById(roomId);
            if (existingRoom == null) {
                redirectAttributes.addFlashAttribute("errorMessage", "Room not found!");
                return "redirect:/rooms";
            }

         
            existingRoom.setRoomNumber(roomNumber);
            existingRoom.setRoomType(roomType);
            existingRoom.setMonthlyRent(monthlyRent);
            existingRoom.setAcAvailable(acAvailable != null);
            existingRoom.setAttachedBathroom(attachedBathroom != null);
            existingRoom.setStatus(status);

           
            roomService.updateRoomWithBeds(existingRoom);

            redirectAttributes.addFlashAttribute("successMessage", "Room updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating room: " + e.getMessage());
        }

        return "redirect:/allRooms";
    }


    @GetMapping("/roomsByStatus")
    public String showRoomsByStatus(@RequestParam("status") String status, Model model) {
        try {
         
            List<Room> rooms = roomService.getRoomsByStatus(status);
            model.addAttribute("rooms", rooms);
            model.addAttribute("selectedStatus", status); 
        } catch (Exception e) {
            System.err.println("Error fetching room details: " + e.getMessage());
            model.addAttribute("error", "Failed to load room data.");
        }
        return "Rooms/viewRooms";
    }

    @GetMapping("/DeleteRoom")
    public String deleteRoom(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        Room existingRoom = roomService.findById(id);

        if (existingRoom == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Room not found with ID: " + id);
            return "redirect:/allRooms";
        }

      
        existingRoom.setStatus("Left");
        roomService.save(existingRoom);

        redirectAttributes.addFlashAttribute("successMessage", "Room status changed to 'Left' successfully!");
        return "redirect:/allRooms";
    }
    
    @GetMapping("/toggleRoomStatus")
    public String toggleRoomStatus(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        Room existingRoom = roomService.findById(id);

        if (existingRoom == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Room not found with ID: " + id);
            return "redirect:/allRooms";
        }

        
        if ("Active".equalsIgnoreCase(existingRoom.getStatus())) {
            existingRoom.setStatus("Left");
            redirectAttributes.addFlashAttribute("successMessage", "Room status changed to 'Left' successfully!");
        } else {
            existingRoom.setStatus("Active");
            redirectAttributes.addFlashAttribute("successMessage", "Room status changed to 'Active' successfully!");
        }

        roomService.save(existingRoom);

        return "redirect:/allRooms";
    }
    
    @GetMapping("/filterRooms")
    public String filterRooms(@RequestParam(value = "status", required = false) String status, Model model) {
        List<Room> rooms;

        if (status != null && !status.isEmpty()) {
            rooms = roomService.getRoomsByStatus(status);
        } else {
            rooms = (List<Room>) roomService.getAllRooms(); 
        }

        model.addAttribute("rooms", rooms);
        return "Rooms/viewRooms";  // make sure you have a JSP for listing rooms
    }



   

    @GetMapping("/allRooms")
    public String showRoomsWithBeds(Model model) {
        try {
        	 List<Room> activeRooms = roomService.getRoomsByStatus("Active");
            model.addAttribute("rooms", activeRooms);
        } catch (Exception e) {
            System.err.println("Error fetching room details: " + e.getMessage());
            model.addAttribute("error", "Failed to load room data.");
        }
        return "Rooms/viewRooms";
    }

}
