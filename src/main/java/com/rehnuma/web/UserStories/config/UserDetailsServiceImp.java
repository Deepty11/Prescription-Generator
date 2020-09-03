package com.rehnuma.web.UserStories.config;

import com.rehnuma.web.UserStories.model.User;
import com.rehnuma.web.UserStories.repostories.UserRepository;
import com.rehnuma.web.UserStories.services.UserInfoDetails;
import com.rehnuma.web.UserStories.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class UserDetailsServiceImp implements UserDetailsService {

    @Autowired
    private UserServices userServices;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userServices.findByEmail(email);
        System.out.println("loadUserByUsername :"+ user);
        if (user == null) {
            throw new UsernameNotFoundException("Username not found ");
        }
        return new UserInfoDetails(user);
    }
}
