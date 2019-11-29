package kr.co.itcen.fa.service.menu08;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu41Repository;


/**
 * 
 *  @author 권영미
 *  차량관리
 */

@Service
public class Menu41Service {
	
	@Autowired
	private Menu41Repository menu41Repository;
	
	public void test() {
		menu41Repository.test();
	}
	
	
	//직급 리스트 테스트
	public Map<String, Object> getName() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jikNameList", menu41Repository.getJik());
		return map;
	}
	
}
