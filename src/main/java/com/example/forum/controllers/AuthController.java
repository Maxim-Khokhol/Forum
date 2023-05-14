package com.example.forum.controllers;

import com.example.forum.models.User;

import com.example.forum.services.UserService;
import com.example.forum.util.UserValidator;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {
    private final UserService userService;
    private final UserValidator userValidator;

    public AuthController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

        @GetMapping("/registration")
        public String registrationPage(@ModelAttribute("user") User user){
            return "registration";
        }

        @PostMapping("/registration")
        public String performRegistration(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {
                userValidator.validate(user, bindingResult);

                if(bindingResult.hasErrors()) return "registration";
                userService.createUser(user);
                return "redirect:/login";

        }





}
