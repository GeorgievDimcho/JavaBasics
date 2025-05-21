package com.example.demo;

import com.example.demo.restservice.Greeting;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
      @GetMapping("/login")
    public Login login(@RequestParam(value = "name", defaultValue = "World") String email,@RequestParam(value = "name", defaultValue = "World") String password) {
          System.out.println("email: " + email);
          System.out.println("password: " + password);
          return new Login(email,password);
    }
}
