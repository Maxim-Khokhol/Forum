package com.example.forum.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "users")
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @NotEmpty(message = "Email is empty")
    @Pattern(regexp = ".*@.*", message = "Wrong email")
    @Column(name = "email", unique = true)
    private String email;
    @Column(name = "active")
    private boolean active;
    @NotEmpty(message = "Username is empty")
    @Size(min = 2, max = 100, message = "Username have to contain from 2 to 100 Symbols")
    @Column(name = "username" ,unique = true)
    private String username;
    @NotEmpty(message = "Password is empty")
    @Size(min = 8, max = 100, message = "Password have to contain from 8 to 100 Symbols")
    @Column(name = "password")
    private String password;
    @Column(name = "role")
    private String role;
    @Column(name = "theme")
    private int theme;

    @Column(name = "animation")
    private int animation;

    @Column(name = "dateOfCreation")
    private String dateOfCreation;



    public User(String email, String username) {
        this.email = email;
        this.username = username;
    }

    public User() {

    }

    public String getDateOfCreation() {
        return dateOfCreation;
    }

    public void setDateOfCreation(String dateOfCreation) {
        this.dateOfCreation = dateOfCreation;
    }

    public int getTheme() {
        return theme;
    }

    public void setTheme(int theme) {
        this.theme = theme;
    }

    public int getAnimation() {
        return animation;
    }

    public void setAnimation(int animation) {
        this.animation = animation;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}