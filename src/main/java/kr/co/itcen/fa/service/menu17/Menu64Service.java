package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu64Repository;


/**
 * 
 * @author 유지훈
 * 손익계산서조회
 */

@Service
public class Menu64Service {
	
	@Autowired
	private Menu64Repository menu64Repository;
	
	public void test() {
		menu64Repository.test();
	}
}
