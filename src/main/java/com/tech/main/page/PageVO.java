package com.tech.main.page;

public class PageVO {
	private Integer displayRowCount=10; //출력할 데이터 갯수
	private Integer rowStart; //시작행 번호
	private Integer rowEnd; //종료행 번호
	private Integer totPage; //전체 페이지 수
	private Integer totRow=0; //전체 데이터 수
	private Integer page; //현재 페이지
	private Integer pageStart; //시작 페이지
	private Integer pageEnd; //종료 페이지

	//전체 페이지 갯수를 이용해서 페이지 계산
	public void pageCalculate(Integer total) {
		getPage(); //호출
		totRow=total;
		totPage=(int)(total/displayRowCount);
		if (total%displayRowCount>0) {
			totPage++;
		}
		pageStart=(page-(page-1)%displayRowCount);
		pageEnd=pageStart+2;
		if (pageEnd>totPage) {
			pageEnd=totPage;
		}
		
		rowStart=((page-1)*displayRowCount)+1;
		rowEnd=rowStart+displayRowCount-1;
		
	}
	public Integer getPage() {
		if (page==null || page==0) {
			page=1;
		}
		return page;
	}
	
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getDisplayRowCount() {
		return displayRowCount;
	}
	public void setDisplayRowCount(Integer displayRowCount) {
		this.displayRowCount = displayRowCount;
	}
	public Integer getRowStart() {
		return rowStart;
	}
	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}
	public Integer getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(Integer rowEnd) {
		this.rowEnd = rowEnd;
	}
	public Integer getTotPage() {
		return totPage;
	}
	public void setTotPage(Integer totPage) {
		this.totPage = totPage;
	}
	public Integer getTotRow() {
		return totRow;
	}
	public void setTotRow(Integer totRow) {
		this.totRow = totRow;
	}
	public Integer getPageStart() {
		return pageStart;
	}
	public void setPageStart(Integer pageStart) {
		this.pageStart = pageStart;
	}
	public Integer getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(Integer pageEnd) {
		this.pageEnd = pageEnd;
	}
	
	

	
	
}
