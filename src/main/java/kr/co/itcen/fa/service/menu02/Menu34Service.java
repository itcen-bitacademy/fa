package kr.co.itcen.fa.service.menu02;

import java.util.List;
import java.util.Map;

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

	public List<PurchaseitemVo> getPurchaseitemListall(PurchaseitemVo purchaseitemVo, Map<String, Object> bet_map) {
		List<PurchaseitemVo> purchaseitemListall = menu34Repository.getPurchaseitemListall(purchaseitemVo, bet_map);
		
		return purchaseitemListall;
	}

	public List<PurchaseitemVo> getPurchaseitemList(int page_group, PurchaseitemVo purchaseitemVo, Map<String, Object> bet_map) {
		List<PurchaseitemVo> purchaseitemList = menu34Repository.getPurchaseitemList(page_group, purchaseitemVo, bet_map);
		
		return purchaseitemList;
	}

	public List<PurchaseitemVo> getpagePurchaseitemList(int page, PurchaseitemVo purchaseitemVo, Map<String, Object> bet_map) {
		List<PurchaseitemVo> pagepurchaseitemList = menu34Repository.getpagePurchaseitemList(page, purchaseitemVo, bet_map);
		
		return pagepurchaseitemList;
	}

	public List<SectionVo> getSectionListall(String searchdata) {
		List<SectionVo> sectionListall = menu34Repository.getSectionListall(searchdata);
		
		return sectionListall;
	}
	
	public List<SectionVo> getSectionList(int section_page_group, String searchdata) {
		List<SectionVo> sectionList = menu34Repository.getSectionList(section_page_group, searchdata);
		
		return sectionList;
	}
	
	public List<SectionVo> getpageSectionList(int section_page, String searchdata) {
		List<SectionVo> pagesectionList = menu34Repository.getpageSectionList(section_page, searchdata);
		
		return pagesectionList;
	}

	public List<SectionVo> getFactoryListall(String searchdata) {
		List<SectionVo> factoryListall = menu34Repository.getFactoryListall(searchdata);
		
		return factoryListall;
	}

	public List<SectionVo> getFactoryList(int factory_page_group, String searchdata) {
		List<SectionVo> factoryList = menu34Repository.getFactoryList(factory_page_group, searchdata);
		
		return factoryList;
	}

	public List<SectionVo> getpageFactoryList(int factory_page, String searchdata) {
		List<SectionVo> pagefactoryList = menu34Repository.getpageFactoryList(factory_page, searchdata);
		
		return pagefactoryList;
	}
}
