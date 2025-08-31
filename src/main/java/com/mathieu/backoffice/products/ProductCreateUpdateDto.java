package com.mathieu.backoffice.products;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record ProductCreateUpdateDto(
  @NotBlank String name,
  String description,
  @NotNull @DecimalMin("0.0") BigDecimal price,
  @NotNull @Min(0) Integer stock,
  @NotNull @JsonProperty("idCategory") Long idCategory,
  @JsonProperty("image_url") String imageUrl
) {}
