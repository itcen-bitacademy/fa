package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 안태영 - 매출세금계산서 Vo 객체 - DB 테이블명 : tb_sell_taxbill
 * 
 **/
@Alias("selltaxbill12vo")
public class SellTaxbillVo { // 논리명

	// DB 속성
	private long idx; // 번호 - pk - Auto Increment
	private String taxbillNo; // 승인번호 - 국세청 - 세금계산서 번호
	private String salesNo; // 관리번호 - 매출번호
	private String customerCode; // 거래처코드
	private String customerName; // 거래처명
	private String ceo; // 대표자
	private String zipCode; // 우편번호
	private String address; // 주소
	private String detailAddress; // 상세주소
	private String managerName; // 거래처 담당자 이름
	private String managerEmail; // 거래처 담당자 메일
	private long totalQuantity; // 총수량
	private long totalSupplyValue; // 총공급가액
	private long totalTaxValue; // 총세액
	private String writeDate; // 발행일
	private String taxType; // 과세구분
	private String depositNo; // 계좌번호
	private String releaseDate; // 출고일
	private String depositHost; // 예금주
	private String bankName; // 은행명
	private String bankCode; // 은행코드
	private String deleteFlag; // 삭제
	private String voucherNo; // 전표번호
	
	private String voucherUse; // 사용목적
	private String amountFlag; // 금액 플래그 - 차변 / 대변
	private long accountNo; // 계정코드
	
	private String insertUserid; // 입력자
	private String insertDay; // 입력일
	private String updateUserid; // 수정자
	private String updateDay; // 수정일

	//// Vo 객체로써 사용하기 위해 필요한 인스턴스 변수
	private String itemCode; // 품목코드
	private String itemName; // 품목명
	private long quantity; // 수량
	private long supplyValue; // 공급가액
	private long taxValue; // 부가세

	public long getIdx() {
		return idx;
	}

	public void setIdx(long idx) {
		this.idx = idx;
	}

	public String getTaxbillNo() {
		return taxbillNo;
	}

	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}

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

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}

	public long getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(long totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public long getTotalSupplyValue() {
		return totalSupplyValue;
	}

	public void setTotalSupplyValue(long totalSupplyValue) {
		this.totalSupplyValue = totalSupplyValue;
	}

	public long getTotalTaxValue() {
		return totalTaxValue;
	}

	public void setTotalTaxValue(long totalTaxValue) {
		this.totalTaxValue = totalTaxValue;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getTaxType() {
		return taxType;
	}

	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}

	public String getDepositNo() {
		return depositNo;
	}

	public void setDepositNo(String depositNo) {
		this.depositNo = depositNo;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getDepositHost() {
		return depositHost;
	}

	public void setDepositHost(String depositHost) {
		this.depositHost = depositHost;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
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

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	public long getSupplyValue() {
		return supplyValue;
	}

	public void setSupplyValue(long supplyValue) {
		this.supplyValue = supplyValue;
	}

	public long getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(long taxValue) {
		this.taxValue = taxValue;
	}

	public String getVoucherUse() {
		return voucherUse;
	}

	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
	}

	public String getAmountFlag() {
		return amountFlag;
	}

	public void setAmountFlag(String amountFlag) {
		this.amountFlag = amountFlag;
	}

	public long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}

	@Override
	public String toString() {
		return "SellTaxbillVo [idx=" + idx + ", taxbillNo=" + taxbillNo + ", salesNo=" + salesNo + ", customerCode="
				+ customerCode + ", customerName=" + customerName + ", ceo=" + ceo + ", zipCode=" + zipCode
				+ ", address=" + address + ", detailAddress=" + detailAddress + ", managerName=" + managerName
				+ ", managerEmail=" + managerEmail + ", totalQuantity=" + totalQuantity + ", totalSupplyValue="
				+ totalSupplyValue + ", totalTaxValue=" + totalTaxValue + ", writeDate=" + writeDate + ", taxType="
				+ taxType + ", depositNo=" + depositNo + ", releaseDate=" + releaseDate + ", depositHost=" + depositHost
				+ ", bankName=" + bankName + ", bankCode=" + bankCode + ", deleteFlag=" + deleteFlag + ", voucherNo="
				+ voucherNo + ", voucherUse=" + voucherUse + ", amountFlag=" + amountFlag + ", accountNo=" + accountNo
				+ ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid=" + updateUserid
				+ ", updateDay=" + updateDay + ", itemCode=" + itemCode + ", itemName=" + itemName + ", quantity="
				+ quantity + ", supplyValue=" + supplyValue + ", taxValue=" + taxValue + "]";
	}

}
