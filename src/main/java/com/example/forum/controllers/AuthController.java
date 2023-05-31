package com.example.forum.controllers;

import com.example.forum.util.UserExistsException;
import com.example.forum.models.User;
import com.example.forum.services.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @GetMapping("/registration")
    public String registrationPage(@ModelAttribute("user") User user){
        return "registration";
    }

    @PostMapping("/registration")
    public String performRegistration(@ModelAttribute("user") @Valid User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        try {
            userService.createUser(user);
            return "redirect:/login";
        } catch (UserExistsException e) {
            if (e.getMessage().equals("User with this email already exists")) {
                user.setEmailErrorMessage("User with this email already exists");
            } else if (e.getMessage().equals("User with this username already exists")) {
                user.setUsernameErrorMessage("User with this username already exists");
            }
            model.addAttribute("user", user);
            return "registration";
        }
    }

}