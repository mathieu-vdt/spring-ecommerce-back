package com.mathieu.backoffice.users;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter @Setter
public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String password; // ⚠️ stocker en hash (BCrypt), pas en clair !

    @Column(nullable = false)
    private String role; // "admin" | "customer"

    @Column(nullable = false, unique = true)
    private String email;

    @Column(name = "created_at", nullable = false, columnDefinition = "TEXT")
    @org.hibernate.annotations.CreationTimestamp
    private LocalDateTime createdAt;

    @Column(name = "updated_at", columnDefinition = "TEXT")
    @org.hibernate.annotations.UpdateTimestamp
    private LocalDateTime updatedAt;
}
