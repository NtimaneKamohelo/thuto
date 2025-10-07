package com.kamohelontimane.Thuto.service;

import com.kamohelontimane.Thuto.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;
import java.util.Optional;

public interface UserService {
    User createUser(User user);
    Optional<User> getUserById(Long id);
    Optional<User> getUserByEmail(String email);
    List<User> getAllUsers();
    User updateUser(Long id, User updated);
    void deleteUser(Long id);

    void registerUser(User user);

    UserDetails loadUserByUsername(String name) throws UsernameNotFoundException;
}
