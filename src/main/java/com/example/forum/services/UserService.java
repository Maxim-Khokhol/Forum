package com.example.forum.services;

import com.example.forum.models.User;
import com.example.forum.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
@Slf4j
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    @Autowired
    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }
    public User getUserById(Long id){
        return userRepository.findById(id);
    }
    public void saveUser(User user){
       userRepository.save(user);
    }
    @Transactional
    public void createUser(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setAnimation(0);
        user.setTheme(0);

        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String formattedDateTime = currentDateTime.format(formatter);
        user.setDateOfCreation(formattedDateTime);

        user.setRole("ROLE_USER");
        userRepository.save(user);
    }
}