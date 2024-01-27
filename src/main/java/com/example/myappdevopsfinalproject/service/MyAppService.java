package com.example.myappdevopsfinalproject.service;

import com.example.myappdevopsfinalproject.feignclient.PasswordGeneratorClient;
import com.example.myappdevopsfinalproject.feignclient.model.RandomPasswordOutputRecord;
import com.example.myappdevopsfinalproject.model.StudentRecord;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Value;

/**
 * Simple service for my final devops project.
 */
@Service
@RequiredArgsConstructor
public final class MyAppService {

  @Value("${api.key}")
  private String apiKey;
  @Autowired
  private PasswordGeneratorClient passwordGeneratorClient;

  public List<StudentRecord> getInfo() {
    return List.of(new StudentRecord("Vasil", "vasil.bachvarov.u23@learn.telerikacademy.com",
        "Devops Spring Boot project", "1234"));
  }

  public RandomPasswordOutputRecord generatePassword(int size) {
    return passwordGeneratorClient.getPassword(size, apiKey);
  }
}
