package com.example.crud.product;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

// te permite crear todas las tareas de crud.

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

   // @Query("SELECT * FROM products p WHERE p.name= ?1")

    Optional <Product> findProductByName(String name);
    
}
