package com.example.demo.repository;

import com.example.demo.entity.Todo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

//                                           HashMap object, UUID
public interface TodoRepository extends JpaRepository<Todo, String> {
    Optional<Todo> findByTask(String task);
    // .isPresent() boolean
    // .orElse()
}
