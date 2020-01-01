package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu37Repository;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이제구
 * 매입세금계산서관리
 *
 */

@Service
public class Menu37Service {
	@Autowired
	private Menu37Repository menu37Repository;
	
	public void insertTax(BuyTaxbillVo vo) {
		menu37Repository.insertTax(vo);
	}
	public void insertItem(BuyTaxbillItemsVo vo) {
		menu37Repository.insertItem(vo);
	}

	public List<CustomerVo> customerList() {
		List<CustomerVo> customerList = menu37Repository.customerList();
		return customerList;
	}

	public List<BankAccountVo> customerBankList() {
		List<BankAccountVo> customerBankList = menu37Repository.customerBankList();
		return customerBankList;
	}
	public BuyTaxbillVo getAboutNoData(String no) {
		BuyTaxbillVo getAboutNoData = menu37Repository.getAboutNoData(no);
		return getAboutNoData;
	}
	public CustomerVo getAboutNoCustomerData(String companyName) {
		CustomerVo getAboutNoCustomerData = menu37Repository.getAboutNoCustomerData(companyName);
		return getAboutNoCustomerData;
	}
	public BankAccountVo getAboutNoBankData(String depositNo) {
		BankAccountVo getAboutNoBankData = menu37Repository.getAboutNoBankData(depositNo);
		return getAboutNoBankData;
	}
	public List<BuyTaxbillItemsVo> getAboutItmes(String no) {
		List<BuyTaxbillItemsVo> getAboutItmes = menu37Repository.getAboutItmes(no);
		return getAboutItmes;
	}
	public void taxbillDelete(String no) {
		menu37Repository.taxbillDelete(no);
	}
	public void taxbillItemDelete(String no) {
		menu37Repository.taxbillItemDelete(no);
		
	}
	public void taxbillUpdateDelete(String no) {
		menu37Repository.taxbillUpdateDelete(no);
		
	}
	public void taxbillItemsUpdateDelete(String no) {
		menu37Repository.taxbillItemsUpdateDelete(no);
		
	}
	public void insertUpdatedTax(BuyTaxbillVo vo) {
		menu37Repository.insertUpdatedTax(vo);
		
	}
	public void insertUpdatedItem(BuyTaxbillItemsVo buyTaxbillItemsVo) {
		menu37Repository.insertUpdatedItem(buyTaxbillItemsVo);
		
	}
}
