package com.example.demo.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.chartDto;
import com.example.demo.service.chartService;

@RestController
public class chartcontroller {

	
	@Autowired
	chartService chartService;


	 @GetMapping("/get/chartData") 
	 public ResponseEntity<List<chartDto>> getChart(String startDate,String endDate){ 
		 List<chartDto> chartDto = chartService.getChart(startDate, endDate);
	       return new ResponseEntity<List<chartDto>>(chartDto, HttpStatus.OK); 
	   }
	
	
//	@GetMapping("/get/chartData") 
//	public ResponseEntity<List<chartDto>> getChart(List<String> tableNames,String startDate, String endDate) { 
//		 List<chartDto> chartData = chartService.unionPingData(tableNames, startDate, endDate);
//	        return new ResponseEntity<>(chartData, HttpStatus.OK);
//	}

	@GetMapping("/get/tableList") 
	public ResponseEntity<List<String>> getChar22t() { 
		List<String> ChartTableList = chartService.selectChartTable();
		return new ResponseEntity<>(ChartTableList, HttpStatus.OK);
	}

    @GetMapping("/unionPingData")
    public Map<String, List<chartDto>> getUnionPingData(
            @RequestParam String startDate,
            @RequestParam String endDate) {
        return chartService.unionPingData(startDate, endDate);
    }
	 
	}


