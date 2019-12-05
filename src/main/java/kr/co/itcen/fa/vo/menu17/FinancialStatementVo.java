package kr.co.itcen.fa.vo.menu17;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * @작성자:	유지훈
 * @작성일:	Dev 3, 2019
 * @이메일:	jihoon098@naver.com
 * 
 */

@Alias("financialStatementVo")
public class FinancialStatementVo {
	
	private Long no;						// 번호
	private Long accountStatementType;		// 재무제표 구분
	private Long closingDateNo;				// 마감일 번호
	private Long accountNo;					// 계정과목 코드
	private Long accountOrder;				// 계정과목 순서
	private String accountName;				// 계정과목 이름
	private Long monthToAmount;				// 당월 합계액
	private Long amount;					// 합계 총액
	private String insertUserid;			// 등록자
	private Date insertDay;					// 등록일
	private String updateUserid;			// 수정자
	private Date updateDay;					// 수정일
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getAccountStatementType() {
		return accountStatementType;
	}
	public void setAccountStatementType(Long accountStatementType) {
		this.accountStatementType = accountStatementType;
	}
	public Long getClosingDateNo() {
		return closingDateNo;
	}
	public void setClosingDateNo(Long closingDateNo) {
		this.closingDateNo = closingDateNo;
	}
	public Long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	public Long getAccountOrder() {
		return accountOrder;
	}
	public void setAccountOrder(Long accountOrder) {
		this.accountOrder = accountOrder;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public Long getMonthToAmount() {
		return monthToAmount;
	}
	public void setMonthToAmount(Long monthToAmount) {
		this.monthToAmount = monthToAmount;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getInsertUserid() {
		return insertUserid;
	}
	public void setInsertUserid(String insertUserid) {
		this.insertUserid = insertUserid;
	}
	public Date getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(Date insertDay) {
		this.insertDay = insertDay;
	}
	public String getUpdateUserid() {
		return updateUserid;
	}
	public void setUpdateUserid(String updateUserid) {
		this.updateUserid = updateUserid;
	}
	public Date getUpdateDay() {
		return updateDay;
	}
	public void setUpdateDay(Date updateDay) {
		this.updateDay = updateDay;
	}
	
	
	@Override
	public String toString() {
		return "FinancialStatementVo [no=" + no + ", accountStatementType=" + accountStatementType + ", closingDateNo="
				+ closingDateNo + ", accountNo=" + accountNo + ", accountOrder=" + accountOrder + ", accountName="
				+ accountName + ", monthToAmount=" + monthToAmount + ", amount=" + amount + ", insertUserid="
				+ insertUserid + ", insertDay=" + insertDay + ", updateUserid=" + updateUserid + ", updateDay="
				+ updateDay + "]";
	}
	
}
