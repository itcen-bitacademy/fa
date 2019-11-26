package kr.co.itcen.fa.service.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu47Repository;

/**
 * 
 * @author 반현길
 * 단기차입금현황조회
 *
 */
@Service
public class Menu47Service {
	
	@Autowired
	private Menu47Repository menu47Repository;
	
	public void test() {
		menu47Repository.test();
	}
}
