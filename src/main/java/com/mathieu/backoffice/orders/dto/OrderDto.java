package com.mathieu.backoffice.orders.dto;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.mathieu.backoffice.orders.OrderEntity;
import com.mathieu.backoffice.orders.OrderStatus;

public record OrderDto(
  Long id,
  @JsonProperty("idCustomer") Long idCustomer,
  BigDecimal total,
  OrderStatus status
) {
  public static OrderDto of(OrderEntity o){
    return new OrderDto(o.getId(), o.getIdCustomer(), o.getTotal(), o.getStatus());
  }
}
