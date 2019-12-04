package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu27Repository;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

/**
 * 
 * @author 이종윤 
 * 거래처관리
 *
 */

@Service
public class Menu27Service {

	@Autowired
	private Menu27Repository menu27Repository;

	public void test() {
		menu27Repository.test();
	}

	public List<CustomerVo> list() {
		// TODO Auto-generated method stub
		List<CustomerVo> map = menu27Repository.list();
		return map;
	}

	public Map<String, Object> create(CustomerVo customervo) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 중복성 검사 Query 만들어야함 (삭제후 똑같은것 재생성시 처리)
		map = menu27Repository.create(customervo);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> read(CustomerVo customerVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = menu27Repository.read(customerVo);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> update(CustomerVo customerVo) { // 거래처는 중복성검사 안함..
		Map<String, Object> map = new HashMap<String, Object>();
		map = menu27Repository.update(customerVo);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> delete(CustomerVo customerVo) {
		Map<String, Object> map = menu27Repository.delete(customerVo);
		return map;
	}

}
