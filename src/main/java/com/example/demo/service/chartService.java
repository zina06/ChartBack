package com.example.demo.service;

import java.util.List;
import java.util.Map;

import com.example.demo.dto.chartDto;

public interface chartService {
	
	public List<chartDto> getChart(String startDate, String endDate);

	public List<chartDto> getSumChart();

	
	//public List<chartDto> unionPingData(String startDate, String endDate);
	
	public  Map<String, List<chartDto>> unionPingData(String startDate, String endDate);
	
	public List<String> selectChartTable();
}
