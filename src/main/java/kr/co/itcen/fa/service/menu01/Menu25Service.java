package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu25Repository;
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
	
	public Map<String, Object> create(BankAccountVo bavo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu25Repository.Nexist(bavo)) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  // create 되지 않음	
			return map;
		}
		if(menu25Repository.Yexist(bavo)){				// 삭제된 내용 중 중복된 카드넘버			
			bavo.setDepositNo(bavo.getDepositNo());
			menu25Repository.deleteAll(bavo);					// 삭제된 vo 삭제
		}
		
		// 중복성 검사 Query 만들어야함 (삭제후 똑같은것 재생성시 처리)
		map = menu25Repository.create(bavo);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> update(BankAccountVo bavo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu25Repository.Nexist(bavo)) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  // create 되지 않음
			return map;
		}
		if(menu25Repository.Yexist(bavo)){				// 삭제된 내용 중 중복된 카드넘버			
			bavo.setDepositNo(bavo.getDepositNo());
			menu25Repository.deleteAll(bavo);					// 삭제된 vo 삭제
		}
		
		// 중복성 검사 Query 만들어야함 (삭제후 똑같은것 재생성시 처리)
		
		map = menu25Repository.update(bavo);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> delete(BankAccountVo bavo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = menu25Repository.delete(bavo);
		return map;
	}

	public List<BankAccountVo> list() {
		// TODO Auto-generated method stub
		List<BankAccountVo> map = menu25Repository.list();
		return map;
	}
}
