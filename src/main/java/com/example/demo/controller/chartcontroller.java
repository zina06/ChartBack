package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.chartDto;
import com.example.demo.service.chartService;

@RestController
public class chartcontroller {

	
	@Autowired
	chartService chartService;


	 @GetMapping("/get/chartData") 
	 public ResponseEntity<List<chartDto>> getChart(){ 
		 List<chartDto> chartDto = chartService.getChart(); 
	       return new ResponseEntity<List<chartDto>>(chartDto, HttpStatus.OK); 
	   }

	 
	}


