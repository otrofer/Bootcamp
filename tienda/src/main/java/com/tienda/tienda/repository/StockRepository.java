package com.tienda.tienda.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tienda.tienda.model.Stock;

public interface StockRepository extends JpaRepository <Stock, Long> {

List<Stock> findByUsuarioId(long usuarioId);

}
