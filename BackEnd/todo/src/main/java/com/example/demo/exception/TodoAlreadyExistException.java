package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.CONFLICT)
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
