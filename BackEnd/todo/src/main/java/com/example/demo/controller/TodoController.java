package com.example.demo.controller;

import com.example.demo.entity.Todo;
import com.example.demo.service.TodoService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/todos")
public class TodoController {

    private final TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    // localhost/todos
    @GetMapping
    public List<Todo> readAll() {
        return null;
    }

    @GetMapping("/{id}")
    public Todo read(@PathVariable String id) {
        return null;
    }

    // return Todo
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED) // liefert 201 zurück statt 200
    public Todo create(@RequestBody Todo todo) {
        System.out.println(todo.getId());
        // swagger check id for todo object
        Todo newTodo = todoService.create(todo);
        return newTodo;
        // return todoService.create(todo);
    }

    @PutMapping("/{id}")
    public Todo update(@PathVariable String id, @RequestBody Todo todo) {
        return null;
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {


    }
}
