package com.rt.controller;

import java.util.Optional;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.rt.entity.User;
import com.rt.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RegisterController {

    private final UserService userService;

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        if (userService.isAdminRegistered()) {
        	
        	 model.addAttribute("user","Admin already present");
            return "redirect:/login";
        }
        model.addAttribute("user", new User());
        return "AuthPages/AuthRegister"; 
    }

    @PostMapping("/register")
    public String handleAdminRegister(@ModelAttribute User user) {
        if (!userService.isAdminRegistered()) {
            userService.registerAdmin(user);
        }
        return "redirect:/login";
    }

  
}
