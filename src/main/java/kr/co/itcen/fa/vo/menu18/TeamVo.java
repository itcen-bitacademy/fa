package kr.co.itcen.fa.vo.menu18;

import org.apache.ibatis.type.Alias;

@Alias("teamvo")
public class TeamVo {
	private Long no;
	private String name;
	private String info;
	private String lastUpdate;
	private Long menuNo;
	private String menuName;
	
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public Long getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(Long menuNo) {
		this.menuNo = menuNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Override
	public String toString() {
		return "TeamVo [no=" + no + ", name=" + name + ", info=" + info + ", lastUpdate=" + lastUpdate + ", menuNo="
				+ menuNo + ", menuName=" + menuName + "]";
	}
}
