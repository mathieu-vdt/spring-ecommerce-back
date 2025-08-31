package com.mathieu.backoffice.products;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductRepository extends JpaRepository<Product, Long> {
  @Query("""
    select p from Product p
    where (:q is null or lower(p.name) like lower(concat('%',:q,'%'))
                    or lower(p.description) like lower(concat('%',:q,'%')))
      and (:catId is null or p.category.id = :catId)
  """)
  Page<Product> search(@Param("q") String q, @Param("catId") Long catId, Pageable pageable);
}
