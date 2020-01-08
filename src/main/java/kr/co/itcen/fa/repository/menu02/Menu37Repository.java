package kr.co.itcen.fa.repository.menu02;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이제구 매입세금계산서관리
 *
 */

@Repository
public class Menu37Repository {
	@Autowired
	private SqlSession sqlSession;

	public void insert(BuyTaxbillVo vo) {

		sqlSession.insert("menu37.insert", vo);
	}

	public List<CustomerVo> customerList() {
		List<CustomerVo> customerList = sqlSession.selectList("menu37.customerList");
		return customerList;
	}

	public List<BankAccountVo> customerBankList() {
		List<BankAccountVo> customerBankList = sqlSession.selectList("menu37.customerBankList");
		return customerBankList;
	}

	public void insertTax(BuyTaxbillVo vo) {
		sqlSession.insert("menu37.insertTax", vo);
	}

	public void insertItem(BuyTaxbillItemsVo vo) {
		sqlSession.insert("menu37.insertItem", vo);
	}

	public BuyTaxbillVo getAboutNoData(String no) {
		BuyTaxbillVo buyTaxbillVo = sqlSession.selectOne("menu37.getAboutNoData", no);
		return buyTaxbillVo;
	}

	public CustomerVo getAboutNoCustomerData(String companyName) {
		CustomerVo getAboutNoCustomerData = sqlSession.selectOne("menu37.getAboutNoCustomerData", companyName);
		return getAboutNoCustomerData;
	}

	public BankAccountVo getAboutNoBankData(String depositNo) {
		BankAccountVo getAboutNoBankData = sqlSession.selectOne("menu37.getAboutNoBankData", depositNo);
		return getAboutNoBankData;
	}

	public List<BuyTaxbillItemsVo> getAboutItmes(String no) {
		List<BuyTaxbillItemsVo> getAboutItmes = sqlSession.selectList("menu37.getAboutItmes", no);
		return getAboutItmes;
	}

	public void taxbillDelete(String no) {
		sqlSession.update("menu37.taxbillDelete", no);

	}

	public void taxbillItemDelete(String no) {
		sqlSession.update("menu37.taxbillItemDelete", no);
	}

	public void taxbillUpdateDelete(String no) {
		sqlSession.delete("menu37.taxbillUpdateDelete", no);

	}

	public void taxbillItemsUpdateDelete(String no) {
		sqlSession.delete("menu37.taxbillItemsUpdateDelete", no);
	}
  
	public void insertUpdatedTax(BuyTaxbillVo vo) {
		sqlSession.insert("menu37.insertUpdatedTax", vo);

	}

	public void insertUpdatedItem(BuyTaxbillItemsVo buyTaxbillItemsVo) {
		sqlSession.insert("menu37.insertUpdatedItem", buyTaxbillItemsVo);

	}

	public String checkDuplicateNo(String no) {
		return sqlSession.selectOne("menu37.checkDuplicateNo", no);
	}

}
