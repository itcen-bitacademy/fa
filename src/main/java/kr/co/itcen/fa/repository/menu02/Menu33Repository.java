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
	
	public List<PurchaseitemVo> getPurchaseitemList() {
		List<PurchaseitemVo> purchaseitemList = sqlSession.selectList("menu33.getpurchaseitemlist");
		
		return purchaseitemList;
	}
	
	public List<SectionVo> getSectionList() {
		List<SectionVo> sectionList = sqlSession.selectList("menu33.getsectionlist");
		
		return sectionList;
	}
	
	public List<SectionVo> getFactorysectionList() {
		List<SectionVo> factoryList = sqlSession.selectList("menu33.getFactorysectionList");
		
		return factoryList;
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
}




