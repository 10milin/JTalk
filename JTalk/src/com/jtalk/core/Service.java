package com.jtalk.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	public String process(HttpServletRequest request, HttpServletResponse response);
}
