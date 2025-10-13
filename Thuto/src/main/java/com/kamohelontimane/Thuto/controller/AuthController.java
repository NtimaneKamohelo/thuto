package com.kamohelontimane.Thuto.controller;


import com.kamohelontimane.Thuto.dto.LoginUserDto;
import com.kamohelontimane.Thuto.dto.RegisterUserDto;
import com.kamohelontimane.Thuto.dto.VerifyUserDto;
import com.kamohelontimane.Thuto.entity.User;
import com.kamohelontimane.Thuto.responses.LoginResponse;
import com.kamohelontimane.Thuto.security.JwtUtil;
import com.kamohelontimane.Thuto.service.UserService;
import com.kamohelontimane.Thuto.service.impl.AuthenticationService;
import com.kamohelontimane.Thuto.service.impl.JwtService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final JwtService jwtService;
    private final AuthenticationService authenticationService;

    public AuthController(JwtService jwtService, AuthenticationService authenticationService){
        this.jwtService = jwtService;
        this.authenticationService = authenticationService;
    }

    @PostMapping("/signup")
    public ResponseEntity<User> register(@RequestBody RegisterUserDto registerUserDto) {
        User registerdUser = authenticationService.signUp(registerUserDto);
        return ResponseEntity.ok(registerdUser);
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> authenticateLoginRequest(@RequestBody LoginUserDto loginUserDto){
        User authenticatedUser = authenticationService.authenticate(loginUserDto);
        String jwtToken = jwtService.generateToken(authenticatedUser);
        LoginResponse loginResponse = new LoginResponse(jwtToken, jwtService.getExpirationTime());
        return ResponseEntity.ok(loginResponse);
    }

    @PostMapping("/verify")
    public ResponseEntity<?> verifyUser(@RequestBody VerifyUserDto verifyUserDto){
        try{
            authenticationService.verifyUser(verifyUserDto);
            return ResponseEntity.ok("Account verified successfully");
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("/resend")
    public ResponseEntity<?> resendVerificationCode(@RequestParam String email) {
        try {
            authenticationService.resendVerificationCode(email);
            return ResponseEntity.ok("Verification code sent");
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


}
