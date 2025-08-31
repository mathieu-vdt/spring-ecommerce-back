package com.mathieu.backoffice.users;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;

public record UserDto(
    Long id,
    String username,
    String role,
    String email,
    @JsonProperty("created_at") LocalDateTime createdAt,
    @JsonProperty("updated_at") LocalDateTime updatedAt
) {
    public static UserDto of(UserEntity u) {
        return new UserDto(u.getId(), u.getUsername(), u.getRole(), u.getEmail(), u.getCreatedAt(), u.getUpdatedAt());
    }
}
