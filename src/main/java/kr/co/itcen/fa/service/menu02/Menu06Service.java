package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu06Repository;
import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;

/**
 * 
 * @author 윤종진
 * 매입관리
 *
 */

@Service
public class Menu06Service {
	@Autowired
	private Menu06Repository menu06Repository;
	
	public void test() {
		menu06Repository.test();
	}

	public void insert(PurchasemanagementVo vo) {
		menu06Repository.insert(vo);
	}

	public List<PurchaseitemVo> getItemList() {
		
		return menu06Repository.getItemList();
	}

	public List<CustomerVo> getCustomerList() {
		return menu06Repository.getCustomerList();
	}

	public PurchasemanagementVo getList(PurchasemanagementVo vo) {
		return menu06Repository.getList(vo);
	}

	public void update(PurchasemanagementVo vo) {
		menu06Repository.update(vo);
	}

	public void delete(PurchasemanagementVo vo) {
		menu06Repository.delete(vo);
		
	}
}
