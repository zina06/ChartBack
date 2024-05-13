package com.example.demo.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.chartDto;

@Mapper
public interface chartMapper {
	public List<chartDto> getChart();

	public List<chartDto> getSumChart();
}
