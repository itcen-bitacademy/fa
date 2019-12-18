package kr.co.itcen.fa.repository.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 * @author 강민호
 * 매입품목현황조회
 *
 */

@Repository
public class Menu34Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public String isEmpty(String data) {
		if(data == null || data.length() < 1) {
			return "";
		} else {
			return data;
		}
	}
	
	public List<PurchaseitemVo> getPurchaseitemListall(PurchaseitemVo purchaseitemVo, Map<String, Object> bet_map) {
		Map<String, Object> map = new HashMap<String, Object>();
		String deleteflag = purchaseitemVo.getDeleteflag();
		
		String no = "%" + isEmpty(purchaseitemVo.getNo()) + "%";
		String name = "%" + isEmpty(purchaseitemVo.getName()) + "%";
		String sectionname = "%" + isEmpty(purchaseitemVo.getSectionname()) + "%";
		String sectioncode = "%" + isEmpty(purchaseitemVo.getSectioncode()) + "%";
		String factoryname = "%" + isEmpty(purchaseitemVo.getFactoryname()) + "%";
		String factorycode = "%" + isEmpty(purchaseitemVo.getFactorycode()) + "%";
		
		map.put("no", no);
		map.put("name", name);
		map.put("sectionname", sectionname);
		map.put("sectioncode", sectioncode);
		map.put("factoryname", factoryname);
		map.put("factorycode", factorycode);
		map.put("deleteflag", deleteflag);
		map.put("price_start", bet_map.get("price_start"));
		map.put("price_end", bet_map.get("price_end"));
		map.put("producedate_start", bet_map.get("producedate_start"));
		map.put("producedate_end", bet_map.get("producedate_end"));
		
		List<PurchaseitemVo> purchaseitemListall = sqlSession.selectList("menu34.getPurchaseitemListall", map);
		
		return purchaseitemListall;
	}

	public List<PurchaseitemVo> getPurchaseitemList(int page_group, PurchaseitemVo purchaseitemVo, Map<String, Object> bet_map) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		page_group *= 55;
		String deleteflag = purchaseitemVo.getDeleteflag();
		String no = "%" + isEmpty(purchaseitemVo.getNo()) + "%";
		String name = "%" + isEmpty(purchaseitemVo.getName()) + "%";
		String sectionname = "%" + isEmpty(purchaseitemVo.getSectionname()) + "%";
		String sectioncode = "%" + isEmpty(purchaseitemVo.getSectioncode()) + "%";
		String factoryname = "%" + isEmpty(purchaseitemVo.getFactoryname()) + "%";
		String factorycode = "%" + isEmpty(purchaseitemVo.getFactorycode()) + "%";
		
		map.put("page_group", page_group);
		map.put("no", no);
		map.put("name", name);
		map.put("sectionname", sectionname);
		map.put("sectioncode", sectioncode);
		map.put("factoryname", factoryname);
		map.put("factorycode", factorycode);
		map.put("deleteflag", deleteflag);
		map.put("price_start", bet_map.get("price_start"));
		map.put("price_end", bet_map.get("price_end"));
		map.put("producedate_start", bet_map.get("producedate_start"));
		map.put("producedate_end", bet_map.get("producedate_end"));
		
		List<PurchaseitemVo> purchaseitemList = sqlSession.selectList("menu34.getPurchaseitemList", map);
		
		return purchaseitemList;
	}

	public List<PurchaseitemVo> getpagePurchaseitemList(int page, PurchaseitemVo purchaseitemVo, Map<String, Object> bet_map) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		page = (page-1)*11;
		String deleteflag = purchaseitemVo.getDeleteflag();
		String no = "%" + isEmpty(purchaseitemVo.getNo()) + "%";
		String name = "%" + isEmpty(purchaseitemVo.getName()) + "%";
		String sectionname = "%" + isEmpty(purchaseitemVo.getSectionname()) + "%";
		String sectioncode = "%" + isEmpty(purchaseitemVo.getSectioncode()) + "%";
		String factoryname = "%" + isEmpty(purchaseitemVo.getFactoryname()) + "%";
		String factorycode = "%" + isEmpty(purchaseitemVo.getFactorycode()) + "%";
		
		map.put("page", page);
		map.put("no", no);
		map.put("name", name);
		map.put("sectionname", sectionname);
		map.put("sectioncode", sectioncode);
		map.put("factoryname", factoryname);
		map.put("factorycode", factorycode);
		map.put("deleteflag", deleteflag);
		map.put("price_start", bet_map.get("price_start"));
		map.put("price_end", bet_map.get("price_end"));
		map.put("producedate_start", bet_map.get("producedate_start"));
		map.put("producedate_end", bet_map.get("producedate_end"));
		
		List<PurchaseitemVo> pagepurchaseitemList = sqlSession.selectList("menu34.getpagePurchaseitemList", map);
		
		return pagepurchaseitemList;
	}

	public List<SectionVo> getSectionListall(String searchdata) {
		List<SectionVo> sectionListall = sqlSession.selectList("menu34.getSectionListall", searchdata);
		
		return sectionListall;
	}
	
	public List<SectionVo> getSectionList(int section_page_group, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		section_page_group *= 30;
		
		map.put("section_page_group", section_page_group);
		map.put("searchdata", searchdata);
		
		List<SectionVo> sectionList = sqlSession.selectList("menu34.getSectionList", map);
		
		return sectionList;
	}

	public List<SectionVo> getpageSectionList(int section_page, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		section_page = (section_page-1)*6;
		
		map.put("section_page", section_page);
		map.put("searchdata", searchdata);
		
		List<SectionVo> pagesectionList = sqlSession.selectList("menu34.getpageSectionList", map);
		
		return pagesectionList;
	}

	public List<SectionVo> getFactoryListall(String searchdata) {
		List<SectionVo> factoryListall = sqlSession.selectList("menu34.getFactoryListall", searchdata);
		
		return factoryListall;
	}

	public List<SectionVo> getFactoryList(int factory_page_group, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		factory_page_group *= 30;
		
		map.put("factory_page_group", factory_page_group);
		map.put("searchdata", searchdata);
		
		List<SectionVo> factoryList = sqlSession.selectList("menu34.getFactoryList", map);
		
		return factoryList;
	}

	public List<SectionVo> getpageFactoryList(int factory_page, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		factory_page = (factory_page-1)*6;
		
		map.put("factory_page", factory_page);
		map.put("searchdata", searchdata);
		
		List<SectionVo> pagefactoryList = sqlSession.selectList("menu34.getpageFactoryList", map);
		
		return pagefactoryList;
	}
}
