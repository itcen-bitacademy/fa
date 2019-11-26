package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu03Repository;

/**
 * 
 * @author 임성주
 * 전표관리
 *
 */
@Service
public class Menu03Service {
	
	@Autowired
	private Menu03Repository menu03Repository;
	
	public void test() {
		menu03Repository.test();
	}
}
