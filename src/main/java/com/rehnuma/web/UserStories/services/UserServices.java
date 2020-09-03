package com.rehnuma.web.UserStories.services;

import com.rehnuma.web.UserStories.model.User;
import com.rehnuma.web.UserStories.repostories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServices {
    @Autowired
    private UserRepository userRepository;

    public User checkUser(String email,String password){
        User user=userRepository.findByEmailAndPassword(email,password);
        return user;

    }
    public User findByEmail(String email){
        System.out.println("inside findByEmail: " + email);
        User user=userRepository.findByEmail(email);
        System.out.println("User: " + user);
        return user;
    }
}
