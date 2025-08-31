package com.mathieu.backoffice.orders.dto;

import java.math.BigDecimal;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public record CreateOrderRequest(
  @NotNull @JsonProperty("idCustomer") Long idCustomer,
  @NotEmpty List<Item> items
) {
  public record Item(
    @NotNull @JsonProperty("product_id") Long productId,
    @NotNull @Min(1) Integer quantity,
    @NotNull @DecimalMin("0.0") BigDecimal price   // prix unitaire saisi côté front (ou laissé égal au product.price)
  ) {}
}
