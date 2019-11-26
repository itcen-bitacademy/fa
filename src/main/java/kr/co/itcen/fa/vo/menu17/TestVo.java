package kr.co.itcen.fa.vo.menu17;

import org.apache.ibatis.type.Alias;

@Alias("test19vo")
public class TestVo {
	
	private Long no;
	private String name;
	
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
	
	@Override
	public String toString() {
		return "TestVo [no=" + no + ", name=" + name + "]";
	}
}
