package com.example.crud.product;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service // aca esta la logica.
public class ProductService {

    HashMap<String, Object> datos;

    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
        // inyeccion
    }

    public List<Product> getProducts() {

        return this.productRepository.findAll();

    }

    public ResponseEntity<Object> newProduct(Product product) {

        Optional<Product> res = productRepository.findProductByName(product.getName());
        datos = new HashMap<>();
        // con el producto que envien, preguntara si ese existe.

        if (res.isPresent() && product.getId() == null) {
            datos.put("error", "true");
            datos.put("message", "Ya existe un producto con ese nombre");

            return new ResponseEntity<>(
                    datos,
                    HttpStatus.CONFLICT);
        }

        datos.put("message", "Se guardo con exito");
        if (product.getId() != null) {

            datos.put("message", "Se actualizo con exito.");

        }
        productRepository.save(product);
        datos.put("data", product);
        datos.put("message", "Se guardo con exito.");
        return new ResponseEntity<>(
                datos,
                HttpStatus.CREATED);
    }

    public ResponseEntity<Object> deleteproduct(Long id) {
        datos = new HashMap<>();
        boolean existe = this.productRepository.existsById(id);
        if (!existe) {
            datos.put("error", "true");
            datos.put("message", "No existe un producto con ese nombre");
            return new ResponseEntity<>(
                    datos,
                    HttpStatus.CONFLICT);
        }

        datos.put("message", "Producto Eliminado");
        return new ResponseEntity<>(
                datos,
                HttpStatus.ACCEPTED);
    }

}
