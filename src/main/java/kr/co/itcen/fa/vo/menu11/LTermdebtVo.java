package kr.co.itcen.fa.vo.menu11;

import org.apache.ibatis.type.Alias;

@Alias("ldebtvo")
public class LTermdebtVo {
	private Long no;//장기차입금 번호
	private String code;//장기차입금 코드
	private String name;//장기차입금 명
	private Long debtAmount;//차입금액
	private Long repayBal;//상환잔액
	private String repayWay;//상환방법
	private String debtExpDate;//차입-만기일자
	private String debtDate;//차입일자
	private String expDate;//만기일자
	private int intRate;//이율
	private String intPayWay;//이자지급방식
	private int intAmount;//이자금액
	private String mgr;//담당자명
	private String mgrCall;//담당자 번호
	private String bankCode;//은행코드
	private String deposiNo;//계좌번호
	private String accountNo;//계정코드
	private int voucherNo;//전표번호
	private String deleteFlag;//삭제여부
	private String insertId;//등록자
	private String insertDate;//등록일
	private String updateId;//수정자
	private String updateDate;//수정일
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
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getDeposiNo() {
		return deposiNo;
	}
	public void setDeposiNo(String deposiNo) {
		this.deposiNo = deposiNo;
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
		return "LTermdebtVo [no=" + no + ", code=" + code + ", name=" + name + ", debtAmount=" + debtAmount
				+ ", repayBal=" + repayBal + ", repayWay=" + repayWay + ", debtExpDate=" + debtExpDate + ", debtDate="
				+ debtDate + ", expDate=" + expDate + ", intRate=" + intRate + ", intPayWay=" + intPayWay
				+ ", intAmount=" + intAmount + ", mgr=" + mgr + ", mgrCall=" + mgrCall + ", bankCode=" + bankCode
				+ ", deposiNo=" + deposiNo + ", accountNo=" + accountNo + ", voucherNo=" + voucherNo + ", deleteFlag="
				+ deleteFlag + ", insertId=" + insertId + ", insertDate=" + insertDate + ", updateId=" + updateId
				+ ", updateDate=" + updateDate + "]";
	}
	
	
}
