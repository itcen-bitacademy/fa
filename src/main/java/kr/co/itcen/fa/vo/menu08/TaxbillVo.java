package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;

@Alias("08taxVehicle")
public class TaxbillVo {


	private Long no;
	private String taxbillNoPoP;
	private Long voucherNo;
	private String vehicleNo;
	private Long pay;
	private String paymentDate; //납부한 날
	private String dueDate; //납부 예정 일
	private String gubun;
	private String insertUserid;
	private String insertDay;
	private String updateUserid;
	private String updateDay;
	private String flag;
	
	

	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTaxbillNoPoP() {
		return taxbillNoPoP;
	}
	public void setTaxbillNoPoP(String taxbillNoPoP) {
		this.taxbillNoPoP = taxbillNoPoP;
	}
	public Long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(Long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public Long getPay() {
		return pay;
	}
	public void setPay(Long pay) {
		this.pay = pay;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
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
		return "TaxbillVo [no=" + no + ", taxbillNoPoP=" + taxbillNoPoP + ", voucherNo=" + voucherNo + ", vehicleNo="
				+ vehicleNo + ", pay=" + pay + ", paymentDate=" + paymentDate + ", dueDate=" + dueDate + ", gubun="
				+ gubun + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + ", flag=" + flag + "]";
	}
	

}
