package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu27Repository;

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

}
