package kr.co.itcen.fa.vo.menu17;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * @작성자:	kbetter3
 * @작성일:	Nov 27, 2019
 * @이메일:	kbetter3@gmail.com
 * 
 */
@Alias("closingDate19Vo")
public class ClosingDate {
	private Long no;						// 번호
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
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public String toString() {
		return "ClosingDate [no=" + no + ", closingYearMonth=" + closingYearMonth + ", closingDate=" + closingDate
				+ ", closingStatementDate=" + closingStatementDate + ", closingPurchaseDate=" + closingPurchaseDate
				+ ", closingSalesDate=" + closingSalesDate + ", closingAssetsDate=" + closingAssetsDate
				+ ", closingDebtDate=" + closingDebtDate + ", closingSettlementDate=" + closingSettlementDate
				+ ", closingYn=" + closingYn + ", useYn=" + useYn + ", insertUserid=" + insertUserid + ", insertDay="
				+ insertDay + ", updateUserid=" + updateUserid + ", updateDay=" + updateDay + "]";
	}
	
//	public void setClosingDate(Date closingDate) {
//		this.closingDate = closingDate;
//	}
//
//	public void setClosingStatementDate(Date closingStatementDate) {
//		this.closingStatementDate = closingStatementDate;
//	}
//
//	public void setClosingPurchaseDate(Date closingPurchaseDate) {
//		this.closingPurchaseDate = closingPurchaseDate;
//	}
//
//	public void setClosingSalesDate(Date closingSalesDate) {
//		this.closingSalesDate = closingSalesDate;
//	}
//
//	public void setClosingAssetsDate(Date closingAssetsDate) {
//		this.closingAssetsDate = closingAssetsDate;
//	}
//
//	public void setClosingDebtDate(Date closingDebtDate) {
//		this.closingDebtDate = closingDebtDate;
//	}
//
//	public void setClosingSettlementDate(Date closingSettlementDate) {
//		this.closingSettlementDate = closingSettlementDate;
//	}

	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
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
	public void setClosingDate(String closingDate) throws ParseException {
		this.closingDate = sdf.parse(closingDate);
	}
	public Date getClosingStatementDate() {
		return closingStatementDate;
	}
	public void setClosingStatementDate(String closingStatementDate) throws ParseException {
		this.closingStatementDate = sdf.parse(closingStatementDate);
	}
	public Date getClosingPurchaseDate() {
		return closingPurchaseDate;
	}
	public void setClosingPurchaseDate(String closingPurchaseDate) throws ParseException {
		this.closingPurchaseDate = sdf.parse(closingPurchaseDate);
	}
	public Date getClosingSalesDate() {
		return closingSalesDate;
	}
	public void setClosingSalesDate(String closingSalesDate) throws ParseException {
		this.closingSalesDate = sdf.parse(closingSalesDate);
	}
	public Date getClosingAssetsDate() {
		return closingAssetsDate;
	}
	public void setClosingAssetsDate(String closingAssetsDate) throws ParseException {
		this.closingAssetsDate = sdf.parse(closingAssetsDate);
	}
	public Date getClosingDebtDate() {
		return closingDebtDate;
	}
	public void setClosingDebtDate(String closingDebtDate) throws ParseException {
		this.closingDebtDate = sdf.parse(closingDebtDate);
	}
	public Date getClosingSettlementDate() {
		return closingSettlementDate;
	}
	public void setClosingSettlementDate(String closingSettlementDate) throws ParseException {
		this.closingSettlementDate = sdf.parse(closingSettlementDate);
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
