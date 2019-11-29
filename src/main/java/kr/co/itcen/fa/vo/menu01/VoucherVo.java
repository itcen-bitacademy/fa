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
	private Long no; 				// 전표번호
	private int orderNo; 			// 전표순번
	private Date regDate; 			// 전표등록일자
	private String insertUserid;	// 등록자
	private Date insertDay;			// 등록일
	private String updateUserid;	// 수정자
	private Date updateDay;			// 수정일
	private boolean useYn;			// 사용여부
	
	@Override
	public String toString() {
		return "VoucherVo [no=" + no + ", orderNo=" + orderNo + ", regDate=" + regDate + ", insertUserid="
				+ insertUserid + ", insertDay=" + insertDay + ", updateUserid=" + updateUserid + ", updateDay="
				+ updateDay + ", useYn=" + useYn + "]";
	}
	
	// getter, setter
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
	
	
	
}
