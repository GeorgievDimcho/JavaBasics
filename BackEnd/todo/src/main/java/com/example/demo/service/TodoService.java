package com.example.demo.service;

import com.example.demo.entity.Todo;
import com.example.demo.exception.TodoAlreadyExistException;
import com.example.demo.exception.TodoByIdNotFound;
import com.example.demo.repository.TodoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
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
        if (todoCheck.isPresent()) {
            // nicht speichern
            // throw exception
            throw new TodoAlreadyExistException();
        }
        // speichern und todo zurückgeben
        return todoRepository.save(todo);
    }

    public Todo read(String id) {
        Optional<Todo> optionalTodo = todoRepository.findById(id);
        if(optionalTodo.isEmpty()) {
            System.out.println("-----------------ERORRR-------------------");
            //throw new RuntimeException("id not found");
            //throw new TodoByIdNotFound("Task with id: " + id + " not found.");
            throw new TodoByIdNotFound();
        }
        return optionalTodo.get();
    }

    public List<Todo> readAll() {
        List<Todo> todoList = todoRepository.findAll();
        return todoList;
    }

    public void delete(String id) {
        Optional<Todo> oTodo = todoRepository.findById(id);
        if(oTodo.isEmpty()) {
            throw new TodoByIdNotFound();
        }
        todoRepository.deleteById(id);
    }
}
