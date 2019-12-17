package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 이종윤 계정거래처원장
 *
 */

@Alias("1accountcustomerledgervo")
public class AccountCustomerLedgerVo {
	private Long voucherNo;// 전표번호
	private int voucherOrderNo;// 전표 순번
	private String regDate;// 전표입력일자
	private String accountName;// 계정명
	private String accountNo;// 계정코드
	private String customerNo;// 사업자등록번호
	private String customerName;
	private String insertTeam;// 전표사용팀
	private String insertUserid;// 전표사용자
	private String voucherUse;// 적요
	private String cardNo;// 카드번호
	private String cardUser;// 카드사용자
	private String bankName;// 은행명
	private String depositNo;// 계좌번호
	private String depositHost;// 예금주
	private String amountFlag;// 차대구분 플래그
	private Long amount;// 금액
	private String datepicker1;// 시작일
	private String datepicker2;// 종료일
	private String store;//
	public Long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(Long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public int getVoucherOrderNo() {
		return voucherOrderNo;
	}
	public void setVoucherOrderNo(int voucherOrderNo) {
		this.voucherOrderNo = voucherOrderNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
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
	public String getVoucherUse() {
		return voucherUse;
	}
	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
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
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
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
	public String getAmountFlag() {
		return amountFlag;
	}
	public void setAmountFlag(String amountFlag) {
		this.amountFlag = amountFlag;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getDatepicker1() {
		return datepicker1;
	}
	public void setDatepicker1(String datepicker1) {
		this.datepicker1 = datepicker1;
	}
	public String getDatepicker2() {
		return datepicker2;
	}
	public void setDatepicker2(String datepicker2) {
		this.datepicker2 = datepicker2;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	@Override
	public String toString() {
		return "AccountCustomerLedgerVo [voucherNo=" + voucherNo + ", voucherOrderNo=" + voucherOrderNo + ", regDate="
				+ regDate + ", accountName=" + accountName + ", accountNo=" + accountNo + ", customerNo=" + customerNo
				+ ", customerName=" + customerName + ", insertTeam=" + insertTeam + ", insertUserid=" + insertUserid
				+ ", voucherUse=" + voucherUse + ", cardNo=" + cardNo + ", cardUser=" + cardUser + ", bankName="
				+ bankName + ", depositNo=" + depositNo + ", depositHost=" + depositHost + ", amountFlag=" + amountFlag
				+ ", amount=" + amount + ", datepicker1=" + datepicker1 + ", datepicker2=" + datepicker2 + ", store="
				+ store + "]";
	}
	
}
