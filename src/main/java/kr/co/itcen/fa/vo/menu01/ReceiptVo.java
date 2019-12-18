package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 황슬기 명세서 Vo
 *
 */

@Alias("receiptVo")
public class ReceiptVo {
	private String accountNo;// 계정코드
	private String accountName;// 계정명
	private String regDate;// 일자
	private Long amount;// 금액
	private String amountFlag;// 차대구분 플래그
	private String customerNo;// 거래처 코드
	private String customerName; // 거래처명
	private String voucherUse;// 적요
	
	private Long total;// 합계
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getVoucherUse() {
		return voucherUse;
	}
	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
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
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "ReceiptVo [regDate=" + regDate + ", customerNo=" + customerNo + ", customerName=" + customerName
				+ ", accountNo=" + accountNo + ", accountName=" + accountName + ", voucherUse=" + voucherUse
				+ ", amountFlag=" + amountFlag + ", amount=" + amount + ", total=" + total + "]";
	}
		
}
