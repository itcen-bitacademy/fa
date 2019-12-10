package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu09Repository;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu08.LandVo;


/**
 * 
 *  @author 정의돈
 *  토지관리
 */

@Service
public class Menu09Service {
	
	@Autowired
	private Menu09Repository menu09Repository;
	
	public void test() {
		menu09Repository.test();
	}

	public Map<String, Object> getSectionList() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sectionList", menu09Repository.getSectionList());
		return map;
	}
	
	public Map<String, Object> getCustomerCodeList() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerList", menu09Repository.getCustomerList());
		
		return map;
	}

	public Map<String, Object> getLandList() {
		System.out.println("getLandList");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("landList", menu09Repository.getLandList());
		
		return map;
	}

	public void insertLand(LandVo landVo) {
		
		menu09Repository.insertLand(landVo);
		
	}

	public void delLand(String id, String userId) {
		menu09Repository.delLand(id, userId);
		
	}

	public void updateLand(LandVo landVo) {

		menu09Repository.updateLand(landVo);
		
	}

	public Map<String, Object> getsearchList(String id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("landList", menu09Repository.getSearchList(id));
		
		return map;
	}

	public Boolean checkId(String id) {
		
		menu09Repository.checkId(id);
		return menu09Repository.checkId(id) != null;
	}

	public CustomerVo getDepositNo(String customerNo) {
		
		CustomerVo cus = menu09Repository.getDepositNo(customerNo);
		return cus;
	}
	
}
