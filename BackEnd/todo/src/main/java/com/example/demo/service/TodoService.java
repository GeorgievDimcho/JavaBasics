package com.example.demo.service;

import com.example.demo.entity.Todo;
import com.example.demo.exception.TodoAlreadyExistException;
import com.example.demo.repository.TodoRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class TodoService {
    private final TodoRepository todoRepository;
    public TodoService(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }

    public Todo create(Todo todo) {
        Optional<Todo> todoCheck = todoRepository.findByTask(todo.getTask());
        //findByTask
        if(todoCheck.isPresent()) {
            // nicht speichern
            // throw exception
            throw new TodoAlreadyExistException();
        }
        // speichern und todo zurückgeben
        return todoRepository.save(todo);


    }
}
