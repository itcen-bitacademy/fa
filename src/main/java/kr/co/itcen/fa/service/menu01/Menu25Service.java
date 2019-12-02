package kr.co.itcen.fa.service.menu01;

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
	
	public void create(BankAccountVo bavo) {
		menu25Repository.create(bavo);
	}
}
