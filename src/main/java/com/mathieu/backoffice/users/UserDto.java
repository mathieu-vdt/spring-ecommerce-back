package com.mathieu.backoffice.users;

import java.time.OffsetDateTime;

public record UserDto(
    Long id,
    String username,
    String role,
    String email,
    OffsetDateTime createdAt,
    OffsetDateTime updatedAt
) {
    public static UserDto of(UserEntity u) {
        return new UserDto(u.getId(), u.getUsername(), u.getRole(), u.getEmail(), u.getCreatedAt(), u.getUpdatedAt());
    }
}
