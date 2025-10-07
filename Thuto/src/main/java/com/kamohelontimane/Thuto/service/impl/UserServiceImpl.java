package com.kamohelontimane.Thuto.service.impl;

import com.kamohelontimane.Thuto.entity.User;
import com.kamohelontimane.Thuto.exception.ResourceNotFoundException;
import com.kamohelontimane.Thuto.repository.UserRepository;
import com.kamohelontimane.Thuto.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository repo, PasswordEncoder encoder) {

        this.userRepository = repo;
        this.passwordEncoder = encoder;
    }

    @Override
    public User createUser(User user){
        // Hash password before saving
        String rawPassword = user.getPasswordHash();
        user.setPasswordHash(passwordEncoder.encode(rawPassword));
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

            //if password provided, rehash it
            if (updated.getPasswordHash() != null && !updated.getPasswordHash().isBlank()){
                existing.setPasswordHash(passwordEncoder.encode(updated.getPasswordHash()));
            }

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

    @Override
    public void registerUser(User user){
        user.setPasswordHash(passwordEncoder.encode(user.getPasswordHash()));
        userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException{
        return (UserDetails) userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with email: " + email));
    }

}
