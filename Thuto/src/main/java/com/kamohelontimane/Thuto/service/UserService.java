package com.kamohelontimane.Thuto.service;

import com.kamohelontimane.Thuto.entity.User;
import com.kamohelontimane.Thuto.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final EmailService emailService;

    public UserService(UserRepository userRepository, EmailService emailService){
        this.userRepository = userRepository;
        this.emailService = emailService;
    }

    public List<User> allUsers(){
        List<User> users = new ArrayList<>();
        users.addAll(userRepository.findAll());
        return users;
    }
}
