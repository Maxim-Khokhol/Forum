package com.example.forum.util;

public class UserExistsException extends RuntimeException {
    public UserExistsException(String message) {
        super(message);
    }
}