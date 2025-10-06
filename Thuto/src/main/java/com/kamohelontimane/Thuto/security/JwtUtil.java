package com.kamohelontimane.Thuto.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.security.Key;

@Component
public class JwtUtil {

    //Inject values from application.properties
    @Value("${jwt.secret}")
    private Key key;

    @Value("${jwt.expiration-ms=3600000}")
    private long expirationMS;

    //Build the signing key once the base64 secret
    private Key getSigningKey(){
        byte[] keyBytes = Decoders.BASE64.decode(base64Secret);
        return Keys.hmacShaKeyFor(keyBytes);
    }

    public String generateTokens(String email) {

    }

}
