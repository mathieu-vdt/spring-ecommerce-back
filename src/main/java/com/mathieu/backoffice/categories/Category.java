package com.mathieu.backoffice.categories;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity @Table(name = "categories")
public class Category {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false, unique = true)
  private String name;

  @Column(name = "created_at", nullable = false, columnDefinition = "TEXT")
  private LocalDateTime createdAt;

  @Column(name = "updated_at", columnDefinition = "TEXT")
  private LocalDateTime updatedAt;

  @PrePersist
  public void prePersist() {
    var now = LocalDateTime.now();
    createdAt = now;
    updatedAt = now;
  }

  @PreUpdate
  public void preUpdate() {
    updatedAt = LocalDateTime.now();
  }

  // getters/setters
  public Long getId() { return id; } public void setId(Long id){ this.id=id; }
  public String getName(){ return name; } public void setName(String n){ this.name=n; }
  public LocalDateTime getCreatedAt(){ return createdAt; } public void setCreatedAt(LocalDateTime v){ this.createdAt=v; }
  public LocalDateTime getUpdatedAt(){ return updatedAt; } public void setUpdatedAt(LocalDateTime v){ this.updatedAt=v; }
}
