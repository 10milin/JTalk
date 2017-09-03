package com.jtalk.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	public String execute(HttpServletRequest request, HttpServletResponse response);
}