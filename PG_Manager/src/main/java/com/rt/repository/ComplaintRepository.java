package com.rt.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.rt.entity.Complaint;

public interface ComplaintRepository extends JpaRepository<Complaint, Long> {}
