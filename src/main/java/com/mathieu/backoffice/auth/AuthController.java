package com.mathieu.backoffice.auth;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mathieu.backoffice.users.UserDto;
import com.mathieu.backoffice.users.UserEntity;
import com.mathieu.backoffice.users.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;

    @PostMapping("/signup")
    public ResponseEntity<UserDto> signUp(@RequestBody SignUpRequest request) {
        UserEntity user = userService.signUp(request.username(), request.email(), request.password(), "CUSTOMER");
        return ResponseEntity.ok(UserDto.of(user));
    }

    @PostMapping("/login")
    public ResponseEntity<String> login() {
        // Spring Security gère déjà le login via HTTP Basic
        return ResponseEntity.ok("Login successful");
    }
}

record SignUpRequest(String username, String email, String password) {}
