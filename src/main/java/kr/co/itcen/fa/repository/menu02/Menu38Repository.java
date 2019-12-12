package kr.co.itcen.fa.repository.menu02;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillListVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 윤종진
 * 매입세금계산서현황조회
 *
 */

@Repository
public class Menu38Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public List<BuyTaxbillVo> getAllBuyTaxbill() {
		 List<BuyTaxbillVo> getAllBuyTaxbill = sqlSession.selectList("menu38.getAllBuyTaxbill");
		return getAllBuyTaxbill;
	}

	public List<CustomerVo> getMatchTaxbillCustomerList() {
		List<CustomerVo> getMatchTaxbillCustomerList = sqlSession.selectList("menu38.getMatchTaxbillCustomerList");
		return getMatchTaxbillCustomerList;
	}

	public List<BuyTaxbillItemsVo> getMatchTaxbillItemsList() {
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = sqlSession.selectList("menu38.getMatchTaxbillItemsList");
		return getMatchTaxbillItemsList;
	}

	public List<BuyTaxbillVo> getSelectedBuyTaxbillList(BuyTaxbillListVo buyTaxbillListVo) {
		List<BuyTaxbillVo> getSelectedBuyTaxbillList = sqlSession.selectList("menu38.getSelectedBuyTaxbillList", buyTaxbillListVo);
		return getSelectedBuyTaxbillList;
	}
}
