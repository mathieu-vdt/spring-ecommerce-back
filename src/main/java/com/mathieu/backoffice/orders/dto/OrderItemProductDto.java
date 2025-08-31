package com.mathieu.backoffice.orders.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.mathieu.backoffice.products.Product;

public record OrderItemProductDto(
  Long id,
  String name,
  String description,
  BigDecimal price,           // prix unitaire de la ligne (même nom que Product.price côté Angular)
  Integer stock,
  @JsonProperty("idCategory") Long idCategory,
  @JsonProperty("image_url") String imageUrl,
  @JsonProperty("created_at") LocalDateTime createdAt,
  @JsonProperty("updated_at") LocalDateTime updatedAt,
  Integer quantity
) {
  public static OrderItemProductDto of(Product p, Integer quantity, BigDecimal unitPrice){
    return new OrderItemProductDto(
      p.getId(), p.getName(), p.getDescription(),
      unitPrice, // on renvoie le prix de l'item (figé au moment de la commande)
      p.getStock(),
      p.getCategory()!=null ? p.getCategory().getId() : null,
      p.getImageUrl(), p.getCreatedAt(), p.getUpdatedAt(),
      quantity
    );
  }
}
