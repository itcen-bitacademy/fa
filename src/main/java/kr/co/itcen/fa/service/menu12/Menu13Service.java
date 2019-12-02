package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu13Repository;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */

@Service
public class Menu13Service {
	@Autowired
	private Menu13Repository menu13Repository;

	public void insert(List<SalesVo> list) {
		menu13Repository.insert(list);
	}
	public List<CustomerVo> getCustomerList() {
		return menu13Repository.getCustomerList();
	}
	public List<PurchaseitemVo> getItemList() {
		return menu13Repository.getItemList();
	}

}
