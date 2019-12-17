package kr.co.itcen.fa.vo.menu17;

import org.apache.ibatis.type.Alias;

/**
 * @작성자:	이성훈
 * @작성일:	Nov 27, 2019
 * @이메일:	dltjdgnsok72@gmail.com
 * 
 */

/**
 * @author BIT
 *
 */
@Alias("accountManagement17Vo")
public class AccountManagementVo {

	private Long no;                     //번호
	private Long accountOrder;           //계정과목 순서
	private Long accountNo;			     //계정과목 코드
	private String accountUsedyear;      //계정과목 사용년도
	private String accountStatementType; //제무재표 구분
	private Boolean useYn;               //사용여부
	private String insertUserid;         //등록자
	private String insertDay;            //등록일                 
	private String updateUserid;         //수정자
	private String updateDay;            //수정일 
	
	private String balanceType;          //잔액구분
	private String accountName;          //계정명
	 
	private int cnt;                    //총개수
	private int max;                    //가장 높은 order값
	private int maxcnt;                 //가장 높은 no값
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getAccountOrder() {
		return accountOrder;
	}
	public void setAccountOrder(Long accountOrder) {
		this.accountOrder = accountOrder;
	}
	public Long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountUsedyear() {
		return accountUsedyear;
	}
	public void setAccountUsedyear(String accountUsedyear) {
		this.accountUsedyear = accountUsedyear;
	}
	public String getAccountStatementType() {
		return accountStatementType;
	}
	public void setAccountStatementType(String accountStatementType) {
		this.accountStatementType = accountStatementType;
	}
	public Boolean getUseYn() {
		return useYn;
	}
	public void setUseYn(Boolean useYn) {
		this.useYn = useYn;
	}
	public String getInsertUserid() {
		return insertUserid;
	}
	public void setInsertUserid(String insertUserid) {
		this.insertUserid = insertUserid;
	}
	public String getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(String insertDay) {
		this.insertDay = insertDay;
	}
	public String getUpdateUserid() {
		return updateUserid;
	}
	public void setUpdateUserid(String updateUserid) {
		this.updateUserid = updateUserid;
	}
	public String getUpdateDay() {
		return updateDay;
	}
	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}
	public String getBalanceType() {
		return balanceType;
	}
	public void setBalanceType(String balanceType) {
		this.balanceType = balanceType;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	
	public int getMaxcnt() {
		return maxcnt;
	}
	public void setMaxcnt(int maxcnt) {
		this.maxcnt = maxcnt;
	}
	
	@Override
	public String toString() {
		return "AccountManagementVo [no=" + no + ", accountOrder=" + accountOrder + ", accountNo=" + accountNo
				+ ", accountUsedyear=" + accountUsedyear + ", accountStatementType=" + accountStatementType + ", useYn="
				+ useYn + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + ", balanceType=" + balanceType + ", accountName="
				+ accountName + ", cnt=" + cnt + ", max=" + max + ", maxcnt=" + maxcnt + "]";
	}

}
