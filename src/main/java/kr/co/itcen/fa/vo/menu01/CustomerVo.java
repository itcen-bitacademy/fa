package kr.co.itcen.fa.vo.menu01;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 이종윤
 * 거래처관리
 *
 */

@Alias("1customervo")
public class CustomerVo {
	private String no;
	private String name;
	private String ceo;
	private String address;
	private String conditions;
	private String item;
	private String corporation_no;
	private String open_date;
	private String jurisdiction_office;
	private String phone;
	private String manager_name;
	private String manager_email;
	private String deposit_no;
	private String delete_flag;
	private String insert_userid;
	private String insert_day;
	private String update_userid;
	private String update_day;

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

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getConditions() {
		return conditions;
	}

	public void setConditions(String conditions) {
		this.conditions = conditions;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getCorporation_no() {
		return corporation_no;
	}

	public void setCorporation_no(String corporation_no) {
		this.corporation_no = corporation_no;
	}

	public String getOpen_date() {
		return open_date;
	}

	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}

	public String getJurisdiction_office() {
		return jurisdiction_office;
	}

	public void setJurisdiction_office(String jurisdiction_office) {
		this.jurisdiction_office = jurisdiction_office;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getManager_email() {
		return manager_email;
	}

	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}

	public String getDeposit_no() {
		return deposit_no;
	}

	public void setDeposit_no(String deposit_no) {
		this.deposit_no = deposit_no;
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
		return "CustomerVo [no=" + no + ", name=" + name + ", ceo=" + ceo + ", address=" + address + ", conditions="
				+ conditions + ", item=" + item + ", corporation_no=" + corporation_no + ", open_date=" + open_date
				+ ", jurisdiction_office=" + jurisdiction_office + ", phone=" + phone + ", manager_name=" + manager_name
				+ ", manager_email=" + manager_email + ", deposit_no=" + deposit_no + ", delete_flag=" + delete_flag
				+ ", insert_userid=" + insert_userid + ", insert_day=" + insert_day + ", update_userid=" + update_userid
				+ ", update_day=" + update_day + "]";
	}

}
