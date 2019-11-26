package kr.co.itcen.fa.vo;

import org.apache.ibatis.type.Alias;

@Alias("menuvo")
public class MenuVo {
	private Long no;
	private String name;
	private int orderNo;
	private String lastUpdate;
	private Long parentNo;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public Long getParentNo() {
		return parentNo;
	}
	public void setParentNo(Long parentNo) {
		this.parentNo = parentNo;
	}
	
	@Override
	public String toString() {
		return "MenuVo [no=" + no + ", name=" + name + ", orderNo=" + orderNo + ", lastUpdate=" + lastUpdate
				+ ", parentNo=" + parentNo + "]";
	}
}