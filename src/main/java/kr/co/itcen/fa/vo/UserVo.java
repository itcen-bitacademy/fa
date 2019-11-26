package kr.co.itcen.fa.vo;

import org.apache.ibatis.type.Alias;

@Alias("uservo")
public class UserVo {
	private String name;
	private String id;
	private String password;
	private String lastUpdate;
	private String lastLogin;
	private String role;
	private String teamNo;
	private String teamName;
	private Long menuNo;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(String teamNo) {
		this.teamNo = teamNo;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public Long getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(Long menuNo) {
		this.menuNo = menuNo;
	}
	
	@Override
	public String toString() {
		return "UserVo [name=" + name + ", id=" + id + ", password=" + password + ", lastUpdate=" + lastUpdate
				+ ", lastLogin=" + lastLogin + ", role=" + role + ", teamNo=" + teamNo + ", teamName=" + teamName
				+ ", menuNo=" + menuNo + "]";
	}
}
