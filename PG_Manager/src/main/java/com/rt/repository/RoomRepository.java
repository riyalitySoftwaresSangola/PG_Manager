package com.rt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.rt.entity.Room;

public interface RoomRepository extends JpaRepository<Room, Long> {

	  @Query(value = "SELECT room_number FROM rooms ORDER BY CAST(room_number AS UNSIGNED) DESC LIMIT 1", nativeQuery = true)
	    String findLastRoomNumber();
	  
	  List<Room> findAll();
	  
	  
//	  @Query("SELECT DISTINCT r FROM Room r LEFT JOIN FETCH r.beds b LEFT JOIN FETCH b.tenant")
//	  List<Room> fetchRoomsWithBedsAndTenants();

	}
