package kr.co.itcen.fa.service.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu33Repository;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu02.FactoryVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;


/**
 * 
 * @author 강민호
 * 매입품목관리
 *
 */

@Service
public class Menu33Service {
	
	@Autowired
	private Menu33Repository menu33Repository;
	
	public void add(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		menu33Repository.add(purchaseitemVo, factoryVo);
	}
	
	public void update(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		menu33Repository.update(purchaseitemVo, factoryVo);
	}

	public void delete(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		menu33Repository.delete(purchaseitemVo, factoryVo);
	}

	public PurchaseitemVo searchpurchaseitem(String no) {
		PurchaseitemVo purchaseitemVo = menu33Repository.searchpurchaseitem(no);
		
		return purchaseitemVo;
	}
	
	public FactoryVo searchfactory(String purchaseitem_code, String factory_code) {
		FactoryVo factoryVo = menu33Repository.searchfactory(purchaseitem_code, factory_code);
		
		return factoryVo;
	}
	
	public SectionVo searchsection(String section_code) {
		SectionVo sectionVo = menu33Repository.searchsection(section_code);
		
		return sectionVo;
	}
	
	public List<PurchaseitemVo> getPurchaseitemList(int page_group) {
		List<PurchaseitemVo> purchaseitemList = menu33Repository.getPurchaseitemList(page_group);
		
		return purchaseitemList;
	}
	
	public List<SectionVo> getsearchSectionList(String sectionname) {
		List<SectionVo> searchsectionList = menu33Repository.getsearchSectionList(sectionname);
		
		return searchsectionList;
	}

	public List<PurchaseitemVo> getpagePurchaseitemList(int page) {
		List<PurchaseitemVo> pagepurchaseitemList = menu33Repository.getpagePurchaseitemList(page);
		
		return pagepurchaseitemList;
	}

	public List<PurchaseitemVo> getPurchaseitemListall() {
		List<PurchaseitemVo> purchaseitemListall = menu33Repository.getPurchaseitemListall();
		
		return purchaseitemListall;
	}

	public List<SectionVo> getSectionListall(String searchdata) {
		List<SectionVo> sectionListall = menu33Repository.getSectionListall(searchdata);
		
		return sectionListall;
	}
	
	public List<SectionVo> getSectionList(int section_page_group, String searchdata) {
		List<SectionVo> sectionList = menu33Repository.getSectionList(section_page_group, searchdata);
		
		return sectionList;
	}
	
	public List<SectionVo> getpageSectionList(int section_page, String searchdata) {
		List<SectionVo> pagesectionList = menu33Repository.getpageSectionList(section_page, searchdata);
		
		return pagesectionList;
	}

	public List<SectionVo> getFactoryListall(String searchdata) {
		List<SectionVo> factoryListall = menu33Repository.getFactoryListall(searchdata);
		
		return factoryListall;
	}

	public List<SectionVo> getFactoryList(int factory_page_group, String searchdata) {
		List<SectionVo> factoryList = menu33Repository.getFactoryList(factory_page_group, searchdata);
		
		return factoryList;
	}

	public List<SectionVo> getpageFactoryList(int factory_page, String searchdata) {
		List<SectionVo> pagefactoryList = menu33Repository.getpageFactoryList(factory_page, searchdata);
		
		return pagefactoryList;
	}

	public int getcheckNo(String checkNo) {
		int check = menu33Repository.getcheckNo(checkNo);
		
		return check;
	}

	public int getcheckNodeleteX(String no) {
		int check = menu33Repository.getcheckNodeleteX(no);
		
		return check;
	}
	

	

	
}
