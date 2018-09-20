package com.javalec.spring_board.dto;

import java.sql.Timestamp;

public class BDto {
	int bId;
	String name;
	String title;
	String content;
	Timestamp date;
	int hit;
	int bGroup;
	int bReply;
	int bStep;
	
	public BDto() {
		
	}
	
	public BDto(int bId, String name, String title, String content, Timestamp date, int hit, int bGroup, int bReply,
			int bStep) {
		super();
		this.bId = bId;
		this.name = name;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.bGroup = bGroup;
		this.bReply = bReply;
		this.bStep = bStep;
	}
	
	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
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
	
	
}
