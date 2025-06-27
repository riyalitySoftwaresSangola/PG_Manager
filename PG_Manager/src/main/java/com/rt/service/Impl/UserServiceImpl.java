package com.rt.service.Impl;

import com.rt.entity.Role;
import com.rt.entity.RoleType;
import com.rt.entity.User;
import com.rt.repository.RoleRepository;
import com.rt.repository.UserRepository;
import com.rt.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

	private final UserRepository userRepository;
	private final RoleRepository roleRepository;

	@Autowired
	public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository) {
	    this.userRepository = userRepository;
	    this.roleRepository = roleRepository;
	}

	@Override
	public boolean isAdminRegistered() {
	    return userRepository.existsAdmin(); 
	}

	@Override
	public void registerAdmin(User user) {
	    if (isAdminRegistered()) {
	        throw new IllegalStateException("Admin is already registered.");
	    }
	    System.out.println("hello");

	    Role adminRole = roleRepository.findByName(RoleType.ADMIN).orElse(null);
	    if (adminRole == null) {
	        adminRole = new Role();
	        adminRole.setName(RoleType.ADMIN);
	        roleRepository.save(adminRole);
	    }

	   
	    Set<Role> roles = new HashSet<>();
	    roles.add(adminRole);
	    user.setRoles(roles);

	    userRepository.save(user);
	}

    @Override
    public Optional<User> authenticate(String email, String password) {
        Optional<User> userOptional = userRepository.findByEmailWithRoles(email);
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            if (user.getPassword().equals(password)) {
                return Optional.of(user);
            }
        }
        return Optional.empty();
    }

     
    @Override
    public String getPrimaryRole(User user) {
        return user.getRoles()
                   .stream()
                   .map(role -> role.getName().name()) 
                   .findFirst()
                   .orElse("GUEST"); 
    }
    
    
    
}
