package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;

import kr.co.itcen.fa.util.PaginationUtil;

@Alias("intangibleAssetsVo")
public class IntangibleAssetsVo {

	private String id;
	private String customerNo;
	private String customerName;
	private String customerManager;
	private String taxbillNo;
	private Long voucherNo;
	private String sectionNo;
	private String code;
	private String classification;
	private String name;
	private Long copyCount;
	private String purpose;
	private String address;
	private String user;
	private String acqPrice;
	private String addiFee;
	private String payDate;
	private String taxKind;
	private String flag;
	private String insertUserId;
	private String insertDay;
	private String updateUserId;
	private String updateDay;
	
	// 삭제포함 버튼
	private String isChecked;
	
	// 페이징
	private int page = 1;
	private PaginationUtil pagination;

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

	public Long getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(Long voucherNo) {
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

	public Long getCopyCount() {
		return copyCount;
	}

	public void setCopyCount(Long copyCount) {
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

	public String getAcqPrice() {
		return acqPrice;
	}

	public void setAcqPrice(String acqPrice) {
		this.acqPrice = acqPrice;
	}

	public String getAddiFee() {
		return addiFee;
	}

	public void setAddiFee(String addiFee) {
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
	
	// 삭제포함 버튼
	public String getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}

	// 페이징
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PaginationUtil getPagination() {
		return pagination;
	}

	public void setPagination(PaginationUtil pagination) {
		this.pagination = pagination;
	}

	@Override
	public String toString() {
		return "IntangibleAssetsVo [id=" + id + ", customerNo=" + customerNo + ", customerName=" + customerName
				+ ", customerManager=" + customerManager + ", taxbillNo=" + taxbillNo + ", voucherNo=" + voucherNo
				+ ", sectionNo=" + sectionNo + ", code=" + code + ", classification=" + classification + ", name="
				+ name + ", copyCount=" + copyCount + ", purpose=" + purpose + ", address=" + address + ", user=" + user
				+ ", acqPrice=" + acqPrice + ", addiFee=" + addiFee + ", payDate=" + payDate + ", taxKind=" + taxKind
				+ ", flag=" + flag + ", insertUserId=" + insertUserId + ", insertDay=" + insertDay + ", updateUserId="
				+ updateUserId + ", updateDay=" + updateDay + "]";
	}

}
