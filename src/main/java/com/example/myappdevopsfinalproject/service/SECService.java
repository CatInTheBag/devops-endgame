package com.example.myappdevopsfinalproject.service;

import java.util.Arrays;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 * Simple service for data validation.
 */
@Service
public class SECService {

  private static final List<String> validFilings = Arrays.asList("10-K", "10-Q", "8-K", "S-1",
      "DEF 14A");

  public boolean isValidFiling(String filing) {
    return validFilings.contains(filing);
  }
}
