package com.mathieu.backoffice.orders.dto;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.mathieu.backoffice.orders.OrderItemEntity;

public record OrderItemDto(
  Long id,
  @JsonProperty("order_id") Long orderId,
  @JsonProperty("product_id") Long productId,
  Integer quantity,
  BigDecimal price
) {
  public static OrderItemDto of(OrderItemEntity it){
    return new OrderItemDto(it.getId(), it.getOrder().getId(), it.getProduct().getId(), it.getQuantity(), it.getPrice());
  }
}
