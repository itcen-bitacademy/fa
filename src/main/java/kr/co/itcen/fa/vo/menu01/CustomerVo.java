package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 이종윤
 * 거래처관리
 *
 */

@Alias("1customervo")
public class CustomerVo {
	private String no;
	private String name;
	private String ceo;
	private String address;
	private String detailAddress;
	private String conditions;
	private String item;
	private String corporationNo;
	private String openDate;
	private String jurisdictionOffice;
	private String phone;
	private String managerName;
	private String managerEmail;
	private String depositNo;
	private String deleteFlag;
	private String insertUserid;
	private String insertDay;
	private String updateUserid;
	private String updateDay;
	private String customerDiv;
	private String assetsFlag;

	public String getAssetsFlag() {
		return assetsFlag;
	}

	public void setAssetsFlag(String assetsFlag) {
		this.assetsFlag = assetsFlag;
	}

	public String getCustomerDiv() {
		return customerDiv;
	}

	public void setCustomerDiv(String customerDiv) {
		this.customerDiv = customerDiv;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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

	public String getCorporationNo() {
		return corporationNo;
	}

	public void setCorporationNo(String corporationNo) {
		this.corporationNo = corporationNo;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		return "CustomerVo [no=" + no + ", name=" + name + ", ceo=" + ceo + ", address=" + address + ", detailAddress="
				+ detailAddress + ", conditions=" + conditions + ", item=" + item + ", corporationNo=" + corporationNo
				+ ", openDate=" + openDate + ", jurisdictionOffice=" + jurisdictionOffice + ", phone=" + phone
				+ ", managerName=" + managerName + ", managerEmail=" + managerEmail + ", depositNo=" + depositNo
				+ ", deleteFlag=" + deleteFlag + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay
				+ ", updateUserid=" + updateUserid + ", updateDay=" + updateDay + ", customerDiv=" + customerDiv
				+ ", assetsFlag=" + assetsFlag + "]";
	}

}
