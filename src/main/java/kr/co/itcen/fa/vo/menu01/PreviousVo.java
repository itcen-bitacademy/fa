package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

@Alias("previousVo")
public class PreviousVo {
	private String customerNo;
	private Long accountNo;
	private Long amount;
	private String amountFlag;
	private String voucherUse;
	
	public String getVoucherUse() {
		return voucherUse;
	}

	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}

	public Long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
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
	
	
	

	@Override
	public String toString() {
		return "PreviousVo [customerNo=" + customerNo + ", accountNo=" + accountNo + ", amount=" + amount
				+ ", amountFlag=" + amountFlag + ", voucherUse=" + voucherUse + "]";
	}

	public boolean exist(Long accountNo2, String customerNo2) {
		
		if(this.accountNo.equals(accountNo2)&&this.customerNo.equals(customerNo2)) {
			return true;
		}
		return false;
	}	
}
