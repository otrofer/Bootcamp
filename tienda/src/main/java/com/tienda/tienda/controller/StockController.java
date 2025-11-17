package com.tienda.tienda.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import jakarta.validation.Valid;


import com.tienda.tienda.model.Stock;
import com.tienda.tienda.service.StockService;

@RestController
@RequestMapping(path = "api/stock")

public class StockController {

    private final StockService stockService;

    @Autowired // inyectar.

    public StockController(StockService stockService) {
        this.stockService = stockService;
    }

    @GetMapping // GET a api/stock
    public ResponseEntity<List<Stock>> getAllStock() {
        List<Stock> stocks = stockService.getAll();
        return ResponseEntity.ok(stocks);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Stock> getStockById(@PathVariable Long id) {
        Stock stock = stockService.getById(id);
        if (stock == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(stock);
    }

    @GetMapping("/usuario/{usuarioId}")
    public ResponseEntity<List<Stock>> getStockByUsuario(@PathVariable Long usuarioId) {
        List<Stock> stocks = stockService.getByUsuario(usuarioId);
        return ResponseEntity.ok(stocks);
    }

    @PostMapping
    public ResponseEntity<Stock> crearStock(@Valid @RequestBody Stock stock) {
        try {
            Stock nuevoStock = stockService.save(stock);
            return ResponseEntity.status(HttpStatus.CREATED).body(nuevoStock);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Stock> actualizarStock(
            @PathVariable Long id, 
            @Valid @RequestBody Stock stock) {
        
        Stock stockExistente = stockService.getById(id);
        if (stockExistente == null) {
            return ResponseEntity.notFound().build();
        }
        
        stock.setId(id);
        Stock stockActualizado = stockService.save(stock);
        return ResponseEntity.ok(stockActualizado);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> borrarStock(@PathVariable Long id) {
        Stock stockExistente = stockService.getById(id);
        if (stockExistente == null) {
            return ResponseEntity.notFound().build();
        }
        
        stockService.delete(id);
        return ResponseEntity.noContent().build();
    }
}