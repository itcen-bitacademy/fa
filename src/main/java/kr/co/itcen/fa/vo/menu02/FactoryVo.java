package kr.co.itcen.fa.vo.menu02;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 강민호 
 * 공장 테이블
 *
 */

@Alias("factory33vo")
public class FactoryVo {
	private String no;					//공장코드
	private String name;				//공장명
	private String address;				//공장주소
	private String manager_name;		//담당자명
	private String delete_flag;			//삭제여부
	private String insert_userid;		//입력자
	private String insert_day;			//입력날짜
	private String update_userid;		//수정자
	private String update_day;			//수정날짜
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getDelete_flag() {
		return delete_flag;
	}
	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
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
		return "FactoryVo [no=" + no + ", name=" + name + ", address=" + address + ", manager_name=" + manager_name
				+ ", delete_flag=" + delete_flag + ", insert_userid=" + insert_userid + ", insert_day=" + insert_day
				+ ", update_userid=" + update_userid + ", update_day=" + update_day + "]";
	}
}
