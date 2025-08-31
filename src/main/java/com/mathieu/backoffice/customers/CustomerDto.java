package com.mathieu.backoffice.customers;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonProperty;

public record CustomerDto(
        Long id,
        @JsonProperty("user_id") Long userId,
        @JsonProperty("first_name") String firstName,
        @JsonProperty("last_name") String lastName,
        String email,
        @JsonProperty("phone_number") String phoneNumber,
        @JsonProperty("shipping_address") String shippingAddress,
        @JsonProperty("billing_address") String billingAddress,
        @JsonProperty("created_at") LocalDateTime createdAt,
        @JsonProperty("updated_at") LocalDateTime updatedAt
        ) {

    public static CustomerDto of(CustomerEntity c) {
        return new CustomerDto(
                c.getId(),
                c.getUser().getId(),
                c.getFirstName(),
                c.getLastName(),
                c.getEmail(),
                c.getPhoneNumber(),
                c.getShippingAddress(),
                c.getBillingAddress(),
                c.getCreatedAt(),
                c.getUpdatedAt()
        );
    }
}
