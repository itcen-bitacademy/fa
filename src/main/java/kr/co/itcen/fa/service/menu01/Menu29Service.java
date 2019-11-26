package kr.co.itcen.fa.service.menu01;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu29Repository;

/**
 * 
 * @author 황슬기 
 * 계좌조회
 *
 */
@Service
public class Menu29Service {
	
	@Autowired
	private Menu29Repository menu29Repository;
	
	public void test() {
		menu29Repository.test();
	}
}