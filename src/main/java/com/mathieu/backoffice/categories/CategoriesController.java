package com.mathieu.backoffice.categories;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/categories")
public class CategoriesController {
  private final CategoryRepository repo;
  public CategoriesController(CategoryRepository repo){ this.repo=repo; }

  @GetMapping
  public List<CategoryDto> list() {
    return repo.findAll().stream().map(CategoryDto::of).toList();
  }

  @GetMapping("/{id}")
  public CategoryDto get(@PathVariable long id) {
    var c = repo.findById(id).orElseThrow(() -> new java.util.NoSuchElementException("Category %d not found".formatted(id)));
    return CategoryDto.of(c);
  }
}
