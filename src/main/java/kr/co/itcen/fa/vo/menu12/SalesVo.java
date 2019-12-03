package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */

@Alias("salesvo")
public class SalesVo {
	SalesVo() {
	}
	
	// 객체 다중생성을 위한 생성자
	public SalesVo(SalesVo vo){
		this.salesNo = vo.getSalesNo();
		this.salesDate = vo.getSalesDate();		
		this.customerCode = vo.getCustomerCode();
		this.customerName = vo.getCustomerName();
		this.empManager = vo.getEmpManager();
		this.releaseDate = vo.getReleaseDate();
		this.taxbillNo = vo.getTaxbillNo();
	}
	
	private Long idx; // 번호
	private String userId; // 입력자
	private String salesNo; // 매출번호
	private int number; // 품목순번
	private String salesDate; // 매출일자
	private String empManager; // 거래처담당자
	private String customerCode; // 거래처코드
	private String customerName; // 거래처명
	private String sectionCode; // 대분류코드
	private String sectionName; // 대분류명
	private Long itemCode; // 품목코드
	private String itemName; //품목명
	private int quantity; // 수량
	private Long supplyValue; // 공급가액
	private Long taxValue; // 부가세
	private Long totalPrice; // 합계금액
	private String taxType; // 과세구분
	private Long taxbillNo; // 세금계산서번호
	private String releaseDate; // 출고일
	private String deleteFlag; // 삭제여부
	private Long sellPrice; // 출고가
	private String insertUserid; // 입력자
	private String insertDay; // 입력일
	private String updateUserid; // 수정자
	private String updateDay; // 수정일
	
	public Long getIdx() {
		return idx;
	}
	public void setIdx(Long idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(String salesNo) {
		this.salesNo = salesNo;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}
	public String getEmpManager() {
		return empManager;
	}
	public void setEmpManager(String empManager) {
		this.empManager = empManager;
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
	public String getSectionCode() {
		return sectionCode;
	}
	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public Long getItemCode() {
		return itemCode;
	}
	public void setItemCode(Long itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Long getSupplyValue() {
		return supplyValue;
	}
	public void setSupplyValue(Long supplyValue) {
		this.supplyValue = supplyValue;
	}
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	public Long getTaxbillNo() {
		return taxbillNo;
	}
	public void setTaxbillNo(Long taxbillNo) {
		this.taxbillNo = taxbillNo;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public Long getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(Long sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getInsertUserid() {
		return insertUserid;
	}
	public Long getTaxValue() {
		return taxValue;
	}
	public void setTaxValue(Long taxValue) {
		this.taxValue = taxValue;
	}
	public void setInsertUserid(String insertUserid) {
		this.insertUserid = insertUserid;
	}
	public String getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(String insertDay) {
		this.insertDay = insertDay;
	}
	public String getUpdateUserid() {
		return updateUserid;
	}
	public void setUpdateUserid(String updateUserid) {
		this.updateUserid = updateUserid;
	}
	public String getUpdateDay() {
		return updateDay;
	}
	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}
	
	@Override
	public String toString() {
		return "SalesVo [idx=" + idx + ", userId=" + userId + ", salesNo=" + salesNo + ", number=" + number
				+ ", salesDate=" + salesDate + ", empManager=" + empManager + ", customerCode=" + customerCode
				+ ", customerName=" + customerName + ", sectionCode=" + sectionCode + ", sectionName=" + sectionName
				+ ", itemCode=" + itemCode + ", itemName=" + itemName + ", quantity=" + quantity + ", supplyValue="
				+ supplyValue + ", taxValue=" + taxValue + ", totalPrice=" + totalPrice + ", taxType=" + taxType
				+ ", taxbillNo=" + taxbillNo + ", releaseDate=" + releaseDate + ", deleteFlag=" + deleteFlag
				+ ", sellPrice=" + sellPrice + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay
				+ ", updateUserid=" + updateUserid + ", updateDay=" + updateDay + "]";
	}
	
}
