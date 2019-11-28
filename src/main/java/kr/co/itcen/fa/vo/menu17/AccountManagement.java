package kr.co.itcen.fa.vo.menu17;

/**
 * @작성자:	이성훈
 * @작성일:	Nov 27, 2019
 * @이메일:	dltjdgnsok72@gmail.com
 * 
 */

public class AccountManagement {

	private Long no;                       //번호
	private Long accountOrder;            //계정과목 순서
	private Long accountNo;			   //계정과목 코드
	private String accountUsedyear;       //계정과목 사용년도
	private String accountStatementType; //제무재표 구분
	private Boolean useYn;                //사용여부
	private String insertUserid;          //등록자
	private String insertDay;             //등록일                 
	private String updateUserid;          //수정자
	private String updateDay;             //수정일
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
	
	@Override
	public String toString() {
		return "AccountManagement [no=" + no + ", accountOrder=" + accountOrder + ", accountNo=" + accountNo
				+ ", accountUsedyear=" + accountUsedyear + ", accountStatementType=" + accountStatementType + ", useYn="
				+ useYn + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + "]";
	}
	
}
