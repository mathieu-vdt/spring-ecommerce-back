package com.mathieu.backoffice.customers;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerRepository customers;

    @GetMapping
    public List<CustomerDto> all() {
        return customers.findAll().stream().map(CustomerDto::of).toList();
    }

    @GetMapping("/{id}")
    public CustomerDto one(@PathVariable Long id) {
        return customers.findById(id).map(CustomerDto::of).orElseThrow();
    }
}
