package com.example.forum.controllers;

import com.example.forum.models.User;
import com.example.forum.services.ProblemService;
import com.example.forum.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final ProblemService problemService;


    @GetMapping("/userpage/{id}")
    public String profilePage(@PathVariable Long id, Model model, Principal principal) {
        User currentUser = userService.getUserByPrincipal(principal);
        User userProfile = userService.getUserById(id);

        model.addAttribute("user", currentUser);
        model.addAttribute("userProfile", userProfile);
        model.addAttribute("userProblem", problemService.getProblemByPrincipal(principal));
        return "profile";
    }
    @GetMapping("/admin")
    public String adminPage(){
        return "admin.ftlh";
    }

    @PostMapping("/userpage/{id}/changeInfo")
    public String changeInfo(@PathVariable Long id, String username, String gender,
                             RedirectAttributes redirectAttributes){
        User userProfile = userService.getUserById(id);
        String tempUsername = userProfile.getUsername();
        userProfile.setUsername(username);
        userProfile.setGender(gender);
        userService.saveUser(userProfile);
        if(!tempUsername.equals(userProfile.getUsername())) return "login.html";
        redirectAttributes.addAttribute("id", userProfile.getId());
        return "redirect:/userpage/{id}";
    }
    @PostMapping("/userpage/{id}/deleteAvatar")
    public String deleteAvatar(@PathVariable Long id, String avatar, RedirectAttributes redirectAttributes){
        User userProfile = userService.getUserById(id);
        userProfile.setAvatar(avatar);
        userService.saveUser(userProfile);
        redirectAttributes.addAttribute("id", userProfile.getId());
        return "redirect:/userpage/{id}";
    }

    @PostMapping("/userpage/{id}/edit")
    public String profilePageEdit(@PathVariable Long id, @RequestParam("fileImage") MultipartFile multipartFile,
                                  RedirectAttributes redirectAttributes, Model model) throws IOException {
        User userProfile = userService.getUserById(id);
        model.addAttribute("userProfile", userProfile);
        String fileName = StringUtils.cleanPath(Objects.requireNonNull(multipartFile.getOriginalFilename()));
        userProfile.setAvatar(fileName);
        userService.saveUser(userProfile);
        String uploadDir = "./user-avatar/" + userProfile.getId();
        Path uploadPath = Paths.get(uploadDir);
        if(!Files.exists(uploadPath)){
            Files.createDirectories(uploadPath);
        }
        try {
            InputStream inputStream = multipartFile.getInputStream();
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e){
            throw new IOException("Couldn't save uploaded file: " + fileName);
        }
        redirectAttributes.addAttribute("id", userProfile.getId());
        return "redirect:/userpage/{id}";
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
    @GetMapping("/about-us")
    public String getAboutUsPage(Principal principal, Model model){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "about-us";
    }
}