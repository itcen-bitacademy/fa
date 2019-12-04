package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu14Repository;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 김현곤
 * 매출현황조회
 *
 */

@Service
public class Menu14Service {
	@Autowired
	private Menu14Repository menu14Repository;

	public List<SalesVo> getList() {
		return menu14Repository.getList();
	}

	public List<SalesVo> getSerchList(SalesVo vo) {
		return menu14Repository.getSerchList(vo);
	}

	public List<CustomerVo> getCustomerList() {
		return menu14Repository.getCustomerList();
	}

	public List<PurchaseitemVo> getItemList() {
		return menu14Repository.getItemList();
	}
}
