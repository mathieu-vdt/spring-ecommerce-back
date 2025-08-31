package com.mathieu.backoffice.orders;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderItemRepository extends JpaRepository<OrderItemEntity, Long> {

    @Query("""
    select oi
    from OrderItemEntity oi
      join fetch oi.product p
      left join fetch p.category
    where oi.order.id = :orderId
  """)
    List<OrderItemEntity> findByOrderId(@Param("orderId") Long orderId);
}
