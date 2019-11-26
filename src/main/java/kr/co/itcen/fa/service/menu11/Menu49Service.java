package kr.co.itcen.fa.service.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu49Repository;

/**
 * 
 * @author 김준호
 * 장기차입금현황조회
 *
 */
@Service
public class Menu49Service {
	
	@Autowired
	private Menu49Repository menu49Repository;
	
	public void test() {
		menu49Repository.test();
	}
}
