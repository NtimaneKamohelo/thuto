package com.kamohelontimane.Thuto.service;

import com.kamohelontimane.Thuto.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    User createUser(User user);
    Optional<User> getUserById(Long id);
    Optional<User> getUserByEmail(String email);
    List<User> getAllUsers();
    User updateUser(Long id, User updated);
    void deleteUser(Long id);
}
