package com.jtalk.dao;

import java.util.ArrayList;

import com.jtalk.dto.AnonyDTO;

public class AnonyDAO {
	private AnonyDAO(){}
	
	private static AnonyDAO instance = new AnonyDAO();

	public static AnonyDAO getInstance() {
		return instance;
	}

	public ArrayList<AnonyDTO> getAllAnony() {
		
		return null;
	}

}
