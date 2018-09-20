package com.javalec.spring_board.dto;

import java.sql.Timestamp;

public class UserDto {
	private String email;
	private String name;
	private String passwd;
	private Timestamp udate;
	private int uId;
	private String usalt;
	
	public UserDto() {
		
	}
	
	public UserDto(String email, String name, Timestamp udate, int uId) {
		super();
		this.email = email;
		this.name = name;
		this.udate = udate;
		this.uId = uId;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getUdate() {
		return udate;
	}
	public void setUdate(Timestamp udate) {
		this.udate = udate;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getUsalt() {
		return usalt;
	}
	public void setUsalt(String usalt) {
		this.usalt = usalt;
	}
	
	
}
