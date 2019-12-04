package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

import kr.co.itcen.fa.util.PaginationUtil;

/**
 * @작성자:	임성주
 * @작성일:	Dec 2, 2019
 * 
 */
@Alias("menu03SearchForm")
public class Menu03SearchForm {
	private String year;

	private int page = 1;
	private PaginationUtil pagination;
	
	
	// Getter & Setter
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PaginationUtil getPagination() {
		return pagination;
	}

	public void setPagination(PaginationUtil pagination) {
		this.pagination = pagination;
	}
}
