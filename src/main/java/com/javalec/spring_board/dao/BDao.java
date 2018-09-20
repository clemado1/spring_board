package com.javalec.spring_board.dao;

import java.util.ArrayList;

import com.javalec.spring_board.dto.BDto;

public interface BDao {
	
	public int findBId();
	public int findRId();
	public int listCount();
	public ArrayList<BDto> listDao();
	public ArrayList<BDto> searchList();
	public BDto viewDao(int bId);
	public ArrayList<BDto> viewReply(int bGroup);
	public void writeDao(int bId, String bName, String bTitle, String bContent);
	public void replyDao(int bId, String bName, String bContent, int bGroup);
	public void commentDao(int bId, String bName, String bContent, int bGroup, int bReply);
	public void upHit(int bId);
	public void upReply(int bId);
	public void upRHit(int bId);
	public void modifyDao(int bId, String bTitle, String bContent);
	public void deleteDao(int bId);
	public void deleteReply(int bGroup);
}
