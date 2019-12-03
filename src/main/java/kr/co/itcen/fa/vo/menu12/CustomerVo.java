package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

@Alias("salescustomervo")
public class CustomerVo {
	private String no;
	private String preNo;
	private String name;
	private String ceo;
	private String corporationNo;
	private String zipCode;
	private String address;
	private String detailAddress;
	private String addressAll;
	private String phone;
	private String conditions;
	private String item;
	private String openDate;
	private String jurisdictionOffice;
	private String managerName;
	private String managerEmail;
	private String depositNo;
	private String depositHost;
	private String bankCode;
	private String bankName;
	private String deleteFlag;
	private String insertUserid;
	private String insertDay;
	private String updateUserid;
	private String updateDay;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPreNo() {
		return preNo;
	}
	public void setPreNo(String preNo) {
		this.preNo = preNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getCorporationNo() {
		return corporationNo;
	}
	public void setCorporationNo(String corporationNo) {
		this.corporationNo = corporationNo;
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
	public String getAddressAll() {
		return addressAll;
	}
	public void setAddressAll(String addressAll) {
		this.addressAll = addressAll;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getConditions() {
		return conditions;
	}
	public void setConditions(String conditions) {
		this.conditions = conditions;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getJurisdictionOffice() {
		return jurisdictionOffice;
	}
	public void setJurisdictionOffice(String jurisdictionOffice) {
		this.jurisdictionOffice = jurisdictionOffice;
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
	public String getDepositNo() {
		return depositNo;
	}
	public void setDepositNo(String depositNo) {
		this.depositNo = depositNo;
	}
	public String getDepositHost() {
		return depositHost;
	}
	public void setDepositHost(String depositHost) {
		this.depositHost = depositHost;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
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
		return "CustomerVo [no=" + no + ", name=" + name + ", ceo=" + ceo + ", corporationNo=" + corporationNo
				+ ", zipCode=" + zipCode + ", address=" + address + ", detailAddress=" + detailAddress + ", addressAll="
				+ addressAll + ", phone=" + phone + ", conditions=" + conditions + ", item=" + item + ", openDate="
				+ openDate + ", jurisdictionOffice=" + jurisdictionOffice + ", managerName=" + managerName
				+ ", managerEmail=" + managerEmail + ", depositNo=" + depositNo + ", depositHost=" + depositHost
				+ ", bankCode=" + bankCode + ", bankName=" + bankName + ", deleteFlag=" + deleteFlag + ", insertUserid="
				+ insertUserid + ", insertDay=" + insertDay + ", updateUserid=" + updateUserid + ", updateDay="
				+ updateDay + "]";
	}
	
	
}
