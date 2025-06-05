package com.rt.repository;

import com.rt.entity.User;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    @Query("SELECT u FROM User u JOIN FETCH u.roles WHERE u.email = :email")
    Optional<User> findByEmailWithRoles(@Param("email") String email);

    Optional<User> findByEmail(String email);
    
   
    @Query("SELECT COUNT(u) > 0 FROM User u JOIN u.roles r WHERE r.name = 'ADMIN'")
    boolean existsAdmin();
}
