package com.example.demo.mapper;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.chartDto;

@Mapper
public interface chartMapper {
	public List<chartDto> getChart(String startDate, String endDate);

	public List<chartDto> getSumChart();
	

	
	public List<String> selectChartTable();

	public List<chartDto> unionPingData(Map<String, Object> parameterMap);
}
