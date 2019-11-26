package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu38Repository;

/**
 * 
 * @author 윤종진
 * 매입세금계산서현황조회
 *
 */

@Service
public class Menu38Service {
	@Autowired
	private Menu38Repository menu38Repository;
	
	public void test() {
		menu38Repository.test();
	}
}
