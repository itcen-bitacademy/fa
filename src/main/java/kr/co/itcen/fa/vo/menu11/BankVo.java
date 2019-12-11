package kr.co.itcen.fa.vo.menu11;

import javax.validation.constraints.Pattern;

import org.apache.ibatis.type.Alias;

@Alias("bankvo")
public class BankVo {
	
	
	private String code; //은행 코드
	
	private String name; //은행명 
	private String store; //점포명
	private String dealDate; //거래일자
	private String phone; //전화번호
	private String fax; //팩스번호
	private String post; //우편번호
	
	private String address; //주소
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	
	private String mgr; //담당자
	private String mgrPhone; //담당자 전화번호
	private String mgrEmail; //담당자 이메일 
	private String deleteFlag; //삭제여부
	private String insertId; //등록자
	private String insertDate; //등록일자
	private String updateId; //수정자
	private String updateDate; //수정일자
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getMgr() {
		return mgr;
	}
	public void setMgr(String mgr) {
		this.mgr = mgr;
	}
	public String getMgrPhone() {
		return mgrPhone;
	}
	public void setMgrPhone(String mgrPhone) {
		this.mgrPhone = mgrPhone;
	}
	public String getMgrEmail() {
		return mgrEmail;
	}
	public void setMgrEmail(String mgrEmail) {
		this.mgrEmail = mgrEmail;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public String getInsertId() {
		return insertId;
	}
	public void setInsertId(String insertId) {
		this.insertId = insertId;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "BankVo [code=" + code + ", name=" + name + ", store=" + store + ", dealDate=" + dealDate + ", phone="
				+ phone + ", fax=" + fax + ", post=" + post + ", address=" + address + ", roadAddress=" + roadAddress
				+ ", jibunAddress=" + jibunAddress + ", detailAddress=" + detailAddress + ", mgr=" + mgr + ", mgrPhone="
				+ mgrPhone + ", mgrEmail=" + mgrEmail + ", deleteFlag=" + deleteFlag + ", insertId=" + insertId
				+ ", insertDate=" + insertDate + ", updateId=" + updateId + ", updateDate=" + updateDate + "]";
	}
	
		
}
