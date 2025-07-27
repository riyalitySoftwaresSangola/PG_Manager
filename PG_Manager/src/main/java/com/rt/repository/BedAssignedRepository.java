package com.rt.repository;

import com.rt.entity.BedAssigned;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BedAssignedRepository extends JpaRepository<BedAssigned, Long> {

    @Query("SELECT b FROM BedAssigned b WHERE b.tenant.id = :tenantId AND b.status = :status")
    List<BedAssigned> findByTenant_IdAndStatus(@Param("tenantId") Long tenantId, @Param("status") String status);

    @Query("SELECT b FROM BedAssigned b WHERE b.bed.bedId = :bedId AND b.status = :status")
    List<BedAssigned> findByBed_BedIdAndStatus(@Param("bedId") Long bedId, @Param("status") String status);
}

