package com.rt.repository;

import com.rt.entity.Bed;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BedRepository extends JpaRepository<Bed, Long> {
	 List<Bed> findByStatus(String status); 
}
