package com.javalec.spring_board.dao;

import java.util.ArrayList;

import com.javalec.spring_board.dto.BDto;

public interface BDao {
	
	public ArrayList<BDto> listDao();
	public void writeDao(String bName, String bTitle, String bContent);
	public BDto viewDao(String bId);
	public void deleteDao(String bId);
}
