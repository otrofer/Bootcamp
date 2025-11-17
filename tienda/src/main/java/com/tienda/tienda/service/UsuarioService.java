package com.tienda.tienda.service;

import java.util.List;
import java.util.Optional;


import com.tienda.tienda.model.Usuario;

public interface UsuarioService {
    List<Usuario> getAll();

    Optional<Usuario> getById(Long id);

    Usuario save(Usuario u);

    void delete (Long id);

    Optional<Usuario> findByEmail(String email);

    boolean existsByEmail(String email);

}
