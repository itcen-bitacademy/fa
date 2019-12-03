package kr.co.itcen.fa.dto;

import java.util.List;

import kr.co.itcen.fa.util.PaginationUtil;

/**
 * @작성자:	kbetter3
 * @작성일:	Dec 2, 2019
 * @이메일:	kbetter3@gmail.com
 * 
 * 통합 데이터 전달 객체
 */
public class DataResult<T> {
	private List<T> datas;
	private T data; 
	
	PaginationUtil pagination;
	
	
	// Constructor
	public DataResult(List<T> datas) {
		this.datas = datas;
	}
	
	public DataResult(T data) {
		this.data = data;
	}
	
	public DataResult() {
	}
	
	// Setter & Getter
	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public PaginationUtil getPagination() {
		return pagination;
	}

	public void setPagination(PaginationUtil pagination) {
		this.pagination = pagination;
	}
}
