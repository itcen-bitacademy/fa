package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu32Repository;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

/**
 * 
 * @author 이종윤 
 * 거래처관리
 *
 */

@Service
public class Menu32Service {
	@Autowired
	private Menu32Repository menu32Repository;

	public void test() {
		menu32Repository.test();
	}

	public List<CustomerVo> getCustomerNoInfo(String customerNo) {
		return menu32Repository.getCustomerNoInfo(customerNo);
	}

	public List<CustomerVo> getCustomerNameInfo(String customerName) {
		return menu32Repository.getCustomerNameInfo(customerName);
	}

}
