package com.javalec.spring_board.dto;

public class TagDto {
	int tag_id;
	int bId;
	String tag_name;
	
	public TagDto() {
		
	}
	public TagDto(int tag_id, int bId, String tag_name) {
		super();
		this.tag_id = tag_id;
		this.bId = bId;
		this.tag_name = tag_name;
	}
	public int getTag_id() {
		return tag_id;
	}
	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	
	
}
