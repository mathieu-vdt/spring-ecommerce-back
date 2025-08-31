package com.mathieu.backoffice.orders;

import java.math.BigDecimal;

import com.mathieu.backoffice.products.Product;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity @Table(name="order_items")
public class OrderItemEntity {
  @Id @GeneratedValue(strategy = GenerationType.IDENTITY) private Long id;

  @ManyToOne(optional=false, fetch=FetchType.LAZY) @JoinColumn(name="order_id")
  private OrderEntity order;

  @ManyToOne(optional=false, fetch=FetchType.LAZY) @JoinColumn(name="product_id")
  private Product product;

  @Column(nullable=false) private Integer quantity;
  @Column(nullable=false, precision=14, scale=2) private BigDecimal price; // prix unitaire au moment de la commande

  // getters/setters
  public Long getId(){ return id; } public void setId(Long id){ this.id=id; }
  public OrderEntity getOrder(){ return order; } public void setOrder(OrderEntity o){ this.order=o; }
  public Product getProduct(){ return product; } public void setProduct(Product p){ this.product=p; }
  public Integer getQuantity(){ return quantity; } public void setQuantity(Integer q){ this.quantity=q; }
  public BigDecimal getPrice(){ return price; } public void setPrice(BigDecimal p){ this.price=p; }
}
