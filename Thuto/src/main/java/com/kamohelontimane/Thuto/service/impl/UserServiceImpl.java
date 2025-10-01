package com.kamohelontimane.Thuto.service.impl;

import com.kamohelontimane.Thuto.entity.User;
import com.kamohelontimane.Thuto.exception.ResourceNotFoundException;
import com.kamohelontimane.Thuto.repository.UserRepository;
import com.kamohelontimane.Thuto.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;
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
    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    @Override
    public User updateUser(Long id, User updated) {
        return userRepository.findById(id).map(existing -> {
            existing.setName(updated.getName());
            existing.setBio(updated.getBio());
            existing.setRole(updated.getRole());
            return userRepository.save(existing);
        }).orElseThrow(() -> new ResourceNotFoundException("User not found with id " + id));
    }

    @Override
    public void deleteUser(Long id){
        if (!userRepository.existsById(id)) {
            throw new ResourceNotFoundException("User not fount with id " + id);
        }
        userRepository.deleteById(id);
    }


}
