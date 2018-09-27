package com.javalec.spring_board.dto;

import java.sql.Timestamp;
import java.util.ArrayList;

public class BDto {
	int bId;
	String email;
	String name;
	String title;
	String content;
	Timestamp date;
	int hit;
	int bGroup;
	int bReply;
	int bStep;
	int readcount;
	ArrayList<String> tags;
	
	public BDto() {
		
	}
	
	public BDto(int bId, String email, String name, String title, String content, Timestamp date, int hit, int bGroup, int bReply, int readcount) {
		super();
		this.bId = bId;
		this.email = email;
		this.name = name;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.bGroup = bGroup;
		this.bReply = bReply;
		this.readcount = readcount;
	}
	
	public BDto(int bId, String email, String name, String title, String content, Timestamp date, int hit, int bGroup, int bReply,
			int bStep, int readcount) {
		super();
		this.bId = bId;
		this.email = email;
		this.name = name;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.bGroup = bGroup;
		this.bReply = bReply;
		this.bStep = bStep;
		this.readcount = readcount;
	}

	public BDto(int bId, String email, String name, String title, String content, Timestamp date, int hit, int bGroup, int bReply,
			int bStep, int readcount, ArrayList<String> tags) {
		super();
		this.bId = bId;
		this.email = email;
		this.name = name;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.bGroup = bGroup;
		this.bReply = bReply;
		this.bStep = bStep;
		this.readcount = readcount;
		this.tags = tags;
	
	}
	
	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getbGroup() {
		return bGroup;
	}

	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}

	public int getbReply() {
		return bReply;
	}

	public void setbReply(int bReply) {
		this.bReply = bReply;
	}

	public int getbStep() {
		return bStep;
	}

	public void setbStep(int bStep) {
		this.bStep = bStep;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public ArrayList<String> getTags() {
		return tags;
	}

	public void setTags(ArrayList<String> tags) {
		this.tags = tags;
	}
	
	
}
