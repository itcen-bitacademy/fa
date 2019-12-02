package kr.co.itcen.fa.vo.menu02;

import org.apache.ibatis.type.Alias;

@Alias("buytaxbillvo")
public class BuyTaxbillVo {
	private Long no;
	private String manageNo;
	private String writeDate;
	private Long totalSupplyValue;
	private Long totalTaxValue;
	private String taxType;
	private String deleteFlag;
	private String insertUserid;
	private String insertDay;
	private String updateUserid;
	private String updateDay;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getManageNo() {
		return manageNo;
	}

	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public Long getTotalSupplyValue() {
		return totalSupplyValue;
	}

	public void setTotalSupplyValue(Long totalSupplyValue) {
		this.totalSupplyValue = totalSupplyValue;
	}

	public Long getTotalTaxValue() {
		return totalTaxValue;
	}

	public void setTotalTaxValue(Long totalTaxValue) {
		this.totalTaxValue = totalTaxValue;
	}

	public String getTaxType() {
		return taxType;
	}

	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
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
		return "BuyTaxbillVo [no=" + no + ", manageNo=" + manageNo + ", writeDate=" + writeDate + ", totalSupplyValue="
				+ totalSupplyValue + ", totalTaxValue=" + totalTaxValue + ", taxType=" + taxType + ", deleteFlag="
				+ deleteFlag + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + "]";
	}
}
