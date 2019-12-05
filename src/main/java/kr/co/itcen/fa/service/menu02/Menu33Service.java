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
	
	public FactoryVo searchfactory(String factory_code) {
		FactoryVo factoryVo = menu33Repository.searchfactory(factory_code);
		
		return factoryVo;
	}
	
	public SectionVo searchsection(String section_code) {
		SectionVo sectionVo = menu33Repository.searchsection(section_code);
		
		return sectionVo;
	}
	
	public List<PurchaseitemVo> getPurchaseitemList() {
		List<PurchaseitemVo> purchaseitemList = menu33Repository.getPurchaseitemList();
		
		return purchaseitemList;
	}

	public List<SectionVo> getSectionList() {
		List<SectionVo> sectionList = menu33Repository.getSectionList();
		
		return sectionList;
	}

	public List<SectionVo> getsearchSectionList(String sectionname) {
		List<SectionVo> searchsectionList = menu33Repository.getsearchSectionList(sectionname);
		
		return searchsectionList;
	}

	public List<PurchaseitemVo> getpagePurchaseitemList(int page) {
		List<PurchaseitemVo> pagepurchaseitemList = menu33Repository.getpagePurchaseitemList(page);
		
		return pagepurchaseitemList;
	}

	

	
}
