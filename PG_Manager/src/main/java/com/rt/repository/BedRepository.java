package com.rt.repository;

import com.rt.entity.Bed;
import com.rt.entity.Room;
import com.rt.entity.Tenant;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface BedRepository extends JpaRepository<Bed, Long> {
	List<Bed> findByStatus(String status);

//	 @Query("SELECT b FROM Bed b WHERE b.room.roomId = :roomId AND b.status = 'Available'")
//	 List<Bed> findAvailableBedsByRoom(@Param("roomId") Long roomId);

	@Query("SELECT b FROM Bed b WHERE b.room.id = :roomId")
	List<Bed> fetchRoomWithBeds(@Param("roomId") Long roomId);

	List<Bed> findByRoomId(Long roomId);

	@Query("SELECT b FROM Bed b WHERE b.id = :bedId AND b.room.id = :roomId")
	Optional<Bed> findByBedIdAndRoomId(@Param("bedId") Long bedId, @Param("roomId") Long roomId);

//	Optional<Room> findByNumberAndRoomId(Long bedNumber, Long roomId);
//
//
//
//	Optional<Room> findBybedIdAndRoomId(Long bedId, Long roomId);

}
