package kr.co.itcen.fa.repository.menu02;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillListVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이제구 매입세금계산서현황조회
 *
 */

@Repository
public class Menu38Repository {
	@Autowired
	private SqlSession sqlSession;

	public List<CustomerVo> getMatchTaxbillCustomerList() {
		List<CustomerVo> getMatchTaxbillCustomerList = sqlSession.selectList("menu38.getMatchTaxbillCustomerList");
		return getMatchTaxbillCustomerList;
	}

	public List<BuyTaxbillItemsVo> getMatchTaxbillItemsList() {
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = sqlSession.selectList("menu38.getMatchTaxbillItemsList");
		return getMatchTaxbillItemsList;
	}

	public List<BuyTaxbillVo> getSelectedBuyTaxbillListAll(BuyTaxbillListVo buyTaxbillListVo) {
		List<BuyTaxbillVo> getSelectedBuyTaxbillList = sqlSession.selectList("menu38.getSelectedBuyTaxbillListAll",
				buyTaxbillListVo);
		return getSelectedBuyTaxbillList;
	}

	public List<BuyTaxbillVo> getBuyTaxbillAll() {
		return sqlSession.selectList("menu38.getBuyTaxbillAll");
	}

	public List<BuyTaxbillVo> getBuyTaxbillList(int page_group) {
		return sqlSession.selectList("menu38.getBuyTaxbillList", page_group);
	}

	public List<BuyTaxbillVo> getpageBuyTaxbillList(int page) {
		page = (page - 1) * 11;

		return sqlSession.selectList("menu38.getpageBuyTaxbillList", page);
	}

	public List<BuyTaxbillVo> getSelectedBuyTaxbillList(BuyTaxbillListVo buyTaxbillListVo) {

		return sqlSession.selectList("menu38.getSelectedBuyTaxbillList", buyTaxbillListVo);
	}

	public List<BuyTaxbillVo> getSelectedpageBuyTaxbillList(BuyTaxbillListVo buyTaxbillListVo) {

		int page = buyTaxbillListVo.getPage();
		page = (page - 1) * 11;
		buyTaxbillListVo.setPage(page);

		return sqlSession.selectList("menu38.getSelectedpageBuyTaxbillList", buyTaxbillListVo);
	}
}