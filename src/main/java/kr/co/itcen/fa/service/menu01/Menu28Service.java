package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu28Repository;

/**
 * 
 * @author 이종윤
 * 거래처 현황 조회
 *
 */

@Service
public class Menu28Service {
	@Autowired
	private Menu28Repository menu28Repository;

	public void test() {
		menu28Repository.test();
	}

}
