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
	public List<SellTaxbillVo> taxbillAllList(){
		return sqlSession.selectList("menu54.getaxbilllist");
	}
	
	//검색 필터를 통해 출력되는 기능
	public List<SellTaxbillVo> taxbillsearch(TaxbillSearchVo taxbillsearchvo){
		return sqlSession.selectList("menu54.taxbillsearch", taxbillsearchvo);
	}
	
}
