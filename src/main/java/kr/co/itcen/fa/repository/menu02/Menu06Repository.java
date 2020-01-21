package kr.co.itcen.fa.repository.menu02;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;
import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 윤종진
 * 매입관리
 *
 */

@Repository
public class Menu06Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("zxcvb123"); // 이름
		
		sqlSession.insert("menu06.save", testVo);
	}

	public Boolean insert(PurchasemanagementVo vo) {
		int count = sqlSession.insert("menu06.insert", vo);
		return count == 1;
		
	}

	public List<PurchaseitemVo> getItemList() {
		List<PurchaseitemVo> result = sqlSession.selectList("menu06.getItemList");
		return result;
	}

	public List<CustomerVo> getCustomerList() {
		List<CustomerVo> result = sqlSession.selectList("menu06.getCustomerList");
		return result;
	}

	public PurchasemanagementVo getList(PurchasemanagementVo vo) {
		PurchasemanagementVo result = sqlSession.selectOne("menu06.getList",vo);
		return result;
	}

	public Boolean update(PurchasemanagementVo vo) {
		int count = sqlSession.update("menu06.update", vo); //insert -> update
		return count == 1;
	}
	
//	public Boolean voucherUpdate(PurchasemanagementVo vo) {
//		int count = sqlSession.update("menu06.voucherUpdate", vo);
//		return count == 1;
//	}

	public Boolean delete(PurchasemanagementVo vo) {
		int count = sqlSession.insert("menu06.delete", vo);
		return count == 1;
	}

//	public BuyTaxbillVo getTaxbillList(PurchasemanagementVo vo) {
//		BuyTaxbillVo result = sqlSession.selectOne("menu06.getTaxbillList",vo);
//		return result;
//	}

	public CustomerVo getAccount(PurchasemanagementVo vo) {
		CustomerVo result = sqlSession.selectOne("menu06.getAccount",vo);
		return result;
	}

	public void voucherUpdate(PurchasemanagementVo vo) {
		sqlSession.update("menu06.voucherUpdate", vo);
	}

	public Long getVoucherNo(PurchasemanagementVo vo) {
		return sqlSession.selectOne("menu06.getVoucherNo",vo);
	}

	public void TaxbillUpdate(PurchasemanagementVo vo) {
		sqlSession.update("menu06.TaxbillUpdate", vo);
		
	}

	public List<PurchasemanagementVo> getPriceList(PurchasemanagementVo vo) {
		return sqlSession.selectList("menu06.getPriceList",vo);
	}

	public List<PurchasemanagementVo> getSearchList(PurchasemanagementVo vo) {
		return sqlSession.selectList("menu06.getSearchList",vo);
	}

	public void taxbillDelete(PurchasemanagementVo vo) {
		sqlSession.update("menu06.taxbillDelete", vo);
		
	}
}
