package com.javalec.spring_board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.javalec.spring_board.dto.BDto;
import com.javalec.spring_board.dto.UserDto;

public interface BDao {
	
	//board
	public int findBId();
	public int findRId(int bGroup);
	public int listCount();
	public int monCount();
	public int slistCount(String keyword);
	public int tagCount(String tag);
	public ArrayList<String> tagNames();
	public ArrayList<BDto> listDao(int startRow);
	public ArrayList<BDto> hotList(int startRow);
	public ArrayList<BDto> monList(int startRow);
	public ArrayList<BDto> slistDao(String keyword, String std, int startRow);
	public ArrayList<BDto> slistRel(String keyword, int startRow);
	public ArrayList<BDto> tagList(String tag, String std, int startRow);
	public ArrayList<BDto> randList();
	public BDto viewDao(int bId);
	public ArrayList<BDto> viewReply(int bGroup);
	public void writeDao(int bId, String email, String title, String content);
	public void writeTag(HashMap<String, Object> tag_map);
	public void replyDao(int bId, String email, String content, int bGroup);
	public void commentDao(int bId, String email, String content, int bGroup, int bReply);
	public void upHit(int bId);
	public void upReadcount(int bId);
	public void upReply(int bId);
	public void upRHit(int bId);
	public void modifyDao(int bId, String title, String content);
	public void deleteDao(int bId);
	public void deleteReplyAll(int bGroup);
	public void deleteReply(int bGroup, int bId);
	public void deleteTag(int bId);
	
	//USER
	public int testEmail(String email);
	public int testName(String name);
	public UserDto signIn(String email);
	public int signUp(String email, String name, String passwd);
	public int signUpRole(String email);
	public ArrayList<UserDto> listUser();
	public void modName(String name, int uId);
	public void modPass(String pass, int uId);
	public void deleteUser(int uId);
}
