package kr.co.itcen.fa.service.menu01;

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
		// 중복성 검사 Query 만들어야함 (삭제후 똑같은것 재생성시 처리)
		Map<String, Object> map = menu25Repository.create(bavo);
		return map;
	}

	public void update(BankAccountVo bavo) {
		// 중복성 검사 Query 만들어야함 (삭제후 똑같은것 재생성시 처리)
		
		
		menu25Repository.update(bavo);
	}

	public void delete(BankAccountVo bavo) {
		// TODO Auto-generated method stub
		menu25Repository.delete(bavo);
	}

	public List<BankAccountVo> list() {
		// TODO Auto-generated method stub
		return menu25Repository.list();
	}
}
