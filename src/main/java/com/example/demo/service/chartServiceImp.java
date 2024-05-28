package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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



	


	@Override
	public List<String> selectChartTable() {
		// TODO Auto-generated method stub
		return chartMapper.selectChartTable();
	}


	@Override
	public Map<String, List<chartDto>> unionPingData(String startDate, String endDate) {
        Map<String, List<chartDto>> result = new HashMap<>();
        List<String> tableNameList = chartMapper.selectChartTable();
        System.out.println(tableNameList);
        for (String tableName : tableNameList) {
            Map<String, Object> parameterMap = new HashMap<>();
	          parameterMap.put("startDate", startDate);
	          parameterMap.put("endDate", endDate);
	          parameterMap.put("tableName", tableName);
	          parameterMap.put("tableNameList", tableNameList);
            List<chartDto> pingDataList = chartMapper.unionPingData(parameterMap);
            result.put(tableName, pingDataList);
        }

        return result;
	}


//    @Override
//    public List<chartDto> unionPingData(String startDate, String endDate ) {
//        // Step 1: Get the list of table names
//        List<String> tableNameList = chartMapper.selectChartTable();
//
//        // Step 2: Result list to store all the data
//        List<chartDto> resultList = new ArrayList<>();
//
//        // Step 3: Iterate over each table name and get data
//        if (tableNameList != null && !tableNameList.isEmpty()) {
//            for (String tableName : tableNameList) {
//                Map<String, Object> parameterMap = new HashMap<>();
//                parameterMap.put("startDate", startDate);
//                parameterMap.put("endDate", endDate);
//                parameterMap.put("tableName", tableName);
//
//                List<chartDto> tableData = chartMapper.unionPingData(parameterMap);
//                resultList.addAll(tableData);
//            }
//        }
//
//        return resultList;
//    }



}
