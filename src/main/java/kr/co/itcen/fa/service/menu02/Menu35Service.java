package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu35Repository;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이지은
 * 매입거래처관리
 *
 */

@Service
public class Menu35Service {
	@Autowired
	private Menu35Repository menu35Repository;
	
//	public void test() {
//		menu35Repository.test();
//	}
	
	public List<CustomerVo> list() {
		return menu35Repository.getList();
	}
	
	public void insert(CustomerVo vo) {
		menu35Repository.insert(vo);
	}
}
