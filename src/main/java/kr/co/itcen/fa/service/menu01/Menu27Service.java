package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu27Repository;
import kr.co.itcen.fa.util.PaginationUtil;
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
	

	public Map<String, Object> create(CustomerVo customervo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCnt = menu27Repository.selectCount();
		System.out.println("djflsf"+totalCnt);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt+1, 11, 5);
		
		map = menu27Repository.create(customervo, pagination);
		map.put("pagination", pagination);
		map.put("success", true);
		return map;
		
	}

	public Map<String, Object> read(CustomerVo customerVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = menu27Repository.read(customerVo);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> update(CustomerVo customerVo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCnt = menu27Repository.selectCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		map = menu27Repository.update(customerVo, pagination);
		map.put("pagination", pagination);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> delete(CustomerVo customerVo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCnt = menu27Repository.selectCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt-1, 11, 5);
		
		map = menu27Repository.delete(customerVo, pagination);
		map.put("pagination", pagination);
		map.put("success", true);
		return map;
		
	}

	public DataResult<CustomerVo> list(int page) {
		DataResult<CustomerVo> dataResult = new DataResult<CustomerVo>();
		
		int totalCnt = menu27Repository.selectCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		List<CustomerVo> list = menu27Repository.list(pagination);
		
		dataResult.setPagination(pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}

}
