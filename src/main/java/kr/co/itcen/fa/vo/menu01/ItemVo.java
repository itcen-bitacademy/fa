package kr.co.itcen.fa.vo.menu01;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 임성주
 * 항목관리
 *
 */

@Alias("1itemvo")
public class ItemVo {
	private Long no; 			 // 항목번호
	private Long amount; 		 // 금액
	private String amountFlag;   // 금액플래그
	private String insertTeam; 	 // 작성팀
	private String insertUserid; // 등록자
	private Date insertDay; 	 // 등록일
	private String updateUserid; // 수정자
	private Date updateDay; 	 // 수정일
	private boolean useYn;		 // 사용여부
	private Long voucherNo; 	 // 전표번호
	private int orderNo; 		 // 전표순번
	private Long accountNo; 	 // 계정과목코드
	
	@Override
	public String toString() {
		return "ItemVo [no=" + no + ", amount=" + amount + ", amountFlag=" + amountFlag + ", insertTeam=" + insertTeam
				+ ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid=" + updateUserid
				+ ", updateDay=" + updateDay + ", useYn=" + useYn + ", voucherNo=" + voucherNo + ", orderNo=" + orderNo
				+ ", accountNo=" + accountNo + "]";
	}
	
	// getter, setter
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
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
	public String getInsertTeam() {
		return insertTeam;
	}
	public void setInsertTeam(String insertTeam) {
		this.insertTeam = insertTeam;
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
	public boolean isUseYn() {
		return useYn;
	}
	public void setUseYn(boolean useYn) {
		this.useYn = useYn;
	}
	public Long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(Long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public Long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	
	
}
