package kr.co.itcen.fa.repository.menu02;

import java.util.List;

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
	
	public List<PurchaseitemVo> getPurchaseitemListall() {
		List<PurchaseitemVo> purchaseitemListall = sqlSession.selectList("menu34.getPurchaseitemListall");
		
		return purchaseitemListall;
	}

	public List<PurchaseitemVo> getPurchaseitemList(int page_group) {
		List<PurchaseitemVo> purchaseitemList = sqlSession.selectList("menu34.getPurchaseitemList", page_group);
		
		return purchaseitemList;
	}

	public List<PurchaseitemVo> getpagePurchaseitemList(int page) {
		page = (page-1)*11;
		
		List<PurchaseitemVo> pagepurchaseitemList = sqlSession.selectList("menu34.getpagePurchaseitemList", page);
		
		return pagepurchaseitemList;
	}

	public List<SectionVo> getSectionList() {
		List<SectionVo> sectionList = sqlSession.selectList("menu34.getSectionList");
		
		return sectionList;
	}

	public List<SectionVo> getFactorysectionList() {
		List<SectionVo> factoryList = sqlSession.selectList("menu34.getFactorysectionList");
		
		return factoryList;
	}
}
