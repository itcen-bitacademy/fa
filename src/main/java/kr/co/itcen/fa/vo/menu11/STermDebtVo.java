package kr.co.itcen.fa.vo.menu11;

import java.util.Date;
import java.util.OptionalInt;

import org.apache.ibatis.type.Alias;

@Alias("stermdebtvo")
public class STermDebtVo {
	private Long no; // 단기차입금번호
	private String code; // 단기차입금코드
	private String name; // 차입금명(사채명)
	private String majorCode; //차입금 대분류
	private Long debtAmount; // 차입금액
	private Long repayBal; // 상환잔액 - 초기값으로 차입금액 삽입
	private String repayWay; // 상환방법
	private String repayCompleFlag; // 상환완료여부
	private String debtExpDate; // 차입 - 만기일자 한번에 받기
	private String debtDate; // 차입일자
	private String expDate; // 만기일자
	private Double intRate; // 이율
	private String intPayWay; // 이자지급방식
	private String mgr; // 차입금담당자
	private String mgrCall; // 차입금담당자전화
	private String deptClassification; // 차입금대분류
	private String bankCode; // 은행코드
	private String bankName;	//은행이름 , 은행코드를 통해 얻어온다
	private String depositNo; // 계좌번호
	private String depositHost;	//예금주
	private Long accountNo = 2180101L; // 계정코드
	private Long voucherNo; // 전표번호
	private String deleteFlag; // 삭제여부
	private String insertId; // 등록자
	private String insertDate; // 등록일
	private String updateId; // 수정자
	private String updateDate; // 수정일
	private String repayDue;
	
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
	public String getMajorCode() {
		return majorCode;
	}
	public void setMajorCode(String majorCode) {
		this.majorCode = majorCode;
	}
	public Long getDebtAmount() {
		return debtAmount;
	}
	public void setDebtAmount(Long debtAmount) {
		this.debtAmount = debtAmount;
	}
	public Long getRepayBal() {
		return repayBal;
	}
	public void setRepayBal(Long repayBal) {
		this.repayBal = repayBal;
	}
	public String getRepayWay() {
		return repayWay;
	}
	public void setRepayWay(String repayWay) {
		this.repayWay = repayWay;
	}
	public String getRepayCompleFlag() {
		return repayCompleFlag;
	}
	public void setRepayCompleFlag(String repayCompleFlag) {
		this.repayCompleFlag = repayCompleFlag;
	}
	public String getDebtExpDate() {
		return debtExpDate;
	}
	public void setDebtExpDate(String debtExpDate) {
		this.debtExpDate = debtExpDate;
	}
	public String getDebtDate() {
		return debtDate;
	}
	public void setDebtDate(String debtDate) {
		this.debtDate = debtDate;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public Double getIntRate() {
		return intRate;
	}
	public void setIntRate(Double intRate) {
		this.intRate = intRate;
	}
	public String getIntPayWay() {
		return intPayWay;
	}
	public void setIntPayWay(String intPayWay) {
		this.intPayWay = intPayWay;
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
	public String getDeptClassification() {
		return deptClassification;
	}
	public void setDeptClassification(String deptClassification) {
		this.deptClassification = deptClassification;
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
	public Long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	public Long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(Long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getInsertId() {
		return insertId;
	}
	public void setInsertId(String insertId) {
		this.insertId = insertId;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	
	public String getRepayDue() {
		return repayDue;
	}
	public void setRepayDue(String repayDue) {
		this.repayDue = repayDue;
	}
	
	@Override
	public String toString() {
		return "STermDebtVo [no=" + no + ", code=" + code + ", name=" + name + ", majorCode=" + majorCode
				+ ", debtAmount=" + debtAmount + ", repayBal=" + repayBal + ", repayWay=" + repayWay
				+ ", repayCompleFlag=" + repayCompleFlag + ", debtExpDate=" + debtExpDate + ", debtDate=" + debtDate
				+ ", expDate=" + expDate + ", intRate=" + intRate + ", intPayWay=" + intPayWay + ", mgr=" + mgr
				+ ", mgrCall=" + mgrCall + ", deptClassification=" + deptClassification + ", bankCode=" + bankCode
				+ ", bankName=" + bankName + ", depositNo=" + depositNo + ", depositHost=" + depositHost
				+ ", accountNo=" + accountNo + ", voucherNo=" + voucherNo + ", deleteFlag=" + deleteFlag + ", insertId="
				+ insertId + ", insertDate=" + insertDate + ", updateId=" + updateId + ", updateDate=" + updateDate
				+ ", repayDue=" + repayDue + "]";
	}

}
