package kr.co.itcen.fa.vo.menu02;

import org.apache.ibatis.type.Alias;

@Alias("buytaxbillitems")
public class BuyTaxbillItemsVo {
	private Long no;
	private String taxbillNo;
	private String purchaseDate;
	private String itemName;
	private Long amount;
	private String supplyValue;
	private String taxValue;
	private String insertUserid;
	private String insertDay;
	private String updateUserid;
	private String updateDay;
	@Override
	public String toString() {
		return "BuyTaxbillItemsVo [no=" + no + ", taxbillNo=" + taxbillNo + ", purchaseDate=" + purchaseDate
				+ ", itemName=" + itemName + ", amount=" + amount + ", supplyValue=" + supplyValue + ", taxValue="
				+ taxValue + ", insertUserid=" + insertUserid + ", insertDay=" + insertDay + ", updateUserid="
				+ updateUserid + ", updateDay=" + updateDay + "]";
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTaxbillNo() {
		return taxbillNo;
	}
	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getSupplyValue() {
		return supplyValue;
	}
	public void setSupplyValue(String supplyValue) {
		this.supplyValue = supplyValue;
	}
	public String getTaxValue() {
		return taxValue;
	}
	public void setTaxValue(String taxValue) {
		this.taxValue = taxValue;
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
	
	

}
