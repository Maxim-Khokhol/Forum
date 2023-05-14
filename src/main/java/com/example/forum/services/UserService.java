package com.example.forum.services;

import com.example.forum.models.User;
import com.example.forum.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public User getUserById(int id){
        return userRepository.findById(id).orElse(null);
    }
    public void saveUser(User user){
       userRepository.save(user);
    }
    @Transactional
    public void createUser(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setAnimation(0);
        user.setTheme(0);
        user.setRole("ROLE_USER");
        userRepository.save(user);
    }
}