package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;

@Alias("intangibleAssetsVo")
public class IntangibleAssetsVo {

	private String id;
	private String customerNo;
	private String customerName;
	private String customerManager;
	private String taxbillNo;
	private String voucherNo;
	private String sectionNo;
	private String code;
	private String classification;
	private String name;
	private int copyCount;
	private String purpose;
	private String address;
	private String user;
	private int acqPrice;
	private int addiFee;
	private String payDate;
	private String taxKind;
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

	public String getCustomerManager() {
		return customerManager;
	}

	public void setCustomerManager(String customerManager) {
		this.customerManager = customerManager;
	}

	public String getTaxbillNo() {
		return taxbillNo;
	}

	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}

	public String getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}

	public String getSectionNo() {
		return sectionNo;
	}

	public void setSectionNo(String sectionNo) {
		this.sectionNo = sectionNo;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCopyCount() {
		return copyCount;
	}

	public void setCopyCount(int copyCount) {
		this.copyCount = copyCount;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getAcqPrice() {
		return acqPrice;
	}

	public void setAcqPrice(int acqPrice) {
		this.acqPrice = acqPrice;
	}

	public int getAddiFee() {
		return addiFee;
	}

	public void setAddiFee(int addiFee) {
		this.addiFee = addiFee;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
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
		return "IntangibleAssetsVo [id=" + id + ", customerNo=" + customerNo + ", customerName="
				+ customerName + ", customerManager=" + customerManager + ", taxbillNo=" + taxbillNo + ", voucherNo="
				+ voucherNo + ", sectionNo=" + sectionNo + ", code=" + code + ", classification=" + classification
				+ ", name=" + name + ", copyCount=" + copyCount + ", purpose=" + purpose + ", address=" + address
				+ ", user=" + user + ", acqPrice=" + acqPrice + ", addiFee=" + addiFee + ", payDate=" + payDate
				+ ", taxKind=" + taxKind + ", flag=" + flag + ", insertUserId=" + insertUserId + ", insertDay="
				+ insertDay + ", updateUserId=" + updateUserId + ", updateDay=" + updateDay + "]";
	}

}
