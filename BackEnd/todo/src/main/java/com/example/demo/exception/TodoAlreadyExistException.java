package com.example.demo.exception;

public class TodoAlreadyExistException extends RuntimeException{
    public TodoAlreadyExistException() {
    }

    public TodoAlreadyExistException(String message) {
        super(message);
    }

    public TodoAlreadyExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public TodoAlreadyExistException(Throwable cause) {
        super(cause);
    }

    public TodoAlreadyExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
