package com.rt.controller;

import java.util.Optional;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.rt.entity.User;
import com.rt.service.UserService;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String rootRedirect() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "AuthPages/AuthLogin"; 
    }
  

    @PostMapping("/login")
    public String login(@RequestParam("exampleEmail") String email,
                        @RequestParam("examplePassword") String password,
                        HttpSession session) {

        Optional<User> userOptional = userService.authenticate(email, password);

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            String role = userService.getPrimaryRole(user);

            session.setAttribute("loggedInUser", user);
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", role);

            return "redirect:/dashboard"; 
        } else {
            return "redirect:/login?error=true";
        }
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        return "index"; 
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout=true";
    }
}
