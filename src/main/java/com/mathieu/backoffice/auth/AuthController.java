package com.mathieu.backoffice.auth;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
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
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    @PostMapping("/signup")
    public ResponseEntity<UserDto> signUp(@RequestBody SignUpRequest request) {
        UserEntity user = userService.signUp(request.username(), request.email(), request.password(), "CUSTOMER");
        return ResponseEntity.ok(UserDto.of(user));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        UsernamePasswordAuthenticationToken token
                = new UsernamePasswordAuthenticationToken(req.username(), req.password());

        Authentication auth = authenticationManager.authenticate(token); // will throw BadCredentialsException if bad

        var principal = auth.getPrincipal();
        // récupère username & authorities
        String username = auth.getName();
        String authority = auth.getAuthorities().stream().findFirst().map(Object::toString).orElse("");

        String jwt = jwtUtil.generateToken(username, authority);
        return ResponseEntity.ok(Map.of("token", jwt));
    }
}

record SignUpRequest(String username, String email, String password) {

}

record AuthRequest(String username, String password) {

}
