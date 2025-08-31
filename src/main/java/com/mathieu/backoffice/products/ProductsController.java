package com.mathieu.backoffice.products;

import java.util.NoSuchElementException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.mathieu.backoffice.categories.CategoryRepository;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/products")
public class ProductsController {

    private final ProductRepository products;
    private final CategoryRepository categories;

    public ProductsController(ProductRepository products, CategoryRepository categories) {
        this.products = products;
        this.categories = categories;
    }

    @GetMapping
    public Page<ProductDto> list(
            @RequestParam(required = false) String search,
            @RequestParam(required = false, name = "idCategory") Long idCategory,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(defaultValue = "name,asc") String sort
    ) {
        var order = sort.split(",");
        var s = order.length > 1 && "desc".equalsIgnoreCase(order[1]) ? Sort.by(order[0]).descending() : Sort.by(order[0]).ascending();
        var pr = PageRequest.of(page, size, s);
        return products.search(search, idCategory, pr).map(ProductDto::of);
    }

    @GetMapping("/{id}")
    public ProductDto get(@PathVariable long id) {
        return products.findById(id).map(ProductDto::of)
                .orElseThrow(() -> new NoSuchElementException("Product %d not found".formatted(id)));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ProductDto create(@RequestBody @Valid ProductCreateUpdateDto body) {
        var cat = categories.findById(body.idCategory())
                .orElseThrow(() -> new NoSuchElementException("Category %d not found".formatted(body.idCategory())));
        var p = new Product();
        p.setName(body.name());
        p.setDescription(body.description());
        p.setPrice(body.price());
        p.setStock(body.stock());
        p.setCategory(cat);
        p.setImageUrl(body.imageUrl());
        return ProductDto.of(products.save(p));
    }

    @PutMapping("/{id}")
    public ProductDto update(@PathVariable long id, @RequestBody @Valid ProductCreateUpdateDto body) {
        var p = products.findById(id).orElseThrow(() -> new NoSuchElementException("Product %d not found".formatted(id)));
        var cat = categories.findById(body.idCategory())
                .orElseThrow(() -> new NoSuchElementException("Category %d not found".formatted(body.idCategory())));
        p.setName(body.name());
        p.setDescription(body.description());
        p.setPrice(body.price());
        p.setStock(body.stock());
        p.setCategory(cat);
        p.setImageUrl(body.imageUrl());
        return ProductDto.of(products.save(p));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable long id) {
        products.deleteById(id);
    }
}
