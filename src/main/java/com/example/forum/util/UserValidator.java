package com.example.forum.util;

import com.example.forum.models.User;
import com.example.forum.services.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    private final UserDetailsServiceImpl userDetailsServiceImpl;
    @Autowired
    public UserValidator(UserDetailsServiceImpl userDetailsServiceImpl) {
        this.userDetailsServiceImpl = userDetailsServiceImpl;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User)target;
        try {
            userDetailsServiceImpl.loadUserByUsername(user.getEmail());
        } catch (UsernameNotFoundException ignored){
            return;
        }
        errors.rejectValue("email", "User with this email already exist");
    }
}
