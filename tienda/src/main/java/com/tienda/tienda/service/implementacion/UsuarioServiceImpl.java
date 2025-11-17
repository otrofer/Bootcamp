package com.tienda.tienda.service.implementacion;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tienda.tienda.model.Usuario;
import com.tienda.tienda.repository.UsuarioRepository;
import com.tienda.tienda.service.UsuarioService;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository usuarioRepos;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UsuarioServiceImpl(UsuarioRepository usuarioRepos, BCryptPasswordEncoder passwordEncoder) {
        this.usuarioRepos = usuarioRepos;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public List<Usuario> getAll() {
        return usuarioRepos.findAll();
    }

    @Override
    public Optional<Usuario> getById(Long id) {
        return usuarioRepos.findById(id);
    }

    @Override
    public Usuario save(Usuario usuario) {
        // Encriptar la contraseña antes de guardar
        if (usuario.getPassword() != null && !usuario.getPassword().isEmpty()) {
            // Solo encriptar si no está ya encriptada (BCrypt empieza con $2a$ o $2b$)
            if (!usuario.getPassword().startsWith("$2a$") && 
                !usuario.getPassword().startsWith("$2b$")) {
                usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
            }
        }
        return usuarioRepos.save(usuario);
    }

    @Override
    public void delete(Long id) {
        usuarioRepos.deleteById(id);
    }

    @Override
    public Optional<Usuario> findByEmail(String email) {
        return usuarioRepos.findByEmail(email);
    }

    @Override
    public boolean existsByEmail(String email) {
        return usuarioRepos.findByEmail(email).isPresent();
    }
}