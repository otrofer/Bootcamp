package com.tienda.tienda.service;

import java.util.*;

import com.tienda.tienda.model.Stock;

public interface StockService {

    List<Stock> getAll();
    Stock getById(Long id);
    Stock save (Stock s);
    void delete (Long id);

    List<Stock> getByUsuario(Long usuarioId);
}
