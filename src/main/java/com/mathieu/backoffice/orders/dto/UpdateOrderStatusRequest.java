package com.mathieu.backoffice.orders.dto;
import com.mathieu.backoffice.orders.OrderStatus;

import jakarta.validation.constraints.NotNull;

public record UpdateOrderStatusRequest(@NotNull OrderStatus status) {}
