package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;



@Alias("name")
public class StaffVo {

	private long no;

	private String staffName;
	
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	@Override
	public String toString() {
		return "StaffVo [no=" + no + ", staffName=" + staffName + "]";
	}
}


