package kr.co.itcen.fa.dto;

import java.util.ArrayList;
import java.util.List;

public class Menu {
	private Long no;
	private String name;
	private String lastUpdate;
	List<Menu> subMenus = new ArrayList<>();
	
	public Menu(Long no, String name, String lastUpdate) {
		this.no = no;
		this.name = name;
		this.lastUpdate = lastUpdate;
	}
	
	public String getCode() {
		return String.format("%02d", no);
	}
	
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
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public List<Menu> getSubMenus() {
		return subMenus;
	}

	public void addsubMenu(Menu menu) {
		subMenus.add(menu);
	}

	@Override
	public String toString() {
		return "Menu [no=" + no + ", name=" + name + ", lastUpdate=" + lastUpdate + ", subMenus=" + subMenus + "]";
	}
}
