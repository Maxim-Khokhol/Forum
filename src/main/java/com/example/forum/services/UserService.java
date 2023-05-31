package com.example.forum.services;

import com.example.forum.util.UserExistsException;
import com.example.forum.models.User;
import com.example.forum.repositories.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.security.Principal;
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

    public User getUserByPrincipal(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByUsername(principal.getName());
    }


    public void createUser(User user) throws UserExistsException {

            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setAnimation(0);
            user.setTheme(0);
            user.setGender("unknown");
            if (userRepository.findByEmail(user.getEmail()) != null) {
                throw new UserExistsException("User with this email already exists");
            } else if(userRepository.findByUsername(user.getUsername()) != null) {
                throw new UserExistsException("User with this username already exists");
            }

            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
            String formattedDateTime = currentDateTime.format(formatter);
            user.setDateOfCreation(formattedDateTime);

            user.setRole("ROLE_USER");
            userRepository.save(user);

    }
}