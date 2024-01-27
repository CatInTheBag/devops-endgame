package com.example.myappdevopsfinalproject.controller;

import com.example.myappdevopsfinalproject.feignclient.model.RandomPasswordOutputRecord;
import com.example.myappdevopsfinalproject.model.StudentRecord;
import com.example.myappdevopsfinalproject.service.MyAppService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Simple controller for final project.
 */
@RestController
@RequestMapping("api/v1")
public class MyAppController {

  private final MyAppService myAppService;

  @Autowired
  public MyAppController(MyAppService myAppService) {
    this.myAppService = myAppService;
  }

  @GetMapping("/info")
  public ResponseEntity<List<StudentRecord>> getInfo() {
    return ResponseEntity.ok(myAppService.getInfo());
  }

  @GetMapping("/generate-password/{size}")
  public ResponseEntity<RandomPasswordOutputRecord> generatePassword(@PathVariable( name = "size") int size){
    return ResponseEntity.ok(myAppService.generatePassword(size));
  }
}
