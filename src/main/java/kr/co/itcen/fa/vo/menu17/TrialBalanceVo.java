package kr.co.itcen.fa.vo.menu17;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("trialBalance17Vo")
public class TrialBalanceVo {
	private Long no;					// 번호 (사용하지 않음)
	private Long closingDateNo;			// 마감일 번호
	private Long accountNo;				// 계정코드
	private String accountName;			// 계정명
	private String balanceType;			// 차변대변 구분
	private boolean statementYn;		// 전표입력 가능여부 
	private Long debtorTotal;			// 차변 합계
	private Long creditTotal;			// 대변 합계
	private Long debtorSpotMonth;		// 당월 차변 합계
	private Long creditSpotMonth;		// 당월 대변 합계
//	private Long debtorBalance;			// 차변 잔액 
//	private Long creditBalance;			// 대변 잔액 
	private String insertUserid;		// 등록자
	private Date insertDay;				// 등록일
	private String updateUserid;		// 수정자
	private Date updateDay;				// 수정일
	
	@Override
	public String toString() {
		return "TrialBalanceVo [no=" + no + ", cloSingDateNo=" + closingDateNo + ", accountNo=" + accountNo
				+ ", debtorTotal=" + debtorTotal + ", creditTotal=" + creditTotal + ", debtorSpotMonth="
				+ debtorSpotMonth + ", creditSpotMonth=" + creditSpotMonth + ", insertUserid=" + insertUserid
				+ ", insertDay=" + insertDay + ", updateUserid=" + updateUserid + ", updateDay=" + updateDay + "]";
	}
	
	
	// Getter & Setter
	public boolean isStatementYn() {
		return statementYn;
	}
	public void setStatementYn(boolean statementYn) {
		this.statementYn = statementYn;
	}
//	public Long getDebtorBalance() {
//		return debtorBalance;
//	}
//	public void setDebtorBalance(Long debtorBalance) {
//		this.debtorBalance = debtorBalance;
//	}
//	public Long getCreditBalance() {
//		return creditBalance;
//	}
//	public void setCreditBalance(Long creditBalance) {
//		this.creditBalance = creditBalance;
//	}
	
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getBalanceType() {
		return balanceType;
	}
	public void setBalanceType(String balanceType) {
		this.balanceType = balanceType;
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getClosingDateNo() {
		return closingDateNo;
	}
	public void setCloSingDateNo(Long closingDateNo) {
		this.closingDateNo = closingDateNo;
	}
	public Long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	public Long getDebtorTotal() {
		return debtorTotal;
	}
	public void setDebtorTotal(Long debtorTotal) {
		this.debtorTotal = debtorTotal;
	}
	public Long getCreditTotal() {
		return creditTotal;
	}
	public void setCreditTotal(Long creditTotal) {
		this.creditTotal = creditTotal;
	}
	public Long getDebtorSpotMonth() {
		return debtorSpotMonth;
	}
	public void setDebtorSpotMonth(Long debtorSpotMonth) {
		this.debtorSpotMonth = debtorSpotMonth;
	}
	public Long getCreditSpotMonth() {
		return creditSpotMonth;
	}
	public void setCreditSpotMonth(Long creditSpotMonth) {
		this.creditSpotMonth = creditSpotMonth;
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
}
