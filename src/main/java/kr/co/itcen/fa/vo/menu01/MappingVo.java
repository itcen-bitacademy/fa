package kr.co.itcen.fa.vo.menu01;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 임성주
 * 매핑관리
 *
 */

@Alias("1mappingvo")
public class MappingVo {
	private Long no; 			 // 매핑번호
	private Long systemCode; 	 // 시스템코드
	private String voucherUse;   // 전표사용목적
	private String insertTeam;   // 등록팀
	private String insertUserid; // 등록자
	private Date insertDay; 	 // 등록일
	private String updateUserid; // 수정자
	private Date updateDay; 	 // 수정일
	private boolean useYn;		 // 사용여부
	private Long voucherNo; 	 // 전표번호
	private String cardNo;	 	 // 카드번호
	private String cardUser;	 // 카드사용자
	private String depositeNo; 	 // 계좌번호
	private String depositeHost; // 예금주
	private String manageNo; 	 // 증빙코드(세금계산서)
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getSystemCode() {
		return systemCode;
	}
	public void setSystemCode(Long systemCode) {
		this.systemCode = systemCode;
	}
	public String getVoucherUse() {
		return voucherUse;
	}
	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
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
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardUser() {
		return cardUser;
	}
	public void setCardUser(String cardUser) {
		this.cardUser = cardUser;
	}
	public String getDipositeNo() {
		return depositeNo;
	}
	public void setDipositeNo(String depositeNo) {
		this.depositeNo = depositeNo;
	}
	public String getDepositeHost() {
		return depositeHost;
	}
	public void setDepositeHost(String depositeHost) {
		this.depositeHost = depositeHost;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	
	@Override
	public String toString() {
		return "MappingVo [no=" + no + ", systemCode=" + systemCode + ", voucherUse=" + voucherUse + ", insertTeam="
				+ insertTeam + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + ", useYn=" + useYn + ", voucherNo=" + voucherNo
				+ ", cardNo=" + cardNo + ", cardUser=" + cardUser + ", depositeNo=" + depositeNo + ", depositeHost="
				+ depositeHost + ", manageNo=" + manageNo + "]";
	}
	
}
