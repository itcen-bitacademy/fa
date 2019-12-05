package kr.co.itcen.fa.vo.menu17;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("statementData17Vo")
public class StatementDataVo {
    private Long no;
    private Long accountNo;
    private String accountName;
    private Date regDate;
    private Long amount;
    private String amountFlag;
    private Long parent1;
    private Long parent2;
    private Long parent3;
    private Long parent4;
    private Long parent5;
    
    
    
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	public Long getParent1() {
		return parent1;
	}
	public void setParent1(Long parent1) {
		this.parent1 = parent1;
	}
	public Long getParent2() {
		return parent2;
	}
	public void setParent2(Long parent2) {
		this.parent2 = parent2;
	}
	public Long getParent3() {
		return parent3;
	}
	public void setParent3(Long parent3) {
		this.parent3 = parent3;
	}
	public Long getParent4() {
		return parent4;
	}
	public void setParent4(Long parent4) {
		this.parent4 = parent4;
	}
	public Long getParent5() {
		return parent5;
	}
	public void setParent5(Long parent5) {
		this.parent5 = parent5;
	}
    
    
}
