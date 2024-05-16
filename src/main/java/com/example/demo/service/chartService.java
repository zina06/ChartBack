package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.chartDto;

public interface chartService {
	
	public List<chartDto> getChart(String startDate, String endDate);

	public List<chartDto> getSumChart();

}
