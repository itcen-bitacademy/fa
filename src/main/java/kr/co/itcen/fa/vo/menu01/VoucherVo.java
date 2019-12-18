package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 임성주
 * 전표관리
 *
 */

@Alias("1vouchervo")
public class VoucherVo {
	private Long no; 				 // 번호
	private String regDate; 		 // 전표일자
	private String regDate2; 		 // 전표일자
	private String insertTeam; 		 // 등록팀
	private String insertUserid;	 // 등록자
	private String insertDay;		 // 등록일
	private String updateUserid;	 // 수정자
	private String updateDay;		 // 수정일
	private Boolean useYn;			 // 사용여부
	private String voucherUse; 		 // 전표사용목적
	private String systemCode; 		 // 시스템번호
	private String cardNo;		 	 // 카드번호
	private String cardUser;		 // 카드사용자
	private String depositNo; 		 // 계좌번호
	private String depositHost;	 	 // 예금주
	private String bankCode;		 // 은행코드
	private String bankName;		 // 은행명
	private String customerNo; 		 // 거래처번호
	private String customerName;	 // 거래처명
	private String manageNo; 		 // 증빙코드(세금계산서)
	private Long amount; 		 	 // 금액
	private String amountFlag;   	 // 금액플래그
	private Long accountNo; 	 	 // 계정과목코드
	private String accountName;		 // 계정과목명
	private Long mappingNo;			 // 매핑번호
	private Long groupNo;		 	 // 그룹번호
	private int orderNo;		 	 // 순번
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegDate2() {
		return regDate2;
	}
	public void setRegDate2(String regDate2) {
		this.regDate2 = regDate2;
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
	public Boolean getUseYn() {
		return useYn;
	}
	public void setUseYn(Boolean useYn) {
		this.useYn = useYn;
	}
	public String getVoucherUse() {
		return voucherUse;
	}
	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
	}
	public String getSystemCode() {
		return systemCode;
	}
	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
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
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getAmountFlag() {
		return amountFlag;
	}
	public void setAmountFlag(String amountFlag) {
		this.amountFlag = amountFlag;
	}
	public Long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public Long getMappingNo() {
		return mappingNo;
	}
	public void setMappingNo(Long mappingNo) {
		this.mappingNo = mappingNo;
	}
	public Long getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(Long groupNo) {
		this.groupNo = groupNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	@Override
	public String toString() {
		return "VoucherVo [no=" + no + ", regDate=" + regDate + ", regDate2=" + regDate2 + ", insertTeam=" + insertTeam
				+ ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid=" + updateUserid
				+ ", updateDay=" + updateDay + ", useYn=" + useYn + ", voucherUse=" + voucherUse + ", systemCode="
				+ systemCode + ", cardNo=" + cardNo + ", cardUser=" + cardUser + ", depositNo=" + depositNo
				+ ", depositHost=" + depositHost + ", bankCode=" + bankCode + ", bankName=" + bankName + ", customerNo="
				+ customerNo + ", customerName=" + customerName + ", manageNo=" + manageNo + ", amount=" + amount
				+ ", amountFlag=" + amountFlag + ", accountNo=" + accountNo + ", accountName=" + accountName
				+ ", mappingNo=" + mappingNo + ", groupNo=" + groupNo + ", orderNo=" + orderNo + "]";
	}
	
	
	
	
}
