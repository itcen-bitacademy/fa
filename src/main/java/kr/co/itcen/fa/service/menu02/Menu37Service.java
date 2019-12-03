package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu37Repository;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
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
	
	
	public void insert(BuyTaxbillVo vo) {
	
		menu37Repository.insert(vo);
		
	}

	public List<CustomerVo> customerList() {
		List<CustomerVo> customerList = menu37Repository.customerList();
		return customerList;
	}

	public List<BankAccountVo> customerBankList() {
		List<BankAccountVo> customerBankList = menu37Repository.customerBankList();
		return customerBankList;
	}
}
