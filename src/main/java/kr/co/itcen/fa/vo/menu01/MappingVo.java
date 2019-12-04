package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 임성주
 * 매핑관리
 *
 */

@Alias("1mappingvo")
public class MappingVo {
	private Long no; 			 // 매핑번호
	private String systemCode; 	 // 시스템코드
	private String voucherUse;   // 전표사용목적
	private String insertTeam;   // 등록팀
	private String insertUserid; // 등록자
	private String insertDay; 	 // 등록일
	private String updateUserid; // 수정자
	private String updateDay; 	 // 수정일
	private boolean useYn;		 // 사용여부
	private Long voucherNo; 	 // 전표번호
	private String cardNo;	 	 // 카드번호
	private String cardUser;	 // 카드사용자
	private String depositNo; 	 // 계좌번호
	private String depositHost;  // 예금주
	private String customerNo;	 // 거래처번호
	private String customerName; // 거래처명
	private String bankCode;	 // 은행코드
	private String bankName;	 // 은행명
	private String manageNo; 	 // 증빙코드(세금계산서)
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getSystemCode() {
		return systemCode;
	}
	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}
	public String getVoucherUse() {
		return voucherUse;
	}
	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
	}
	public String getInsertTeam() {
		return insertTeam;
	}
	public void setInsertTeam(String insertTeam) {
		this.insertTeam = insertTeam;
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
	public boolean isUseYn() {
		return useYn;
	}
	public void setUseYn(boolean useYn) {
		this.useYn = useYn;
	}
	public Long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(Long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardUser() {
		return cardUser;
	}
	public void setCardUser(String cardUser) {
		this.cardUser = cardUser;
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
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	
	@Override
	public String toString() {
		return "MappingVo [no=" + no + ", systemCode=" + systemCode + ", voucherUse=" + voucherUse + ", insertTeam="
				+ insertTeam + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + ", useYn=" + useYn + ", voucherNo=" + voucherNo
				+ ", cardNo=" + cardNo + ", cardUser=" + cardUser + ", depositNo=" + depositNo + ", depositHost="
				+ depositHost + ", customerNo=" + customerNo + ", customerName=" + customerName + ", bankCode="
				+ bankCode + ", bankName=" + bankName + ", manageNo=" + manageNo + "]";
	}
	
}
