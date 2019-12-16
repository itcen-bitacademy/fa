package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 안태영 매출세금계산서현황조회
 *
 */

@Alias("taxbillsearch12vo")
public class TaxbillSearchVo {

	private String startDate; // 검색 시작일
	private String endDate; // 검색 종료일
	private String customerCode; // 거래처코드
	private String customerName; // 거래처명
	private String taxbillNo; // 승인번호 - 국세청 - 세금계산서 번호
	private String itemCode; // 품목코드
	private String itemName; // 품목명
	private String taxType; // 과세구분
	private String orderData; // 정렬기준
	private long totalSupplyValue; // 총공급가액
	private String writeDate; // 발행일

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public long getTotalSupplyValue() {
		return totalSupplyValue;
	}

	public void setTotalSupplyValue(long totalSupplyValue) {
		this.totalSupplyValue = totalSupplyValue;
	}

	public String getOrderData() {
		return orderData;
	}

	public void setOrderData(String orderData) {
		this.orderData = orderData;
	}

	public String getTaxType() {
		return taxType;
	}

	public void setTaxType(String taxType) {
		this.taxType = taxType;
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

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getTaxbillNo() {
		return taxbillNo;
	}

	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Override
	public String toString() {
		return "TaxbillSearchVo [startDate=" + startDate + ", endDate=" + endDate + ", customerCode=" + customerCode
				+ ", customerName=" + customerName + ", taxbillNo=" + taxbillNo + ", itemCode=" + itemCode
				+ ", itemName=" + itemName + ", taxType=" + taxType + ", orderData=" + orderData + "]";
	}

}
