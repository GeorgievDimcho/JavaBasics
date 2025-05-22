package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class TodoByIdNotFound extends RuntimeException{
    public TodoByIdNotFound() {
    }

    public TodoByIdNotFound(String message) {
        super(message);
    }

    public TodoByIdNotFound(String message, Throwable cause) {
        super(message, cause);
    }

    public TodoByIdNotFound(Throwable cause) {
        super(cause);
    }

    public TodoByIdNotFound(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
