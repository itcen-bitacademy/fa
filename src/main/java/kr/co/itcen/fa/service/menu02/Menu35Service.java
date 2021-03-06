package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu35Repository;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
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
	
//	public List<CustomerVo> list() {
//		return menu35Repository.getList();
//	}
	
	public void insert(CustomerVo vo) {
		if(vo.getOpenDate() == "") {
			vo.setOpenDate(null);
		}
		menu35Repository.insert(vo);
	}
	
	public void update(CustomerVo vo) {
		menu35Repository.update(vo);
	}
	
	public void delete(List<String> checkNoArr) {
		menu35Repository.delete(checkNoArr);
	}
	
	public List<CustomerVo> search(String no) {
		return menu35Repository.search(no);
	}
	
	public void updateBankAccount(BankAccountVo bankAccount) {
		menu35Repository.updateBankAccount(bankAccount);
	   }
	
	public Boolean existCustomer(String no) {
		return menu35Repository.getCustomer(no) != null;
	}
}
