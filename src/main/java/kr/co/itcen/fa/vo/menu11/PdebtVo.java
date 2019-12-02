package kr.co.itcen.fa.vo.menu11;

import java.time.LocalDate;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("pdebtvo")
public class PdebtVo {
	private Long no; // 사채번호
	private String code; // 사채코드
	private String name; // 차입금명(사채명)
	private int debtAmount; // 차입금액
	private int repayBal; // 상환잔액 - 초기값으로 차입금액 삽입
	private String repayWay; // 상환방법
	private String debtExpDate; // 차입 - 만기일자 한번에 받기
	private Date debtDate; // 차입일자
	private Date expDate; // 만기일자
	private int intRate; // 이율
	private String intPayWay; // 이자지급방식
	private int intAmount; // 이자금액
	private String mgr; // 차입금담당자
	private String mgrCall; // 차입금담당자전화
	private String dangerCode; // 위험등급
	private String dangerName; // 위험등급명
	private String majorCode;// 차입금대분류
	private int bankCode; // 은행코드
	private String depositNo; // 계좌번호
	private String accountNo; // 계정코드
	private int voucherNo; // 전표번호
	private String deleteFlag; // 삭제여부
	private String insertId; // 등록자
	private Date insertDate; // 등록일
	private int updateId; // 수정자
	private Date updateDate; // 수정일

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

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

	public int getDebtAmount() {
		return debtAmount;
	}

	public void setDebtAmount(int debtAmount) {
		this.debtAmount = debtAmount;
	}

	public int getRepayBal() {
		return repayBal;
	}

	public void setRepayBal(int repayBal) {
		this.repayBal = repayBal;
	}

	public String getRepayWay() {
		return repayWay;
	}

	public void setRepayWay(String repayWay) {
		this.repayWay = repayWay;
	}

	public String getDebtExpDate() {
		return debtExpDate;
	}

	public void setDebtExpDate(String debtExpDate) {
		this.debtExpDate = debtExpDate;
	}

	public Date getDebtDate() {
		return debtDate;
	}

	public void setDebtDate(Date debtDate) {
		this.debtDate = debtDate;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public int getIntRate() {
		return intRate;
	}

	public void setIntRate(int intRate) {
		this.intRate = intRate;
	}

	public String getIntPayWay() {
		return intPayWay;
	}

	public void setIntPayWay(String intPayWay) {
		this.intPayWay = intPayWay;
	}

	public int getIntAmount() {
		return intAmount;
	}

	public void setIntAmount(int intAmount) {
		this.intAmount = intAmount;
	}

	public String getMgr() {
		return mgr;
	}

	public void setMgr(String mgr) {
		this.mgr = mgr;
	}

	public String getMgrCall() {
		return mgrCall;
	}

	public void setMgrCall(String mgrCall) {
		this.mgrCall = mgrCall;
	}

	public String getDangerCode() {
		return dangerCode;
	}

	public void setDangerCode(String dangerCode) {
		this.dangerCode = dangerCode;
	}

	public String getDangerName() {
		return dangerName;
	}

	public void setDangerName(String dangerName) {
		this.dangerName = dangerName;
	}

	public String getMajorCode() {
		return majorCode;
	}

	public void setMajorCode(String majorCode) {
		this.majorCode = majorCode;
	}

	public int getBankCode() {
		return bankCode;
	}

	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}

	public String getDepositNo() {
		return depositNo;
	}

	public void setDepositNo(String depositNo) {
		this.depositNo = depositNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public int getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(int voucherNo) {
		this.voucherNo = voucherNo;
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

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public int getUpdateId() {
		return updateId;
	}

	public void setUpdateId(int updateId) {
		this.updateId = updateId;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "PdebtVo [no=" + no + ", code=" + code + ", name=" + name + ", debtAmount=" + debtAmount + ", repayBal="
				+ repayBal + ", repayWay=" + repayWay + ", debtExpDate=" + debtExpDate + ", debtDate=" + debtDate
				+ ", expDate=" + expDate + ", intRate=" + intRate + ", intPayWay=" + intPayWay + ", intAmount="
				+ intAmount + ", mgr=" + mgr + ", mgrCall=" + mgrCall + ", dangerCode=" + dangerCode + ", dangerName="
				+ dangerName + ", majorCode=" + majorCode + ", bankCode=" + bankCode + ", depositNo=" + depositNo
				+ ", accountNo=" + accountNo + ", voucherNo=" + voucherNo + ", deleteFlag=" + deleteFlag + ", insertId="
				+ insertId + ", insertDate=" + insertDate + ", updateId=" + updateId + ", updateDate=" + updateDate
				+ "]";
	}

}
