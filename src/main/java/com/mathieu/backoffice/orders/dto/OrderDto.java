package com.mathieu.backoffice.orders.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.mathieu.backoffice.orders.OrderEntity;
import com.mathieu.backoffice.orders.OrderStatus;

public record OrderDto(
  Long id,
  @JsonProperty("idCustomer") Long idCustomer,
  BigDecimal total,
  OrderStatus status,
  @JsonProperty("created_at") LocalDateTime  createdAt,
  @JsonProperty("updated_at") LocalDateTime  updatedAt
) {
  public static OrderDto of(OrderEntity o){
    return new OrderDto(o.getId(), o.getIdCustomer(), o.getTotal(), o.getStatus(), o.getCreatedAt(), o.getUpdatedAt());
  }
}

