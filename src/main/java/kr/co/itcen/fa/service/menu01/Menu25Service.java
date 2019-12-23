package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu25Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;

/**
 * 
 * @author 황슬기 
 * 계좌관리
 *
 */
@Service
public class Menu25Service {
	
	@Autowired
	private Menu25Repository menu25Repository;
		
	public void test() {
		menu25Repository.test();
	}
	
	public Map<String, Object> create(BankAccountVo bavo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu25Repository.Nexist(bavo)) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  // create 되지 않음	
			return map;
		}
		if(menu25Repository.Yexist(bavo)){				// 삭제된 내용 중 중복된 카드넘버			
			bavo.setDepositNo(bavo.getDepositNo());
			menu25Repository.deleteAll(bavo);					// 삭제된 vo 삭제
		}
		
		int totalCnt = menu25Repository.selectCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt+1, 11, 5);
		
		map = menu25Repository.create(bavo, pagination);
		
		map.put("pagination", pagination);
		map.put("success", true);
		return map;
		
	}

	public Map<String, Object> update(BankAccountVo bavo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu25Repository.Nexist(bavo)) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  // create 되지 않음
			return map;
		}
		if(menu25Repository.Yexist(bavo)){				// 삭제된 내용 중 중복된 카드넘버			
			bavo.setDepositNo(bavo.getDepositNo());
			menu25Repository.deleteAll(bavo);					// 삭제된 vo 삭제
		}
		
		int totalCnt = menu25Repository.selectCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		map = menu25Repository.update(bavo, pagination);
		map.put("pagination", pagination);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> delete(BankAccountVo bavo, int page) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCnt = menu25Repository.selectCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt-1, 11, 5);
		
		map = menu25Repository.delete(bavo, pagination);
		map.put("pagination", pagination);
		map.put("success", true);
		return map;
		
	}

	public DataResult<BankAccountVo> list(int page) {
		DataResult<BankAccountVo> dataResult = new DataResult<BankAccountVo>();
		
		int totalCnt = menu25Repository.selectCount();
		System.out.println(totalCnt);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		List<BankAccountVo> list = menu25Repository.list(pagination);
		
		dataResult.setPagination(pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	public Map<String, Object> gets(String depositNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = menu25Repository.gets(depositNo);
		return map;
	}

	public Map<String, Object> read(BankAccountVo bavo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = menu25Repository.read(bavo);
		
		map.put("success", true);
		return map;
	}
}
