package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.chartDto;
import com.example.demo.mapper.chartMapper;

@Service
public class chartServiceImp implements chartService {
	
	@Autowired
	chartMapper chartMapper;


	@Override
	public List<chartDto> getChart(String startDate, String endDate) {
		// TODO Auto-generated method stub
		return chartMapper.getChart(startDate, endDate);
	}


	@Override
	public List<chartDto> getSumChart() {
		// TODO Auto-generated method stub
		return chartMapper.getSumChart();
	}

}
