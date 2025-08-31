package com.mathieu.backoffice.orders;

import com.mathieu.backoffice.orders.dto.*;
import com.mathieu.backoffice.products.ProductRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api/orders")
public class OrdersController {

  private final OrderRepository orders;
  private final OrderItemRepository items;
  private final ProductRepository products;

  public OrdersController(OrderRepository orders, OrderItemRepository items, ProductRepository products) {
    this.orders = orders; this.items = items; this.products = products;
  }

  // Create
  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  @Transactional
  public OrderDto create(@RequestBody @Valid CreateOrderRequest req) {
    var o = new OrderEntity();
    o.setIdCustomer(req.idCustomer());
    o.setStatus(OrderStatus.Pending);

    // total
    BigDecimal total = req.items().stream()
      .map(it -> it.price().multiply(BigDecimal.valueOf(it.quantity())))
      .reduce(BigDecimal.ZERO, BigDecimal::add);
    o.setTotal(total);

    // persist order first (to get id)
    o = orders.save(o);

    // items
    for (var it : req.items()) {
      var p = products.findById(it.productId())
        .orElseThrow(() -> new NoSuchElementException("Product %d not found".formatted(it.productId())));
      var oi = new OrderItemEntity();
      oi.setOrder(o);
      oi.setProduct(p);
      oi.setQuantity(it.quantity());
      oi.setPrice(it.price()); // snapshot du prix
      items.save(oi);
    }
    return OrderDto.of(o);
  }

  // Read one
  @GetMapping("/{id}")
  public OrderDto get(@PathVariable long id) {
    var o = orders.findById(id).orElseThrow(() -> new NoSuchElementException("Order %d not found".formatted(id)));
    return OrderDto.of(o);
  }

  // List (simple)
  @GetMapping
  public List<OrderDto> list() {
    return orders.findAll().stream().map(OrderDto::of).toList();
  }

  // Items (DTO simple)
  @GetMapping("/{id}/items")
  public List<OrderItemDto> items(@PathVariable long id) {
    // ensure order exists
    orders.findById(id).orElseThrow(() -> new NoSuchElementException("Order %d not found".formatted(id)));
    return items.findByOrderId(id).stream().map(OrderItemDto::of).toList();
  }

  // Items + Product merged (pour ton interface OrderItemProduct)
  @GetMapping("/{id}/items-products")
  public List<OrderItemProductDto> itemsWithProduct(@PathVariable long id) {
    orders.findById(id).orElseThrow(() -> new NoSuchElementException("Order %d not found".formatted(id)));
    return items.findByOrderId(id).stream()
      .map(oi -> OrderItemProductDto.of(oi.getProduct(), oi.getQuantity(), oi.getPrice()))
      .toList();
  }

  // Update status
  @PatchMapping("/{id}/status")
  public OrderDto updateStatus(@PathVariable long id, @RequestBody @Valid UpdateOrderStatusRequest body) {
    var o = orders.findById(id).orElseThrow(() -> new NoSuchElementException("Order %d not found".formatted(id)));
    o.setStatus(body.status());
    return OrderDto.of(orders.save(o));
  }
}
