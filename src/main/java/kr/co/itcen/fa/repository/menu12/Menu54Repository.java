package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;
import kr.co.itcen.fa.vo.menu12.TaxbillSearchVo;
import kr.co.itcen.fa.vo.menu12.TestVo;

/**
 * 
 * @author 안태영
 * 매출세금계산서현황조회
 *
 */

@Repository
public class Menu54Repository {
	
	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("54화면 테스트 완료");
		sqlSession.insert("menu54.save", testVo);
	}
	
	// 거래처에 대한 목록을 가져오는 기능
	public List<SellTaxbillVo> salesCustomer(){
		return sqlSession.selectList("menu54.salescustomer");
	}
	
	//품목에 대한 목록을 가져오는 기능
	public List<SellTaxbillVo> salesItems(){
		return sqlSession.selectList("menu54.salesitems");
	}
	
	//세금계산서에 대한 목록을 가져오는 기능
	public List<SellTaxbillVo> taxbillList(){
		return sqlSession.selectList("menu54.taxbilllist");
	}
	
	//전체 리스트가 출력되게 하는 기능
	public List<SellTaxbillVo> taxbillAllList(TaxbillSearchVo searchvo){
		return sqlSession.selectList("menu54.getaxbilllist", searchvo);
	}
	
	//검색 필터를 통해 출력되는 기능
	public List<SellTaxbillVo> taxbillSearch(TaxbillSearchVo taxbillsearchvo){
		System.out.println("검색 리스트 조회 - 레파지토리");
		return sqlSession.selectList("menu54.taxbillsearch", taxbillsearchvo);
	}
	
	// 전체 목록을 조회하는 기능
	public int taxbillAllCount() {
		System.out.println("검색 전체 목록 표시");
		return sqlSession.selectOne("menu54.taxbillallcount");
	}
	
	// 검색 필터를 통해 출력되는 전체 리스트의 항목을 가져오는 기능
	public int taxbillsearchcount(TaxbillSearchVo tvo) {
		System.out.println("필터를 통한 전체 검샘 목록 표시");
		return sqlSession.selectOne("menu54.taxbillsearchcount", tvo);
	}
	
	// 검색을 통해서 거래처에 따른 세금계산서를 출력해주는 기능
	public List<TaxbillSearchVo> subTaxbillno(TaxbillSearchVo vo){
		System.out.println("Ajax를 통한 세금계산서 번호 출력");
		return sqlSession.selectList("menu54.subtaxbillno", vo); 
	}
	
	
	
}
