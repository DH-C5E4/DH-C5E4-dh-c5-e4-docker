package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "*")
@RestController
public class TestController {

  @GetMapping("/api/test")
  public ResponseEntity<Map<String, String>> test() {
    Map<String, String> response = new HashMap<>();
    response.put("message", "Holis!");
    return ResponseEntity.ok(response);
  }
}
