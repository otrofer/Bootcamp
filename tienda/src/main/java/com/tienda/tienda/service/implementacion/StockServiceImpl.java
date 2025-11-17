package com.tienda.tienda.service.implementacion;

import java.util.*;

import org.springframework.stereotype.Service;

import com.tienda.tienda.model.Stock;
import com.tienda.tienda.repository.StockRepository;
import com.tienda.tienda.service.StockService;

@Service
public class StockServiceImpl implements StockService {

    private final StockRepository stockRepo;

    public StockServiceImpl(StockRepository stockRepo) {
        this.stockRepo = stockRepo;

    }

    @Override // reescribiendo metodo.
    public List<Stock> getAll() {

        return stockRepo.findAll();
    }

    @Override
    public Stock getById(Long id) {
        return stockRepo.findById(id).orElse(null);

    }

    @Override
    public Stock save(Stock stock) {
        return stockRepo.save(stock);
    }

    @Override
    public void delete(Long id) {
        stockRepo.deleteById(id);
    }

    @Override
    public List<Stock> getByUsuario(Long usuarioId) {
        return stockRepo.findByUsuarioId(usuarioId);
    }
}
