package com.example.forum.controllers;

import com.example.forum.models.User;
import com.example.forum.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class SettingController {
    private final UserService userService;


    @PostMapping("/mainpage/{id}/theme")
    public String setUserTheme(@PathVariable Long id, @RequestParam int theme, Model model) {
        model.addAttribute("user", userService.getUserById(id));
        User user = userService.getUserById(id);
        user.setTheme(theme);
        userService.saveUser(user);
        return "redirect:/mainpage";
    }


    @PostMapping("/mainpage/{id}/animation")
    public String setUserAnimation(@PathVariable Long id, @RequestParam int animation, Model model) {
        model.addAttribute("user", userService.getUserById(id));
        User user = userService.getUserById(id);
        user.setAnimation(animation);
        userService.saveUser(user);
        return "redirect:/mainpage";
    }

}
