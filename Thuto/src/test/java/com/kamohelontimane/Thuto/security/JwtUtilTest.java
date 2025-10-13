package com.kamohelontimane.Thuto.security;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.*;

public class JwtUtilTest {

    private JwtUtil jwtUtils;

    @BeforeEach
    void setUp() {
        jwtUtils = new JwtUtil();

        // Inject mock values for testing
        ReflectionTestUtils.setField(jwtUtils, "base64Secret", "XtVp31GjN4m91S59zrI9o9u5IqTufW9fhnouSzsEM4/Mf8EQ4U/BmktPp8w+I1Yz");
        ReflectionTestUtils.setField(jwtUtils, "expirationMS", 3600000L); // 1 hour
    }

    @Test
    void testGenerateAndValidateToken() {
        // Generate token
        String token = jwtUtils.generateTokens("testUser");
        assertNotNull(token, "Token should not be null");

        // Validate token
        boolean isValid = jwtUtils.validateToken(token);
        assertTrue(isValid, "Token should be valid");
    }

    @Test
    void testExtractEmail() {
        String token = jwtUtils.generateTokens("testUser");
        String username = jwtUtils.extractEmail(token);

        assertEquals("testUser", username, "Extracted email should match");
    }

    @Test
    void testInvalidToken() {
        // Create an intentionally invalid token
        String invalidToken = "invalid.token.string";
        boolean result = jwtUtils.validateToken(invalidToken);

        assertFalse(result, "Invalid token should return false");
    }

    @Test
    void testExpiredToken() throws InterruptedException {
        // Temporarily use a short expiry
        ReflectionTestUtils.setField(jwtUtils, "expirationMS", 1L); // 1 millisecond
        String token = jwtUtils.generateTokens("expiredUser");

        // Wait a bit to let it expire
        Thread.sleep(10);

        boolean result = jwtUtils.validateToken(token);
        assertFalse(result, "Expired token should return false");
    }
}
