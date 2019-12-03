package kr.co.itcen.fa.service.menu01;

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
	
	public void insert(CustomerVo customerVo) {
		menu27Repository.insert(customerVo);
	}

	public void update(CustomerVo customerVo) {
		menu27Repository.update(customerVo);
	}

	public void delete(CustomerVo customerVo) {
		menu27Repository.delete(customerVo);
		// TODO Auto-generated method stub
		
	}

	public List<CustomerVo> list() {
		return menu27Repository.list();
	}

	public Map<String, Object> create(CustomerVo customervo) {
		// 중복성 검사 Query 만들어야함 (삭제후 똑같은것 재생성시 처리)
		Map<String, Object> map = menu27Repository.create(customervo);
		return map;
	}

}
