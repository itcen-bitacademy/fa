package kr.co.itcen.fa.vo.menu12;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 안태영 - 매출세금계산서 Vo 객체 - DB 테이블명 : tb_sell_taxbill
 * 
 **/
@Alias("selltaxbillvo")
public class SellTaxbillVo {            // 논리명
	private long idx;					// 번호    - pk - Auto Increment
	private long taxbill_no;			// 승인번호
	private String manage_no;			// 관리번호
	private String tax_type;			// 과세구분
	private long total_supply_value;	// 총급가액
	private long total_tax_value;		// 총세액
	private boolean delete_flag;		// 삭제
	private String write_date;			// 작성일
	private String voucher_no;			// 전표번호
	private String sales_no;			// 매출번호
	private String insert_userid;		// 입력자 
	private String insert_day;			// 입력자 날
	private String update_userid;		// 수정자
	private String update_day;			// 수정날

	public long getIdx() {
		return idx;
	}

	public void setIdx(long idx) {
		this.idx = idx;
	}

	public long getTaxbill_no() {
		return taxbill_no;
	}

	public void setTaxbill_no(long taxbill_no) {
		this.taxbill_no = taxbill_no;
	}

	public String getManage_no() {
		return manage_no;
	}

	public void setManage_no(String manage_no) {
		this.manage_no = manage_no;
	}

	public String getTax_type() {
		return tax_type;
	}

	public void setTax_type(String tax_type) {
		this.tax_type = tax_type;
	}

	public long getTotal_supply_value() {
		return total_supply_value;
	}

	public void setTotal_supply_value(long total_supply_value) {
		this.total_supply_value = total_supply_value;
	}

	public long getTotal_tax_value() {
		return total_tax_value;
	}

	public void setTotal_tax_value(long total_tax_value) {
		this.total_tax_value = total_tax_value;
	}

	public boolean isDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(boolean delete_flag) {
		this.delete_flag = delete_flag;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getVoucher_no() {
		return voucher_no;
	}

	public void setVoucher_no(String voucher_no) {
		this.voucher_no = voucher_no;
	}

	public String getSales_no() {
		return sales_no;
	}

	public void setSales_no(String sales_no) {
		this.sales_no = sales_no;
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
		return "SellTaxbillVo [idx=" + idx + ", taxbill_no=" + taxbill_no + ", manage_no=" + manage_no + ", tax_type="
				+ tax_type + ", total_supply_value=" + total_supply_value + ", total_tax_value=" + total_tax_value
				+ ", delete_flag=" + delete_flag + ", write_date=" + write_date + ", voucher_no=" + voucher_no
				+ ", sales_no=" + sales_no + ", insert_userid=" + insert_userid + ", insert_day=" + insert_day
				+ ", update_userid=" + update_userid + ", update_day=" + update_day + "]";
	}

}
