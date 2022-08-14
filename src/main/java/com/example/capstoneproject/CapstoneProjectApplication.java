package com.example.capstoneproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@SpringBootApplication
@RestController
public class CapstoneProjectApplication {

    @GetMapping("/")
    public ModelAndView home(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login.jsp");
        return mv;
    }

    public static void main(String[] args) {
        SpringApplication.run(CapstoneProjectApplication.class, args);
    }

}
