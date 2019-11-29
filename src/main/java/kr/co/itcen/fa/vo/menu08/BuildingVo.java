package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;

@Alias("building08vo")
public class BuildingVo {

	private Long no;
	private Long bd_area;
	private String pay_date;
	private String flag;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getBd_area() {
		return bd_area;
	}
	public void setBd_area(Long bd_area) {
		this.bd_area = bd_area;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "BuildingVo [no=" + no + ", bd_area=" + bd_area + ", pay_date=" + pay_date + ", flag=" + flag + "]";
	}
	
}
