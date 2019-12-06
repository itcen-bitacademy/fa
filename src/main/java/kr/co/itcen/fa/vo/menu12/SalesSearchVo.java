package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

import kr.co.itcen.fa.util.PaginationUtil;

@Alias("serchvo")
public class SalesSearchVo {
	private String salesNo; // 매출번호
	private String customerCode; // 거래처코드
	private String insertUserid; // 입력자
	private String itemCode; // 품목코드
	private String deleteFlag; // 삭제여부
	private String startDate; // 검색 시작일
	private String endDate; //검색 종료일
	private String orderData; // 정렬기준
	private boolean searchFlag; // 검색 유무
	private PaginationUtil pagination; // 페이징
	private int currentPage; // 현재 페이지
	
	
	public String getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(String salesNo) {
		this.salesNo = salesNo;
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getInsertUserid() {
		return insertUserid;
	}
	public void setInsertUserid(String insertUserid) {
		this.insertUserid = insertUserid;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getOrderData() {
		return orderData;
	}
	public void setOrderData(String orderData) {
		this.orderData = orderData;
	}
	public PaginationUtil getPagination() {
		return pagination;
	}
	public void setPagination(PaginationUtil pagination) {
		this.pagination = pagination;
	}
	public boolean isSearchFlag() {
		return searchFlag;
	}
	public void setSearchFlag(boolean searchFlag) {
		this.searchFlag = searchFlag;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	@Override
	public String toString() {
		return "SalesSearchVo [salesNo=" + salesNo + ", customerCode=" + customerCode + ", insertUserid=" + insertUserid
				+ ", itemCode=" + itemCode + ", deleteFlag=" + deleteFlag + ", startDate=" + startDate + ", endDate="
				+ endDate + ", orderData=" + orderData + ", searchFlag=" + searchFlag + ", pagination=" + pagination
				+ ", currentPage=" + currentPage + "]";
	}
		
	
}
