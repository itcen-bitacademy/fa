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
	private String no;					//품목코드
	private String name;				//품목명
	private Long price;					//단가
	private String produce_date;		//생산일자
	private String purpose;				//사용용도
	private String standard;			//규격
	private String section_code;		//분류코드
	private String factory_code;		//공장코드
	private String delete_flag;			//삭제여부
	private String insert_userid;		//입력자
	private String insert_day;			//입력날짜
	private String update_userid;		//수정자
	private String update_day;			//수정날짜
	
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
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getProduce_date() {
		return produce_date;
	}
	public void setProduce_date(String produce_date) {
		this.produce_date = produce_date;
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
	public String getSection_code() {
		return section_code;
	}
	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}
	public String getFactory_code() {
		return factory_code;
	}
	public void setFactory_code(String factory_code) {
		this.factory_code = factory_code;
	}
	public String getDelete_flag() {
		return delete_flag;
	}
	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}
	public String getInsert_userid() {
		return insert_userid;
	}
	public void setInsert_userid(String insert_userid) {
		this.insert_userid = insert_userid;
	}
	public String getInsert_day() {
		return insert_day;
	}
	public void setInsert_day(String insert_day) {
		this.insert_day = insert_day;
	}
	public String getUpdate_userid() {
		return update_userid;
	}
	public void setUpdate_userid(String update_userid) {
		this.update_userid = update_userid;
	}
	public String getUpdate_day() {
		return update_day;
	}
	public void setUpdate_day(String update_day) {
		this.update_day = update_day;
	}
	@Override
	public String toString() {
		return "ItemVo [no=" + no + ", name=" + name + ", price=" + price + ", produce_date=" + produce_date
				+ ", purpose=" + purpose + ", standard=" + standard + ", section_code=" + section_code
				+ ", factory_code=" + factory_code + ", delete_flag=" + delete_flag + ", insert_userid=" + insert_userid
				+ ", insert_day=" + insert_day + ", update_userid=" + update_userid + ", update_day=" + update_day
				+ "]";
	}
}
