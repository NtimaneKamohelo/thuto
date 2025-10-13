package com.kamohelontimane.Thuto.controller;

import com.kamohelontimane.Thuto.entity.User;
import com.kamohelontimane.Thuto.service.UserService;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.security.Security;
import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService){
        this.userService = userService;
    }


    @GetMapping("/me")
    public ResponseEntity<User> authenticatedUser(){
        Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        return ResponseEntity.ok(currentUser);
    }

    @GetMapping
    public ResponseEntity<List<User>> getAll(){
        List<User> users = userService.allUsers();
        return ResponseEntity.ok(users);
    }


}
