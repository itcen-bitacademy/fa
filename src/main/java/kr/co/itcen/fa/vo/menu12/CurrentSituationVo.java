package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

@Alias("currentsituationvo")
public class CurrentSituationVo {

	private String searchdate; //검색날짜
	private String purchasedate;  //입고날짜
	private String salesdate; //출고날짜
	private Long parentno; 
	private Long sectionno; //대분류번호
	private String sectioncode; //대분류코드
	private String sectionname; //대분류명
	private String itemcode; //품목코드
	private String itemname; //품목명
	private Long purchasemanagementquantity; //입고수량
	private Long purchasemanagementsupplyvalue; //입고공급가
	private Long purchasemanagementtaxvalue; //입고부가세
	private Long purchasemanagementtotalprice; //입고 금액
	private Long salesquantity; //출고수량
	private Long salessupplyvalue; //출고공급가
	private Long salestaxvalue; //출고부가세
	private Long salestotalprice; //출고금액
	private Long stockquantity; //재고수량
	private Long stocksupplyvalue; //재고 부가세
	private Long stocktaxvalue; //재고부가세
	private Long stocktotalprice; //재고금액
	public Long getStocksupplyvalue() {
		return stocksupplyvalue;
	}
	public void setStocksupplyvalue(Long stocksupplyvalue) {
		this.stocksupplyvalue = stocksupplyvalue;
	}
	
	public Long getSectionno() {
		return sectionno;
	}
	public void setSectionno(Long sectionno) {
		this.sectionno = sectionno;
	}
	public String getSearchdate() {
		return searchdate;
	}
	public void setSearchdate(String searchdate) {
		this.searchdate = searchdate;
	}
	public String getPurchasedate() {
		return purchasedate;
	}
	public void setPurchasedate(String purchasedate) {
		this.purchasedate = purchasedate;
	}
	public String getSalesdate() {
		return salesdate;
	}
	public void setSalesdate(String salesdate) {
		this.salesdate = salesdate;
	}
	public Long getParentno() {
		return parentno;
	}
	public void setParentno(Long parentno) {
		this.parentno = parentno;
	}
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
	public String getItemcode() {
		return itemcode;
	}
	public void setItemcode(String itemcode) {
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
	@Override
	public String toString() {
		return "CurrentSituationVo [searchdate=" + searchdate + ", purchasedate=" + purchasedate + ", salesdate="
				+ salesdate + ", parentno=" + parentno + ", sectionno=" + sectionno + ", sectioncode=" + sectioncode
				+ ", sectionname=" + sectionname + ", itemcode=" + itemcode + ", itemname=" + itemname
				+ ", purchasemanagementquantity=" + purchasemanagementquantity + ", purchasemanagementsupplyvalue="
				+ purchasemanagementsupplyvalue + ", purchasemanagementtaxvalue=" + purchasemanagementtaxvalue
				+ ", purchasemanagementtotalprice=" + purchasemanagementtotalprice + ", salesquantity=" + salesquantity
				+ ", salessupplyvalue=" + salessupplyvalue + ", salestaxvalue=" + salestaxvalue + ", salestotalprice="
				+ salestotalprice + ", stockquantity=" + stockquantity + ", stocksupplyvalue=" + stocksupplyvalue
				+ ", stocktaxvalue=" + stocktaxvalue + ", stocktotalprice=" + stocktotalprice + "]";
	}

	
	

	
}
