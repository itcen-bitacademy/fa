package kr.co.itcen.fa.repository.menu12;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;
import kr.co.itcen.fa.vo.menu12.TestVo;

/**
 * 
 * @author 안태영
 * 매출세금계산서관리
 *
 */
@Repository
public class Menu53Repository {
	
	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("53화면 테스트완료");
		sqlSession.insert("menu53.save", testVo);
	}
	
	// 매출날짜와 매출코드를 기반으로 목록을 가져오는 기능
	public List<SellTaxbillVo> getAllList(String date, String no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("salesDate", date);
		map.put("salesNo", no);
		
		return sqlSession.selectList("menu53.getalllist", map);
	}
	
	

}
