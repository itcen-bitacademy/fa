package kr.co.itcen.fa.repository.menu02;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 이제구
 * 매입세금계산서관리
 *
 */

@Repository
public class Menu37Repository {
	@Autowired
	private SqlSession sqlSession;
	
	

	//1. insert를 할때 if문으로 3팀인지 2팀인지 구별후 매입세금계산서번호를 넣는다.
	//2. 내꺼에 넣는다.
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
		sqlSession.insert("menu37.insertTax",vo);	
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
		List<BuyTaxbillItemsVo> getAboutItmes = sqlSession.selectList("menu37.getAboutItmes",no);
		return getAboutItmes;
	}
	
	

	
}
