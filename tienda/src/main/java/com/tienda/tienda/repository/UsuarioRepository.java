package com.tienda.tienda.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tienda.tienda.model.Usuario;

public interface UsuarioRepository extends JpaRepository <Usuario, Long>  {

    Optional<Usuario> findByEmail(String email);
    // esto permite buscar por email para hacer el login.
}
