package com.tienda.tienda.controller;

import com.tienda.tienda.service.UsuarioService;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import com.tienda.tienda.model.Usuario;

@RestController
@RequestMapping(path = "/api/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    // listo todos los usaers.

    @GetMapping
    public ResponseEntity<List<Usuario>> lista_Usuario() {
        List<Usuario> usuarios = usuarioService.getAll();
        return ResponseEntity.ok(usuarios);

    }

    // ACA se crean los usuarios
    @PostMapping
    public ResponseEntity<Usuario> crearUsuario(@RequestBody Usuario usuario) {
        Usuario nuevoUser = usuarioService.save(usuario);
        return ResponseEntity.status(HttpStatus.CREATED).body(nuevoUser);
    }

    // obtener usuario por su id.
    @GetMapping("/{id}")
    public ResponseEntity<Usuario> getUsuarioById(@PathVariable Long id) {
        return usuarioService.getById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // actualizar el user.
    @PutMapping("/{id}")
    public ResponseEntity<Usuario> actualizarUser(@PathVariable Long id, @RequestBody Usuario usuarioDetails) {
        return usuarioService.getById(id)
                .map(userExistente -> {
                    userExistente.setNombre(usuarioDetails.getNombre());
                    userExistente.setEmail(usuarioDetails.getEmail());
                    userExistente.setRol(usuarioDetails.getRol());
                    userExistente.setPassword(usuarioDetails.getPassword());
                    Usuario actualizado = usuarioService.save(userExistente);
                    return ResponseEntity.ok(actualizado);
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // eliminar user
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarUser(@PathVariable Long id) {
        return usuarioService.getById(id)
                .map(userExistente -> {
                    usuarioService.delete(id);
                    return ResponseEntity.noContent().<Void>build();
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

}
