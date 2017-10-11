package com.jtalk.dto;

public class DatabaseDTO {
	private String table_name;
	private int table_rows;
	private double data_size;

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public int getTable_rows() {
		return table_rows;
	}

	public void setTable_rows(int table_rows) {
		this.table_rows = table_rows;
	}

	public double getData_size() {
		return data_size;
	}

	public void setData_size(double data_size) {
		this.data_size = data_size;
	}
	
	
}
