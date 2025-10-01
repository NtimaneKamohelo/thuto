package com.kamohelontimane.Thuto.service.impl;

import com.kamohelontimane.Thuto.entity.User;
import com.kamohelontimane.Thuto.repository.UserRepository;
import com.kamohelontimane.Thuto.service.UserService;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository repo) {
        this.userRepository = repo;
    }

    @Override
    public User createUser(User user){
        return userRepository.save(user);
    }

    @Override
    public Optional<User> getUserById(Long id){
        return userRepository.findById(id);
    }

    @Override
    public Optional<User> getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override


}
