package kr.co.itcen.fa.vo.menu17;

import java.util.Date;

/**
 * @작성자:	kbetter3
 * @작성일:	Nov 27, 2019
 * @이메일:	kbetter3@gmail.com
 * 
 */
public class ClosingDate {
	private int no;							// 번호
	private String closingYearMonth;		// 마감년월
	private Date closingDate;				// 최종마감일
	private Date closingStatementDate;		// 전표마감일
	private Date closingPurchaseDate;		// 매입마감일
	private Date closingSalesDate;			// 매출마감일
	private Date closingAssetsDate;			// 자산마감일
	private Date closingDebtDate;			// 부채마감일
	private Date closingSettlementDate;		// 결산마감일
	private boolean closingYn;				// 마감여부
	private boolean useYn;					// 사용여부
	private String insertUserid;			// 등록자
	private Date insertDay;					// 등록일
	private String updateUserid;			// 수정자
	private Date updateDay;					// 수정일
	
	@Override
	public String toString() {
		return "ClosingDate [no=" + no + ", closingYearMonth=" + closingYearMonth + ", closingDate=" + closingDate
				+ ", closingStatementDate=" + closingStatementDate + ", closingPurchaseDate=" + closingPurchaseDate
				+ ", closingSalesDate=" + closingSalesDate + ", closingAssetsDate=" + closingAssetsDate
				+ ", closingDebtDate=" + closingDebtDate + ", closingSettlementDate=" + closingSettlementDate
				+ ", closingYn=" + closingYn + ", useYn=" + useYn + ", insertUserid=" + insertUserid + ", insertDay="
				+ insertDay + ", updateUserid=" + updateUserid + ", updateDay=" + updateDay + "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getClosingYearMonth() {
		return closingYearMonth;
	}
	public void setClosingYearMonth(String closingYearMonth) {
		this.closingYearMonth = closingYearMonth;
	}
	public Date getClosingDate() {
		return closingDate;
	}
	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}
	public Date getClosingStatementDate() {
		return closingStatementDate;
	}
	public void setClosingStatementDate(Date closingStatementDate) {
		this.closingStatementDate = closingStatementDate;
	}
	public Date getClosingPurchaseDate() {
		return closingPurchaseDate;
	}
	public void setClosingPurchaseDate(Date closingPurchaseDate) {
		this.closingPurchaseDate = closingPurchaseDate;
	}
	public Date getClosingSalesDate() {
		return closingSalesDate;
	}
	public void setClosingSalesDate(Date closingSalesDate) {
		this.closingSalesDate = closingSalesDate;
	}
	public Date getClosingAssetsDate() {
		return closingAssetsDate;
	}
	public void setClosingAssetsDate(Date closingAssetsDate) {
		this.closingAssetsDate = closingAssetsDate;
	}
	public Date getClosingDebtDate() {
		return closingDebtDate;
	}
	public void setClosingDebtDate(Date closingDebtDate) {
		this.closingDebtDate = closingDebtDate;
	}
	public Date getClosingSettlementDate() {
		return closingSettlementDate;
	}
	public void setClosingSettlementDate(Date closingSettlementDate) {
		this.closingSettlementDate = closingSettlementDate;
	}
	public boolean isClosingYn() {
		return closingYn;
	}
	public void setClosingYn(boolean closingYn) {
		this.closingYn = closingYn;
	}
	public boolean isUseYn() {
		return useYn;
	}
	public void setUseYn(boolean useYn) {
		this.useYn = useYn;
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
