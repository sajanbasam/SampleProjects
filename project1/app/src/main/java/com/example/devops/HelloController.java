package com.example.devops;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

@RestController
public class HelloController {

    @GetMapping("/")
    public Map<String, String> hello() {
        Map<String, String> response = new HashMap<>();
        response.put("message", "Hello from the Java DevOps Project!");
        try {
            response.put("hostname", InetAddress.getLocalHost().getHostName());
        } catch (UnknownHostException e) {
            response.put("hostname", "unknown");
        }
        return response;
    }
}
