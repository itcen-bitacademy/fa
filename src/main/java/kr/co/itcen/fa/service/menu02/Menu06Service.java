package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu06Repository;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
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
	
	public List<PurchasemanagementVo> getSearchList(PurchasemanagementVo vo) {
		return menu06Repository.getSearchList(vo);
	}

	public void update(PurchasemanagementVo vo) {
		menu06Repository.update(vo);
	}

	public void delete(PurchasemanagementVo vo) {
		menu06Repository.delete(vo);
		
	}

//	public BuyTaxbillVo getTaxbillList(PurchasemanagementVo vo) {
//		return menu06Repository.getTaxbillList(vo);
//	}

	public CustomerVo getAccount(PurchasemanagementVo vo) {
		
		return menu06Repository.getAccount(vo);
	}

	public void voucherUpdate(PurchasemanagementVo vo) {
		menu06Repository.voucherUpdate(vo);
	}

	public Long getVoucherNo(PurchasemanagementVo vo) {
		
		return menu06Repository.getVoucherNo(vo);
	}

	public void TaxbillUpdate(PurchasemanagementVo vo) {
		menu06Repository.TaxbillUpdate(vo);
		
	}

	public List<PurchasemanagementVo> getPriceList(PurchasemanagementVo vo) {
		
		return menu06Repository.getPriceList(vo);
	}

	public void taxbillDelete(PurchasemanagementVo vo) {
		
		menu06Repository.taxbillDelete(vo);
	}
}
