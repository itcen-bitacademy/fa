package kr.co.itcen.fa.service.menu02;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu07Repository;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;

/**
 * 
 * @author 윤종진
 * 매입현황조회
 *
 */

@Service
public class Menu07Service {
	@Autowired
	private Menu07Repository menu07Repository;
	
	public void test() {
		menu07Repository.test();
	}

	public List<PurchasemanagementVo> getList() {
		
		return menu07Repository.getList();
	}

	public int getCount() {
		return menu07Repository.getCount();
	}

	public List<PurchasemanagementVo> getList(int page) {
		return menu07Repository.getList(page);
	}

	
//	public List<PurchasemanagementVo> getList(Map<String, Object> map) {
//		return menu07Repository.getList(map);
//	}

	public List<PurchasemanagementVo> getList(PurchasemanagementVo vo) {
		return menu07Repository.getList(vo);
	}
}
