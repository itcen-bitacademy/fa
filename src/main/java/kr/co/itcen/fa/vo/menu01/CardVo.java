package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */


@Alias("1cardvo")
public class CardVo {
	private String cardNo;			// 카드번호
	private String validity;		// 유효기간
	private boolean transportation;	// 교통카드 유무
	private int limitation;			// 한도
	private String cvc;				// cvc
	private String issuer;			// 발급자
	private String user;			// 사용자
	private String company;			// 카드회사
	private boolean abroad;			// 해외사용 여부
	private String password;		// 비밀번호
	private String depositNo; 		// 계좌번호
	private String insertUserId;
	private String insertDay;
	private String updateUserId;
	private String updateDay;
	private String deleteFlag;
	
	private String depositHost; 
	private String bankCode;
	private String bankName;
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getValidity() {
		return validity;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	public boolean isTransportation() {
		return transportation;
	}
	public void setTransportation(boolean transportation) {
		this.transportation = transportation;
	}
	public int getLimitation() {
		return limitation;
	}
	public void setLimitation(int limitation) {
		this.limitation = limitation;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public boolean isAbroad() {
		return abroad;
	}
	public void setAbroad(boolean abroad) {
		this.abroad = abroad;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDepositNo() {
		return depositNo;
	}
	public void setDepositNo(String depositNo) {
		this.depositNo = depositNo;
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
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
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
	@Override
	public String toString() {
		return "CardVo [cardNo=" + cardNo + ", validity=" + validity + ", transportation=" + transportation
				+ ", limitation=" + limitation + ", cvc=" + cvc + ", issuer=" + issuer + ", user=" + user + ", company="
				+ company + ", abroad=" + abroad + ", password=" + password + ", depositNo=" + depositNo
				+ ", insertUserId=" + insertUserId + ", insertDay=" + insertDay + ", updateUserId=" + updateUserId
				+ ", updateDay=" + updateDay + ", deleteFlag=" + deleteFlag + ", depositHost=" + depositHost
				+ ", bankCode=" + bankCode + ", bankName=" + bankName + "]";
	}
	
}


