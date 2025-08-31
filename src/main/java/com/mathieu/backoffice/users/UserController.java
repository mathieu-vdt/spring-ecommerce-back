package com.mathieu.backoffice.users;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserRepository users;

    @GetMapping
    public List<UserDto> all() {
        return users.findAll().stream().map(UserDto::of).toList();
    }

    @GetMapping("/{id}")
    public UserDto one(@PathVariable Long id) {
        return users.findById(id).map(UserDto::of).orElseThrow();
    }
}
