package com.example.forum.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String usernameErrorMessage;
    private String emailErrorMessage;

    @NotEmpty(message = "Email is empty")
    @Pattern(regexp = ".*@.*", message = "Wrong email")
    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "gender")
    public String gender;

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

    @Column(name = "countOfQuestions")
    private int countOfQuestions;

    @Transient
    public String getAvatarImagePath(){
        if(avatar == null || id == null) return null;
        return  "/user-avatar/" + id + "/" + avatar;
    }
    public void incrementCountOfQuestions(){
        countOfQuestions++;
    }
    public void reduceCountOfQuestions(){
        countOfQuestions--;
    }


}