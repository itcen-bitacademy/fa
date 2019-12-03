package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

@Alias("currentsituationvo")
public class CurrentSituationVo {
	//대분류번호,대분류명,품목번호,품목명,입고수량,입고공급가,입고부가세,입고금액
	//출고수량,출고공급가,출고부가세,출고금액
	
	private String sectioncode;
	private String sectionname;
	private int itemcode;
	private String itemname;
	private Long purchasemanagementquantity;
	private Long purchasemanagementsupplyvalue;
	private Long purchasemanagementtaxvalue;
	private Long purchasemanagementtotalprice;
	private Long salesquantity;
	private Long salessupplyvalue;
	private Long salestaxvalue;
	private Long salestotalprice;
	private Long stockquantity;
	private Long stocktaxvalue;
	private Long stocktotalprice;
	public String getSectioncode() {
		return sectioncode;
	}
	public void setSectioncode(String sectioncode) {
		this.sectioncode = sectioncode;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}
	public int getItemcode() {
		return itemcode;
	}
	public void setItemcode(int itemcode) {
		this.itemcode = itemcode;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public Long getPurchasemanagementquantity() {
		return purchasemanagementquantity;
	}
	public void setPurchasemanagementquantity(Long purchasemanagementquantity) {
		this.purchasemanagementquantity = purchasemanagementquantity;
	}
	public Long getPurchasemanagementsupplyvalue() {
		return purchasemanagementsupplyvalue;
	}
	public void setPurchasemanagementsupplyvalue(Long purchasemanagementsupplyvalue) {
		this.purchasemanagementsupplyvalue = purchasemanagementsupplyvalue;
	}
	public Long getPurchasemanagementtaxvalue() {
		return purchasemanagementtaxvalue;
	}
	public void setPurchasemanagementtaxvalue(Long purchasemanagementtaxvalue) {
		this.purchasemanagementtaxvalue = purchasemanagementtaxvalue;
	}
	public Long getPurchasemanagementtotalprice() {
		return purchasemanagementtotalprice;
	}
	public void setPurchasemanagementtotalprice(Long purchasemanagementtotalprice) {
		this.purchasemanagementtotalprice = purchasemanagementtotalprice;
	}
	public Long getSalesquantity() {
		return salesquantity;
	}
	public void setSalesquantity(Long salesquantity) {
		this.salesquantity = salesquantity;
	}
	public Long getSalessupplyvalue() {
		return salessupplyvalue;
	}
	public void setSalessupplyvalue(Long salessupplyvalue) {
		this.salessupplyvalue = salessupplyvalue;
	}
	public Long getSalestaxvalue() {
		return salestaxvalue;
	}
	public void setSalestaxvalue(Long salestaxvalue) {
		this.salestaxvalue = salestaxvalue;
	}
	public Long getSalestotalprice() {
		return salestotalprice;
	}
	public void setSalestotalprice(Long salestotalprice) {
		this.salestotalprice = salestotalprice;
	}
	public Long getStockquantity() {
		return stockquantity;
	}
	public void setStockquantity(Long stockquantity) {
		this.stockquantity = stockquantity;
	}
	public Long getStocktaxvalue() {
		return stocktaxvalue;
	}
	public void setStocktaxvalue(Long stocktaxvalue) {
		this.stocktaxvalue = stocktaxvalue;
	}
	public Long getStocktotalprice() {
		return stocktotalprice;
	}
	public void setStocktotalprice(Long stocktotalprice) {
		this.stocktotalprice = stocktotalprice;
	}
	
	
	
	
}
