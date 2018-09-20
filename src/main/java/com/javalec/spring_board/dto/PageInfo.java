package com.javalec.spring_board.dto;

public class PageInfo {
	private int page;
	private int limit = 10;
	private int limitPage = 5;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;
	
	public PageInfo() {
		
	}
	
	public PageInfo(int page, int listCount) {
		int maxPage = (int)((double)listCount/limit+0.95);
		int startPage = (((int)((double)page/limitPage+0.9))-1) *limitPage +1;
		int endPage = startPage+limitPage-1;
		if(endPage>maxPage) endPage = maxPage;
		
		setEndPage(endPage);
		setListCount(listCount);
		setMaxPage(maxPage);
		setPage(page);
		setStartPage(startPage);

	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	
	
}
