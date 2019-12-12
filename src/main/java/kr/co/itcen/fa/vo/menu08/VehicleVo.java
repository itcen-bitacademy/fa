package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;

@Alias("vehicle08vo")
public class VehicleVo {

	private String id;
	private String customerNo; //거래처 코드
	private String customerName; //거래처 명
	private String managerName; //거래처 담당자
	private String taxbillNo; 
	private long voucherNo;
	private String sectionNo;
	private String classification;
	private int staffNo; //직급번호
	private String staffName; //직급명
	private String ownerName;
	private String wideAddress;
	private String cityAddress;
	private String detailAddress;
	private int publicValue;
	private int regTax;
	private int acqTax;
	private int etcCost;
	private String payDate; //납부한 날
	private String dueDate; //납부예정일
	private int deposit; //보증금
	private String depositDate; //보증금 납부일자
	private int monthlyFee; //월사용료
	private String feeDate; //사용료납부일
	private String taxKind; //과세/영세구분
	private String flag;
	private String insertUserId;
	private String insertDay;
	private String updateUserId;
	private String updateDay;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getTaxbillNo() {
		return taxbillNo;
	}
	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}
	public long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getSectionNo() {
		return sectionNo;
	}
	public void setSectionNo(String sectionNo) {
		this.sectionNo = sectionNo;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public int getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getWideAddress() {
		return wideAddress;
	}
	public void setWideAddress(String wideAddress) {
		this.wideAddress = wideAddress;
	}
	public String getCityAddress() {
		return cityAddress;
	}
	public void setCityAddress(String cityAddress) {
		this.cityAddress = cityAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public int getPublicValue() {
		return publicValue;
	}
	public void setPublicValue(int publicValue) {
		this.publicValue = publicValue;
	}
	public int getRegTax() {
		return regTax;
	}
	public void setRegTax(int regTax) {
		this.regTax = regTax;
	}
	public int getAcqTax() {
		return acqTax;
	}
	public void setAcqTax(int acqTax) {
		this.acqTax = acqTax;
	}
	public int getEtcCost() {
		return etcCost;
	}
	public void setEtcCost(int etcCost) {
		this.etcCost = etcCost;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public String getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(String depositDate) {
		this.depositDate = depositDate;
	}
	public int getMonthlyFee() {
		return monthlyFee;
	}
	public void setMonthlyFee(int monthlyFee) {
		this.monthlyFee = monthlyFee;
	}
	public String getFeeDate() {
		return feeDate;
	}
	public void setFeeDate(String feeDate) {
		this.feeDate = feeDate;
	}
	public String getTaxKind() {
		return taxKind;
	}
	public void setTaxKind(String taxKind) {
		this.taxKind = taxKind;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getInsertUserId() {
		return insertUserId;
	}
	public void setInsertUserId(String insertUserId) {
		this.insertUserId = insertUserId;
	}
	public String getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(String insertDay) {
		this.insertDay = insertDay;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getUpdateDay() {
		return updateDay;
	}
	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}
	
	
	@Override
	public String toString() {
		return "VehicleVo [id=" + id + ", customerNo=" + customerNo + ", customerName=" + customerName
				+ ", managerName=" + managerName + ", taxbillNo=" + taxbillNo + ", voucherNo=" + voucherNo
				+ ", sectionNo=" + sectionNo + ", classification=" + classification + ", staffNo=" + staffNo
				+ ", staffName=" + staffName + ", ownerName=" + ownerName + ", wideAddress=" + wideAddress
				+ ", cityAddress=" + cityAddress + ", detailAddress=" + detailAddress + ", publicValue=" + publicValue
				+ ", regTax=" + regTax + ", acqTax=" + acqTax + ", etcCost=" + etcCost + ", dueDate=" + dueDate
				+ ", payDate=" + payDate + ", deposit=" + deposit + ", depositDate=" + depositDate + ", monthlyFee="
				+ monthlyFee + ", feeDate=" + feeDate + ", taxKind=" + taxKind + ", flag=" + flag + ", insertUserId="
				+ insertUserId + ", insertDay=" + insertDay + ", updateUserId=" + updateUserId + ", updateDay="
				+ updateDay + "]";
	}

	
}
