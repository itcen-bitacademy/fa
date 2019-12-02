package kr.co.itcen.fa.vo.menu17;

import org.apache.ibatis.type.Alias;

import kr.co.itcen.fa.util.PaginationUtil;

/**
 * @작성자:	kbetter3
 * @작성일:	Dec 2, 2019
 * @이메일:	kbetter3@gmail.com
 * 
 * 결산메뉴 공통 검색 폼
 */
@Alias("menu17SearchForm")
public class Menu17SearchForm {
	private PaginationUtil pagination;

	public PaginationUtil getPagination() {
		return pagination;
	}

	public void setPagination(PaginationUtil pagination) {
		this.pagination = pagination;
	}
}
