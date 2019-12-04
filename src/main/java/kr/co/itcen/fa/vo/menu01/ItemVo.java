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
	private String insertUserid; // 등록자
	private String insertDay; 	 // 등록일
	private String updateUserid; // 수정자
	private String updateDay; 	 // 수정일
	private boolean useYn;		 // 사용여부
	private Long voucherNo; 	 // 전표번호
	private Long accountNo; 	 // 계정과목코드
	
	
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


	public Long getAccountNo() {
		return accountNo;
	}


	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}


	@Override
	public String toString() {
		return "ItemVo [accountNo=" + accountNo + ", amount=" + amount + ", amountFlag=" + amountFlag + ", insertDay="
				+ insertDay + ", insertUserid=" + insertUserid + ", no=" + no + ", updateDay=" + updateDay
				+ ", updateUserid=" + updateUserid + ", useYn=" + useYn + ", voucherNo=" + voucherNo + "]";
	}
	
	
}
