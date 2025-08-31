package com.mathieu.backoffice.orders;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity @Table(name="orders")
public class OrderEntity {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY) private Long id;

  @Column(name="customer_id", nullable=false) private Long idCustomer;

  @Column(nullable=false, precision=14, scale=2) private BigDecimal total;

  @Enumerated(EnumType.STRING) @Column(nullable=false) private OrderStatus status = OrderStatus.Pending;

  @Column(name="created_at", columnDefinition="TEXT") private LocalDateTime createdAt;
  @Column(name="updated_at", columnDefinition="TEXT") private LocalDateTime updatedAt;

  @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
  private List<OrderItemEntity> items = new ArrayList<>();

  @PrePersist void prePersist(){ var now = LocalDateTime.now(); createdAt = now; updatedAt = now; }
  @PreUpdate  void preUpdate(){ updatedAt = LocalDateTime.now(); }

  // getters/setters
  public Long getId(){ return id; } public void setId(Long id){ this.id=id; }
  public Long getIdCustomer(){ return idCustomer; } public void setIdCustomer(Long v){ this.idCustomer=v; }
  public BigDecimal getTotal(){ return total; } public void setTotal(BigDecimal v){ this.total=v; }
  public OrderStatus getStatus(){ return status; } public void setStatus(OrderStatus s){ this.status=s; }
  public LocalDateTime getCreatedAt(){ return createdAt; } public LocalDateTime getUpdatedAt(){ return updatedAt; }
  public List<OrderItemEntity> getItems(){ return items; } public void setItems(List<OrderItemEntity> it){ this.items=it; }
}
