package com.mathieu.backoffice.categories;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;

public record CategoryDto(
    Long id,
    String name,
    @JsonProperty("created_at") LocalDateTime createdAt,
    @JsonProperty("updated_at") LocalDateTime updatedAt
) {
  public static CategoryDto of(Category c) {
    return new CategoryDto(c.getId(), c.getName(), c.getCreatedAt(), c.getUpdatedAt());
  }
}
