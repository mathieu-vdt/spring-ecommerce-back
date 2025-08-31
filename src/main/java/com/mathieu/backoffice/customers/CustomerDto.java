package com.mathieu.backoffice.customers;

import java.time.OffsetDateTime;

public record CustomerDto(
    Long id,
    Long userId,
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String shippingAddress,
    String billingAddress,
    OffsetDateTime createdAt,
    OffsetDateTime updatedAt
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
