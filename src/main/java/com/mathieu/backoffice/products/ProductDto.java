package com.mathieu.backoffice.products;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;

public record ProductDto(
    Long id,
    String name,
    String description,
    BigDecimal price,
    Integer stock,
    @JsonProperty("idCategory") Long idCategory,
    @JsonProperty("image_url") String imageUrl,
    @JsonProperty("created_at") LocalDateTime createdAt,
    @JsonProperty("updated_at") LocalDateTime updatedAt
) {
  public static ProductDto of(Product p) {
    return new ProductDto(
        p.getId(), p.getName(), p.getDescription(), p.getPrice(), p.getStock(),
        p.getCategory()!=null ? p.getCategory().getId() : null,
        p.getImageUrl(), p.getCreatedAt(), p.getUpdatedAt()
    );
  }
}
