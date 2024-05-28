package com.example.demo.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;



public class chartDto {

	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date time;
	
	private int ping;
		
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date endDate;
	
	private String[] tableName;
	
	private String serverName;


	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getPing() {
		return ping;
	}
	public void setPing(int ping) {
		this.ping = ping;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getServerName() {
		return serverName;
	}
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}
	public String[] getTableName() {
		return tableName;
	}
	public void setTableName(String[] tableName) {
		this.tableName = tableName;
	}



	
	
	
	
}
