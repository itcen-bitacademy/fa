package kr.co.itcen.fa.repository.menu12;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.SalesVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 곽세연
 * 월별거래처매출현황
 *
 */
@Repository
public class Menu57Repository {

	@Autowired
	private SqlSession sqlSession;

	public int selectAllSalesCount(SalesVo vo) {
		return sqlSession.selectOne("menu57.count", vo);
	}

	public List<SalesVo> selectAllSalse(Map<String, Object> map) {
		return sqlSession.selectList("menu57.list", map);
	}
	
	public CustomerVo get(String no) {
		return sqlSession.selectOne("menu57.get", no);
	}
	
}