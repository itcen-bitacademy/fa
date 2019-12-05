package kr.co.itcen.fa.repository.menu17;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author 유지훈
 * 대차대조표조회
 */

@Repository
public class Menu63Repository {

	@Autowired
	private SqlSession sqlSession;
	
	// 대차대조표(BalanceSheet) insert
	public int insertBalanceSheet(Long no) {
		int check = sqlSession.insert("menu63.insertBalanceSheet", no);
		return check;
	}
	
	
	public void test() {
	}
	
}
