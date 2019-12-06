package kr.co.itcen.fa.vo.menu02;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 윤종진 
 * 매입관리 테이블
 *
 */




@Alias("purchasemanagement06vo")
public class PurchasemanagementVo {
	
		public PurchasemanagementVo() {
		}
		
		public PurchasemanagementVo(PurchasemanagementVo vo){
			this.no = vo.getNo();
			this.purchaseDate = vo.getPurchaseDate();		
			this.customerCode = vo.getCustomerCode();
			this.customerName = vo.getCustomerName();
			this.purchaseManager = vo.getPurchaseManager();
			this.receiptDate = vo.getReceiptDate();
			this.releaseDate = vo.getReleaseDate();
			this.taxbillNo = vo.getTaxbillNo();
			this.taxType = vo.getTaxType();	
			}
	
	private String no;					//매입번호
	private Long number;				//품목순번
	private String purchaseDate;		//매입일자
	private String purchaseManager;		//거래처담당자
	private String customerCode;		//거래처코드
	private String customerName;		//거래처명
	private String sectionCode;			//대분류코드
	private String sectionName;			//대분류명
	private String itemCode;			//품목코드
	private String itemName;			//품목명
	private int quantity;				//수량
	private Long supplyValue;			//공급가액
	private Long taxValue;				//부가세
	private Long totalPrice;			//합계금액
	private String taxType;				//과세구분
	private String taxbillNo;			//세금계산서번호
	private String receiptDate;			//입고일자
	private String releaseDate;			//출고일자
	private String deleteFlag;			//삭제여부
	private String insertUserid;		//입력자
	private String insertDay;			//입력날짜
	private String updateUserid;		//수정자
	private String updateDay;			//수정날짜
	private String orderStd;			//정렬기준
	private int page;					//페이지
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getOrderStd() {
		return orderStd;
	}

	public void setOrderStd(String orderStd) {
		this.orderStd = orderStd;
	}

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Long getNumber() {
		return number;
	}
	public void setNumber(Long number) {
		this.number = number;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getPurchaseManager() {
		return purchaseManager;
	}
	public void setPurchaseManager(String purchaseManager) {
		this.purchaseManager = purchaseManager;
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
	public Long getTaxValue() {
		return taxValue;
	}
	public void setTaxValue(Long taxValue) {
		this.taxValue = taxValue;
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
	public String getTaxbillNo() {
		return taxbillNo;
	}
	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}
	public String getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
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
	public String getInsertUserid() {
		return insertUserid;
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
		return "PurchasemanagementVo [no=" + no + ", number=" + number + ", purchaseDate=" + purchaseDate
				+ ", purchaseManager=" + purchaseManager + ", customerCode=" + customerCode + ", customerName="
				+ customerName + ", sectionCode=" + sectionCode + ", sectionName=" + sectionName + ", itemCode="
				+ itemCode + ", itemName=" + itemName + ", quantity=" + quantity + ", supplyValue=" + supplyValue
				+ ", taxValue=" + taxValue + ", totalPrice=" + totalPrice + ", taxType=" + taxType + ", taxbillNo="
				+ taxbillNo + ", receiptDate=" + receiptDate + ", releaseDate=" + releaseDate + ", deleteFlag="
				+ deleteFlag + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + ", orderStd=" + orderStd + ", page=" + page + "]";
	}

	
	
	
	
	
}
