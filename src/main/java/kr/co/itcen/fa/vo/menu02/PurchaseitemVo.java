package kr.co.itcen.fa.vo.menu02;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 강민호 
 * 매입품목 테이블
 *
 */

@Alias("purchaseitem33vo")
public class PurchaseitemVo {
	private String no;						//품목코드
	private String name;					//품목명
	private String price;					//단가
	private String producedate;				//생산일자
	private String purpose;					//사용용도
	private String standard;				//규격
	private String sectioncode;				//분류코드
	private String factorycode;				//공장코드
	private String deleteflag;				//삭제여부
	private String insertuserid;			//입력자
	private String insertday;				//입력날짜
	private String updateuserid;			//수정자
	private String updateday;				//수정날짜
	private String sectionname;				//분류명
	private String managername;				//생산담당자명
	private String factoryname;				//공장명
	private String factorypostaddress;		//우편번호
	private String factoryroadaddress;		//도로명주소
	private String factorydetailaddress;	//세부주소
	
	public String getFactoryname() {
		return factoryname;
	}
	public void setFactoryname(String factoryname) {
		this.factoryname = factoryname;
	}
	public String getFactorypostaddress() {
		return factorypostaddress;
	}
	public void setFactorypostaddress(String factorypostaddress) {
		this.factorypostaddress = factorypostaddress;
	}
	public String getFactoryroadaddress() {
		return factoryroadaddress;
	}
	public void setFactoryroadaddress(String factoryroadaddress) {
		this.factoryroadaddress = factoryroadaddress;
	}
	public String getFactorydetailaddress() {
		return factorydetailaddress;
	}
	public void setFactorydetailaddress(String factorydetailaddress) {
		this.factorydetailaddress = factorydetailaddress;
	}
	public String getManagername() {
		return managername;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProducedate() {
		return producedate;
	}
	public void setProducedate(String producedate) {
		this.producedate = producedate;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getSectioncode() {
		return sectioncode;
	}
	public void setSectioncode(String sectionCode) {
		this.sectioncode = sectionCode;
	}
	public String getFactorycode() {
		return factorycode;
	}
	public void setFactorycode(String factorycode) {
		this.factorycode = factorycode;
	}
	public String getDeleteflag() {
		return deleteflag;
	}
	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}
	public String getInsertuserid() {
		return insertuserid;
	}
	public void setInsertuserid(String insertuserid) {
		this.insertuserid = insertuserid;
	}
	public String getInsertday() {
		return insertday;
	}
	public void setInsertday(String insertday) {
		this.insertday = insertday;
	}
	public String getUpdateuserid() {
		return updateuserid;
	}
	public void setUpdateuserid(String updateuserid) {
		this.updateuserid = updateuserid;
	}
	public String getUpdateday() {
		return updateday;
	}
	public void setUpdateday(String updateday) {
		this.updateday = updateday;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}
	@Override
	public String toString() {
		return "PurchaseitemVo [no=" + no + ", name=" + name + ", price=" + price + ", producedate=" + producedate
				+ ", purpose=" + purpose + ", standard=" + standard + ", sectioncode=" + sectioncode + ", factorycode="
				+ factorycode + ", deleteflag=" + deleteflag + ", insertuserid=" + insertuserid + ", insertday="
				+ insertday + ", updateuserid=" + updateuserid + ", updateday=" + updateday + ", sectionname="
				+ sectionname + ", managername=" + managername + ", factoryname=" + factoryname
				+ ", factorypostaddress=" + factorypostaddress + ", factoryroadaddress=" + factoryroadaddress
				+ ", factorydetailaddress=" + factorydetailaddress + "]";
	}
}
