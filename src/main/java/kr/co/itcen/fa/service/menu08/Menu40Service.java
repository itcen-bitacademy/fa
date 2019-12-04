package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu40Repository;


/**
 * 
 *  @author 김민준
 *  건물현황조회
 */

@Service
public class Menu40Service {
	
	@Autowired
	private Menu40Repository menu40Repository;
	
	public Map<String, Object> getSection() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sectionList", menu40Repository.getSection());
		return map;
	}
}
