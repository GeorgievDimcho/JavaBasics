package com.example.demo.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
public class Todo {
    @Id
    private String id;
    //@NotB
    private String task;
    private LocalDateTime due;
    private boolean isDone;

    public Todo() {
        // set id
        this.id = UUID.randomUUID().toString();
    }
    public Todo(String task, LocalDateTime due, boolean isDone) {
        this.id = UUID.randomUUID().toString();
        this.task = task;
        this.due = due;
        this.isDone = isDone;
    }

    public String getId() {
        return id;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public LocalDateTime getDue() {
        return due;
    }

    public void setDue(LocalDateTime due) {
        this.due = due;
    }

    public boolean isDone() {
        return isDone;
    }

    public void setDone(boolean done) {
        isDone = done;
    }
}
