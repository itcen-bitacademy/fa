package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu24Repository;
import kr.co.itcen.fa.repository.menu01.Menu25Repository;

/**
 * 
 * @author 김승곤
 * 카드현황조회
 *
 */
@Service
public class Menu24Service {
	
	@Autowired
	private Menu24Repository menu24Repository;
	
	public void test() {
		menu24Repository.test();
	}
}
