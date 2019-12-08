package kr.co.itcen.fa.util;

import java.util.HashMap;
import java.util.Map;

/**
 * @작성자:	kbetter3
 * @작성일:	Dec 2, 2019
 * @이메일:	kbetter3@gmail.com
 * @수정자: 	ban
 * 
 * 페이징 유틸 Ajax 쓰는 사람 쓰기를
 */
public class Pagination {
	private int page;				// 현재 페이지
	private int totalCnt;			// 전체 게시물 수 1
	private int totalPageCnt;		// 전체 페이지 수
	private final int pageBlockSize;	// 페이징 블럭 사이즈 ex) < 1 2 3 4 5 > 에 보여질 개수
	private final int pageSize;			// 한 페이지에 보여질 게시글의 수
	private int startPage;			// 시작 페이지
	private int endPage;				// 마지막 페이지
	private int startRow;			// 시작 Row
	private boolean prev;			// 이전 버튼
	private boolean next;			// 다음 버튼
	
	/**
	 *  기본값 pageSize=11, pageBlockSize=5
	 */
	public Pagination(int page, int totalCnt){
		this(page, totalCnt, 11);
	}
	
	/**
	 * pageSize 지정가능
	 */
	public Pagination(int page, int totalCnt, int pageSize){
		this(page, totalCnt, pageSize, 5);
	}
	/**
	 * 직접 pageBlockSize, pageSize 지정가능
	 */
	public Pagination(int page, int totalCnt, int pageSize, int pageBlockSize){
		this.page = page;
		this.totalCnt = totalCnt;
		this.pageSize = pageSize;
		this.pageBlockSize = pageBlockSize;
		
		processPaging();
	}
	/**
	 * Start Row, Start Page, End Page, Next, Priv값을 결정한다
	 */
	private void processPaging() {
		startRow = (page -1) * pageSize;
		
		totalPageCnt = (int) Math.ceil(totalCnt / (double)pageSize);
			
		//DB에서 데이터 삭제시 총 페이지가 현재 페이지보다 작을 수 있다.
		if (totalPageCnt < page) 
			page = totalPageCnt;
		
		startPage = ((page - 1) / pageBlockSize) * pageBlockSize + 1;
		endPage = startPage + pageBlockSize - 1;
		
		//끝 페이지 처리
		if (endPage > totalPageCnt) 
			endPage = totalPageCnt;
		
		//이전, 다음 화살표 표시여부
		prev = (startPage > pageSize) ? true : false;
		next = (totalPageCnt > pageSize && endPage < totalPageCnt) ? true : false;
	}
	
	/**
	 * Limit 범위가 담긴맵
	 */
	public Map getRowRangeMap() {
		Map map = new HashMap<String, Object>();
		map.put("startRow", startRow);	//시작 Row
		map.put("pageSize", pageSize);	//한 페이지에 보여줄갯수
		
		return map;
	}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
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
}
