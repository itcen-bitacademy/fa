package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

@Alias("bankaccountvo")
public class BankAccountVo {
	private String depositNo;
	private String depositOld;
	private String depositHost;
	private String makeDate;
	private Integer balance;
	private String enDate;
	private Integer depositLimit;
	private Double profit;
	
	private String insertUserId;
	private String insertDay;
	private String updateUserId;
	private String updateDay;
	private String deleteFlag;
		
	//take from others (FK)
	private String bankName;
	private String bankCode;
	private String banker; 
	private String bankLocation;
	private String bankPhoneCall;
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
	public String getMakeDate() {
		return makeDate;
	}
	public void setMakeDate(String makeDate) {
		this.makeDate = makeDate;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getEnDate() {
		return enDate;
	}
	public void setEnDate(String enDate) {
		this.enDate = enDate;
	}
	public int getDepositLimit() {
		return depositLimit;
	}
	public void setDepositLimit(int depositLimit) {
		this.depositLimit = depositLimit;
	}
	public double getProfit() {
		return profit;
	}
	public void setProfit(double profit) {
		this.profit = profit;
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
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getBanker() {
		return banker;
	}
	public void setBanker(String banker) {
		this.banker = banker;
	}
	public String getBankLocation() {
		return bankLocation;
	}
	public void setBankLocation(String bankLocation) {
		this.bankLocation = bankLocation;
	}
	public String getBankPhoneCall() {
		return bankPhoneCall;
	}
	public void setBankPhoneCall(String bankPhoneCall) {
		this.bankPhoneCall = bankPhoneCall;
	}	
	public String getDepositOld() {
		return depositOld;
	}
	public void setDepositOld(String depositOld) {
		this.depositOld = depositOld;
	}	
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	@Override
	public String toString() {
		return "BankAccountVo [depositNo=" + depositNo + ", depositOld=" + depositOld + ", depositHost=" + depositHost
				+ ", makeDate=" + makeDate + ", balance=" + balance + ", enDate=" + enDate + ", depositLimit="
				+ depositLimit + ", profit=" + profit + ", insertUserId=" + insertUserId + ", insertDay=" + insertDay
				+ ", updateUserId=" + updateUserId + ", updateDay=" + updateDay + ", deleteFlag=" + deleteFlag
				+ ", bankName=" + bankName + ", bankCode=" + bankCode + ", banker=" + banker + ", bankLocation="
				+ bankLocation + ", bankPhoneCall=" + bankPhoneCall + ", getDepositNo()=" + getDepositNo()
				+ ", getDepositHost()=" + getDepositHost() + ", getMakeDate()=" + getMakeDate() + ", getBalance()="
				+ getBalance() + ", getEnDate()=" + getEnDate() + ", getDepositLimit()=" + getDepositLimit()
				+ ", getProfit()=" + getProfit() + ", getInsertUserId()=" + getInsertUserId() + ", getInsertDay()="
				+ getInsertDay() + ", getUpdateUserId()=" + getUpdateUserId() + ", getUpdateDay()=" + getUpdateDay()
				+ ", getDeleteFlag()=" + getDeleteFlag() + ", getBankCode()=" + getBankCode() + ", getBanker()="
				+ getBanker() + ", getBankLocation()=" + getBankLocation() + ", getBankPhoneCall()="
				+ getBankPhoneCall() + ", getDepositOld()=" + getDepositOld() + ", getBankName()=" + getBankName()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
