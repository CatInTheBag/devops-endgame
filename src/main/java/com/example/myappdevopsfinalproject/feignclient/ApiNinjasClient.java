package com.example.myappdevopsfinalproject.feignclient;

import com.example.myappdevopsfinalproject.feignclient.model.RandomPasswordOutputRecord;
import com.example.myappdevopsfinalproject.feignclient.model.SecFilingOutputRecord;
import feign.Headers;
import java.util.List;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "api-ninjas", url = "https://api.api-ninjas.com/v1")
public interface ApiNinjasClient {

  @GetMapping("/passwordgenerator")
  @Headers({"Accept: application/json", "X-Api-Key:{apiKey}"})
  RandomPasswordOutputRecord getPassword(@RequestParam("length") int length,
      @RequestHeader("X-Api-Key") String apiKey);

  @GetMapping("/sec")
  @Headers({"Accept: application/json", "X-Api-Key:{apiKey}"})
  List<SecFilingOutputRecord> searchCompany(@RequestParam("ticker") String ticker, @RequestParam("filing") String filing,
      @RequestHeader("X-Api-Key") String apiKey);
}