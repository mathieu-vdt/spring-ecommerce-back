package com.mathieu.backoffice.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/api/hello")
    public Message hello(@RequestParam(defaultValue = "world") String name) {
        return new Message("Hello, " + name + "!");
    }

    record Message(String message) {

    }
}
