package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu39Repository;
import kr.co.itcen.fa.vo.menu08.BuildingVo;


/**
 * 
 *  @author 김민준
 *  건물관리
 */

@Service
public class Menu39Service {
	
	@Autowired
	private Menu39Repository menu39Repository;
	
	/*
	public void test() {
		menu39Repository.test();
	}
	*/
	
	//등록
	public void add(BuildingVo vo) {
		menu39Repository.add(vo);
	}
	
	//조회
	public List<BuildingVo> list(String id) {
		List<BuildingVo> list = menu39Repository.getList(id);
		return list;
	}
	
	//수정
	public void modify(BuildingVo vo) {
		menu39Repository.update(vo);
	}
	
	//삭제 flag
	public void delete(String id) {
		menu39Repository.delete(id);
	}
	
	//대분류 리스트
	public Map<String, Object> getSection() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sectionList", menu39Repository.getSection());
		return map;
	}
	
	//거래처 리스트
	public Map<String, Object> getCustomer() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerList", menu39Repository.getCustomer());
		return map;
	}

	
}