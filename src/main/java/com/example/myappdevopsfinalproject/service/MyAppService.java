package com.example.myappdevopsfinalproject.service;

import com.example.myappdevopsfinalproject.model.StudentRecord;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 * Simple service for my final devops project.
 */
@Service
public final class MyAppService {

  public List<StudentRecord> getData() {
    return List.of(new StudentRecord("Vasil", "vasil.bachvarov.u23@learn.telerikacademy.com",
        "Devops Spring Boot project"));
  }
}
