package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu25Repository;
import kr.co.itcen.fa.repository.menu01.Menu30Repository;

/**
 * 
 * @author 김승곤
 * 계정거래처명세서조회
 *
 */
@Service
public class Menu30Service {
	
	@Autowired
	private Menu30Repository menu30Repository;
	
	public void test() {
		menu30Repository.test();
	}
}
