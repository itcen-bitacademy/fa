package kr.co.itcen.fa.repository.menu12;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author 안태영
 * 매출관리 : 통계조회 Repository
 */
@Repository
public class Menu67Repository {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<Map> get2020MonthSales(int searchYear) {
		return sqlSession.selectList("menu67.get2020MonthSales", searchYear);
	}
	
	public List<Map> get2019MonthSales(int searchYear) {
		return sqlSession.selectList("menu67.get2019MonthSales", searchYear);
	}
	
	// Year - Sum
	// Month - Sum
	public List<Map> get2019MonthTaxbill(int searchYear){
		return sqlSession.selectList("menu67.get2019MonthTaxbill", searchYear);
	}
	
	public List<Map> get2020MonthTaxbill(int searchYear){
		return sqlSession.selectList("menu67.get2020MonthTaxbill", searchYear);
	}
	

}
