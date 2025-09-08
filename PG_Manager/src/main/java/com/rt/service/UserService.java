package com.rt.service;

import com.rt.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

	Optional<User> authenticate(String email, String password);

	String getPrimaryRole(User user);

	boolean isAdminRegistered();

	void registerAdmin(User user);

	void saveUser(User user);

	void registerUserWithRole(User user, String roleName);

	List<User> findManagersAndStaff();

	

   
}
