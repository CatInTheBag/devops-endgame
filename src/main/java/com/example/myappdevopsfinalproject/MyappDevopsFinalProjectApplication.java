package com.example.myappdevopsfinalproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * Spring boot application.
 */
@SpringBootApplication
@EnableFeignClients
public class MyappDevopsFinalProjectApplication {

  public static void main(String[] args) {
    SpringApplication.run(MyappDevopsFinalProjectApplication.class, args);
  }

}
