package kr.co.itcen.fa.repository.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu02.FactoryVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 *  @author 강민호
 *  매입품목관리
 */

@Repository
public class Menu33Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void add(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		sqlSession.insert("menu33.purchaseitemadd", purchaseitemVo);
		sqlSession.insert("menu33.factoryadd", factoryVo);
	}

	public void update(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		String purchaseNo = purchaseitemVo.getNo();
		
		String origin_factorycode = sqlSession.selectOne("menu33.originfactorycode", purchaseNo);
		factoryVo.setOriginNo(origin_factorycode);
		
		sqlSession.update("menu33.purchaseitemupdate", purchaseitemVo);
		sqlSession.update("menu33.factoryupdate", factoryVo);
	}

	public void delete(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		purchaseitemVo.setDeleteflag("Y");
		factoryVo.setDeleteflag("Y");
		sqlSession.update("menu33.purchaseitemdelete", purchaseitemVo);
		sqlSession.update("menu33.factorydelete", factoryVo);
	}

	public PurchaseitemVo searchpurchaseitem(String no) {
		PurchaseitemVo purchaseitemVo = sqlSession.selectOne("menu33.searchpurchaseitem", no);
		
		return purchaseitemVo;
	}
	
	public FactoryVo searchfactory(String purchaseitem_code, String factory_code) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("purchaseitemcode", purchaseitem_code);
		map.put("factorycode", factory_code);
		FactoryVo factoryVo = sqlSession.selectOne("menu33.searchfactory", map);
		
		return factoryVo;
	}
	
	public SectionVo searchsection(String no) {
		SectionVo sectionVo = sqlSession.selectOne("menu33.searchsection", no);
		
		return sectionVo;
	}
	
	public List<PurchaseitemVo> getPurchaseitemList(int page_group) {
		page_group *= 55;
		
		List<PurchaseitemVo> purchaseitemList = sqlSession.selectList("menu33.getpurchaseitemlist", page_group);
		
		return purchaseitemList;
	}
	
	public List<SectionVo> getsearchSectionList(String sectionname) {
		sectionname = "%" + sectionname + "%";
		
		List<SectionVo> searchsectionList = sqlSession.selectList("menu33.getsearchsectionlist", sectionname);
		
		return searchsectionList;
	}

	public List<PurchaseitemVo> getpagePurchaseitemList(int page) {
		page = (page-1)*11;
		
		List<PurchaseitemVo> pagepurchaseitemList = sqlSession.selectList("menu33.getpagePurchaseitemList", page);
		
		return pagepurchaseitemList;
	}

	public List<PurchaseitemVo> getPurchaseitemListall() {
		List<PurchaseitemVo> purchaseitemListall = sqlSession.selectList("menu33.getPurchaseitemListall");
		
		return purchaseitemListall;
	}

	public List<SectionVo> getSectionListall(String searchdata) {
		List<SectionVo> sectionListall = sqlSession.selectList("menu33.getSectionListall", searchdata);
		
		return sectionListall;
	}
	
	public List<SectionVo> getSectionList(int section_page_group, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		section_page_group *= 30;
		
		map.put("section_page_group", section_page_group);
		map.put("searchdata", searchdata);
		
		List<SectionVo> sectionList = sqlSession.selectList("menu33.getSectionList", map);
		
		return sectionList;
	}

	public List<SectionVo> getpageSectionList(int section_page, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		section_page = (section_page-1)*6;
		
		map.put("section_page", section_page);
		map.put("searchdata", searchdata);
		
		List<SectionVo> pagesectionList = sqlSession.selectList("menu33.getpageSectionList", map);
		
		return pagesectionList;
	}
	
	public List<SectionVo> getFactoryListall(String searchdata) {
		List<SectionVo> factoryListall = sqlSession.selectList("menu33.getFactoryListall", searchdata);
		
		return factoryListall;
	}

	public List<SectionVo> getFactoryList(int factory_page_group, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		factory_page_group *= 30;
		
		map.put("factory_page_group", factory_page_group);
		map.put("searchdata", searchdata);
		
		List<SectionVo> factoryList = sqlSession.selectList("menu33.getFactoryList", map);
		
		return factoryList;
	}

	public List<SectionVo> getpageFactoryList(int factory_page, String searchdata) {
		Map<String, Object> map = new HashMap<String, Object>();
		factory_page = (factory_page-1)*6;
		
		map.put("factory_page", factory_page);
		map.put("searchdata", searchdata);
		
		List<SectionVo> pagefactoryList = sqlSession.selectList("menu33.getpageFactoryList", map);
		
		return pagefactoryList;
	}

	public int getcheckNo(String checkNo) {
		int count = sqlSession.selectOne("menu33.getcheckNo", checkNo);

		return count;
	}

	public int getcheckNodeleteX(String no) {
		int count = sqlSession.selectOne("menu33.getcheckNodeleteX", no);
		return count;
	}
	
}




