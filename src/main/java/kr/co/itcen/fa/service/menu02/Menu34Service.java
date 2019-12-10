package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu34Repository;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 * @author 강민호
 * 매입품목현황조회
 *
 */

@Service
public class Menu34Service {
	@Autowired
	private Menu34Repository menu34Repository;

	public List<PurchaseitemVo> getPurchaseitemListall() {
		List<PurchaseitemVo> purchaseitemListall = menu34Repository.getPurchaseitemListall();
		
		return purchaseitemListall;
	}

	public List<PurchaseitemVo> getPurchaseitemList(int page_group) {
		page_group *= 55;
		
		List<PurchaseitemVo> purchaseitemList = menu34Repository.getPurchaseitemList(page_group);
		
		return purchaseitemList;
	}

	public List<PurchaseitemVo> getpagePurchaseitemList(int page) {
		List<PurchaseitemVo> pagepurchaseitemList = menu34Repository.getpagePurchaseitemList(page);
		
		return pagepurchaseitemList;
	}

	public List<SectionVo> getSectionList() {
		List<SectionVo> sectionList = menu34Repository.getSectionList();
		
		return sectionList;
	}

	public List<SectionVo> getFactorysectionList() {
		List<SectionVo> factoryList = menu34Repository.getFactorysectionList();
		
		return factoryList;
	}
}
