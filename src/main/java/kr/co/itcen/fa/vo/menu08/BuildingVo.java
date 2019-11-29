package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;

@Alias("building08vo")
public class BuildingVo {

	private Long id;
	private Long area;
	private String payDate;
	private String flag;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getArea() {
		return area;
	}
	public void setArea(Long area) {
		this.area = area;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "BuildingVo [id=" + id + ", area=" + area + ", payDate=" + payDate + ", flag=" + flag + "]";
	}
	
}
