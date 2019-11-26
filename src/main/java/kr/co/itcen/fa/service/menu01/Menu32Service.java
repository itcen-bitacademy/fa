package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu32Repository;

/**
 * 
 * @author 이종윤 
 * 거래처관리
 *
 */

@Service
public class Menu32Service {
	@Autowired
	private Menu32Repository menu32Repository;

	public void test() {
		menu32Repository.test();
	}

}
