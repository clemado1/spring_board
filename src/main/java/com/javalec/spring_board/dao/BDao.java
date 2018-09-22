package com.javalec.spring_board.dao;

import java.util.ArrayList;

import com.javalec.spring_board.dto.BDto;
import com.javalec.spring_board.dto.UserDto;

public interface BDao {
	
	//board
	public int findBId();
	public int findRId();
	public int listCount();
	public int slistCountAll(String keyword);
	public int slistCount(String column, String keyword);
	public ArrayList<BDto> listDao(int page);
	public ArrayList<BDto> slistDaoAll(String keyword, int page);
	public ArrayList<BDto> slistDao(String column, String keyword, int page);
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
