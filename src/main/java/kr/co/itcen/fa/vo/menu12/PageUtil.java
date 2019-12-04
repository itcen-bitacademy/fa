package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

import kr.co.itcen.fa.util.PaginationUtil;

@Alias("pageutil")
public class PageUtil {
	private PaginationUtil pagination;

	public PaginationUtil getPagination() {
		return pagination;
	}
	public void setPagination(PaginationUtil pagination) {
		this.pagination = pagination;
	}
	
}
