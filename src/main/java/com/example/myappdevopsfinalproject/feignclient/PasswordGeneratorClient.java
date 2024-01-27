package com.example.myappdevopsfinalproject.feignclient;

import com.example.myappdevopsfinalproject.feignclient.model.RandomPasswordOutputRecord;
import feign.Headers;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "passwordGenerator", url = "https://api.api-ninjas.com/v1")
public interface PasswordGeneratorClient {

  @GetMapping("/passwordgenerator")
  @Headers({"Accept: application/json", "X-Api-Key:{apiKey}"})
  RandomPasswordOutputRecord getPassword(@RequestParam("length") int length,
      @RequestHeader("X-Api-Key") String apiKey);
}