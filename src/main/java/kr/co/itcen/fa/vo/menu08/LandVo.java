package kr.co.itcen.fa.vo.menu08;



import org.apache.ibatis.type.Alias;

@Alias("08landvo")
public class LandVo {

	private String id;
	private String customerNo;
	private String customerName;
	private String managerName;
	private String taxbillNo;
	private long voucherNo;
	private String sectionNo;
	private String sectionName;
	private int landArea;
	private String combineNo;
	private String ownerName;
	private String wideAddress;
	private String cityAddress;
	private String localAddress;
	private String detailAddress;
	private int publicValue;
	private long acqPrice;
	private long etcCost;
	private long regTax;
	private long acqTax;
	private String payDate;
	private String taxKind;
	private String flag;
	private String insertUserid;
	private String insertDay;
	private String updateUserid;
	private String updateDay;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getTaxbillNo() {
		return taxbillNo;
	}
	public void setTaxbillNo(String taxbillNo) {
		this.taxbillNo = taxbillNo;
	}
	public long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getSectionNo() {
		return sectionNo;
	}
	public void setSectionNo(String sectionNo) {
		this.sectionNo = sectionNo;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public int getLandArea() {
		return landArea;
	}
	public void setLandArea(int landArea) {
		this.landArea = landArea;
	}
	public String getCombineNo() {
		return combineNo;
	}
	public void setCombineNo(String combineNo) {
		this.combineNo = combineNo;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getWideAddress() {
		return wideAddress;
	}
	public void setWideAddress(String wideAddress) {
		this.wideAddress = wideAddress;
	}
	public String getCityAddress() {
		return cityAddress;
	}
	public void setCityAddress(String cityAddress) {
		this.cityAddress = cityAddress;
	}
	public String getLocalAddress() {
		return localAddress;
	}
	public void setLocalAddress(String localAddress) {
		this.localAddress = localAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public int getPublicValue() {
		return publicValue;
	}
	public void setPublicValue(int publicValue) {
		this.publicValue = publicValue;
	}
	public long getAcqPrice() {
		return acqPrice;
	}
	public void setAcqPrice(long acqPrice) {
		this.acqPrice = acqPrice;
	}
	public long getEtcCost() {
		return etcCost;
	}
	public void setEtcCost(long etcCost) {
		this.etcCost = etcCost;
	}
	public long getRegTax() {
		return regTax;
	}
	public void setRegTax(long regTax) {
		this.regTax = regTax;
	}
	public long getAcqTax() {
		return acqTax;
	}
	public void setAcqTax(long acqTax) {
		this.acqTax = acqTax;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getTaxKind() {
		return taxKind;
	}
	public void setTaxKind(String taxKind) {
		this.taxKind = taxKind;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
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
		return "LandVo [id=" + id + ", customerNo=" + customerNo + ", taxbillNo=" + taxbillNo + ", voucherNo="
				+ voucherNo + ", sectionNo=" + sectionNo + ", landArea=" + landArea + ", combineNo=" + combineNo
				+ ", ownerName=" + ownerName + ", wideAddress=" + wideAddress + ", cityAddress=" + cityAddress
				+ ", localAddress=" + localAddress + ", detailAddress=" + detailAddress + ", publicValue=" + publicValue
				+ ", acqPrice=" + acqPrice + ", etcCost=" + etcCost + ", regTax=" + regTax + ", acqTax=" + acqTax
				+ ", payDate=" + payDate + ", taxKind=" + taxKind + ", flag=" + flag + ", insertUserid=" + insertUserid
				+ ", insertDay=" + insertDay + ", updateUserid=" + updateUserid + ", updateDay=" + updateDay + "]";
	}
	

	
}
