package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu27Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
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
		System.out.println("totalCnt:"+totalCnt);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt+1, 11, 5);
		
		// 새로운 거래처 입력
		if(menu27Repository.getDeleteFlag(customervo)==false) { //delete Flag가 "N"
			map = menu27Repository.create(customervo, pagination);
			System.out.println("새로운 거래처 입력");
		}
		
		// 삭제된 거래처 재입력 처리
		if(menu27Repository.getDeleteFlag(customervo)==true) { //delete Flag가 "Y"
			map = menu27Repository.deletedrecreate(customervo, pagination);
			System.out.println("삭제된 거래처 재등록");
		}
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
	
	public Map<String, Object> updateBankAccount(BankAccountVo bankAccountVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = menu27Repository.updateBankAccount(bankAccountVo);
		return map;
	}


	public CustomerVo existNo(String no) {
		return menu27Repository.existNo(no);
	}

}
