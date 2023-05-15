package com.example.forum.repositories;

import com.example.forum.models.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);
    User findById(Long id);
}
