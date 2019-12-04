package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu04Repository;

/**
 * 
 * @author 임성주
 * 전표현황조회
 *
 */
@Service
public class Menu04Service {
	
	@Autowired
	private Menu04Repository menu04Repository;
	
	public void test() {
		menu04Repository.test();
	}
}
