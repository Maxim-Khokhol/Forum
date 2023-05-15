package com.example.forum.controllers;

import com.example.forum.services.ProblemService;
import com.example.forum.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final ProblemService problemService;

    @GetMapping("/userpage/{id}")
    public String profilePage(@PathVariable Long id, Model model, String headline, Principal principal){
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("problems", problemService.listProblem(headline));
        model.addAttribute("userProblem", problemService.getProblemByPrincipal(principal));
        return "profile";
    }
    @GetMapping("/updateSettings")
    public String updateSetGet(Model model, Long id){
        model.addAttribute("user", userService.getUserById(id));
        return "settings";
    }
    @GetMapping("/profile")
    public String getProfileByGear(Model model, Long id){
        model.addAttribute("user", userService.getUserById(id));
        return "header";
    }
}
