package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

@Alias("test1vo")
public class TestVo {
	private String name;
	private int id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
