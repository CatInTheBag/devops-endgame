package com.example.myappdevopsfinalproject.exception;

import com.fasterxml.jackson.databind.ObjectMapper;
import feign.FeignException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import org.springframework.cglib.core.Local;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.objenesis.ObjenesisHelper;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Simple exception handler.
 */
@ControllerAdvice
public class GlobalExceptionHandler {

  @ExceptionHandler(ResourceNotFoundException.class)
  public ResponseEntity<Object> handleException(ResourceNotFoundException ex) {
    Map<String, Object> body = new HashMap<>();
    body.put(("timestamp"), LocalDateTime.now());
    body.put("status", HttpStatus.NOT_FOUND.value());
    body.put(("error"), "Resource Not Found");
    body.put("message", ex.getMessage());

    return new ResponseEntity<>(body, HttpStatus.NOT_FOUND);
  }
}
