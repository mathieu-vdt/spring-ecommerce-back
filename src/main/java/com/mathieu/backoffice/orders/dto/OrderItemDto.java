package com.mathieu.backoffice.orders.dto;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.mathieu.backoffice.orders.OrderItemEntity;

public record OrderItemDto(
  Long id,
  @JsonProperty("order_id") Long orderId,
  @JsonProperty("product_id") Long productId,
  String name,
  @JsonProperty("image_url") String imageUrl,
  Integer quantity,
  BigDecimal price
) {
  public static OrderItemDto of(OrderItemEntity it) {
    var p = it.getProduct();
    return new OrderItemDto(
      it.getId(),
      it.getOrder().getId(),
      p.getId(),
      p.getName(),
      p.getImageUrl(), 
      it.getQuantity(),
      it.getPrice()
    );
  }
}
