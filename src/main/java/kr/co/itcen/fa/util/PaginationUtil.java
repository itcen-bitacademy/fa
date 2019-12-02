package kr.co.itcen.fa.util;

/**
 * @작성자:	kbetter3
 * @작성일:	Dec 2, 2019
 * @이메일:	kbetter3@gmail.com
 * 
 * 페이징 유틸
 */
public class PaginationUtil {
	private int page;				// 현재 페이지
	private int totalCnt;			// 전체 게시물 수 1
	private int totalPageCnt;		// 전체 페이지 수
	private int pageSize;			// 페이징 블럭 사이즈 ex) < 1 2 3 4 5 > 에 보여질 개수
	private int listSize;			// 한 페이지에 보여질 게시글의 수
	private int startPage;			// 시작 페이지
	private int endPage;			// 마지막 페이지
	private boolean prev;			// 이전 버튼
	private boolean next;			// 다음 버튼

	public PaginationUtil(int page, int totalCnt, int listSize, int pageSize) {
		super();
		this.page = page;
		this.totalCnt = totalCnt;
		this.listSize = listSize;
		this.pageSize = pageSize;
		
		this.totalPageCnt = (int) Math.ceil(this.totalCnt / (double)listSize);
		
		if (this.totalPageCnt < this.page) {
			this.page = this.totalPageCnt;
		}
		
		this.startPage = ((this.page - 1) / this.pageSize) * this.pageSize + 1;
		this.endPage = this.startPage + this.pageSize - 1;
		
		if (this.endPage > this.totalPageCnt) {
			this.endPage = this.totalPageCnt;
		}
		
		this.prev = (this.startPage > this.pageSize) ? true : false;
		this.next = (this.totalPageCnt > this.pageSize && this.endPage < this.totalPageCnt) ? true : false;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getTotalPageCnt() {
		return totalPageCnt;
	}

	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	public int getPageIndex() {
		return (this.page - 1) * this.listSize;
	}

}
