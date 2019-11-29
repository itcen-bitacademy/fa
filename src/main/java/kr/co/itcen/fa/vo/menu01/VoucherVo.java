package kr.co.itcen.fa.vo.menu01;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 임성주
 * 전표관리
 *
 */

@Alias("1vouchervo")
public class VoucherVo {
	private Long no; 				 // 전표번호
	private int orderNo; 			 // 전표순번
	private Date regDate; 			 // 전표일자
	private String insertTeam; 		 // 등록팀
	private String insertUserid;	 // 등록자
	private Date insertDay;			 // 등록일
	private String updateUserid;	 // 수정자
	private Date updateDay;			 // 수정일
	private boolean useYn;			 // 사용여부
	private String voucherUse; 		 // 전표사용목적
	private int tax; 				 // 부가세
	private Long systemNo; 		 	 // 시스템번호
	private Long cardNo; 			 // 카드번호
	private Long dipositeNo; 		 // 계좌번호
	private Long customerNo; 		 // 거래처번호
	private String manageNo; 		 // 증빙코드(세금계산서)
	private Long amount; 		 	 // 금액
	private String amountFlag;   	 // 금액플래그
	private Long accountNo; 	 	 // 계정과목코드
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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
	public String getVoucherUse() {
		return voucherUse;
	}
	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public Long getSystemNo() {
		return systemNo;
	}
	public void setSystemNo(Long systemNo) {
		this.systemNo = systemNo;
	}
	public Long getCardNo() {
		return cardNo;
	}
	public void setCardNo(Long cardNo) {
		this.cardNo = cardNo;
	}
	public Long getDipositeNo() {
		return dipositeNo;
	}
	public void setDipositeNo(Long dipositeNo) {
		this.dipositeNo = dipositeNo;
	}
	public Long getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(Long customerNo) {
		this.customerNo = customerNo;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
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
	public Long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	
	@Override
	public String toString() {
		return "VoucherVo [no=" + no + ", orderNo=" + orderNo + ", regDate=" + regDate + ", insertTeam=" + insertTeam
				+ ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid=" + updateUserid
				+ ", updateDay=" + updateDay + ", useYn=" + useYn + ", voucherUse=" + voucherUse + ", tax=" + tax
				+ ", systemNo=" + systemNo + ", cardNo=" + cardNo + ", dipositeNo=" + dipositeNo + ", customerNo="
				+ customerNo + ", manageNo=" + manageNo + ", amount=" + amount + ", amountFlag=" + amountFlag
				+ ", accountNo=" + accountNo + "]";
	}
	
	
	
	
}
