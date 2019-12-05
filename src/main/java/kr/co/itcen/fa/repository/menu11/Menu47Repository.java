package kr.co.itcen.fa.repository.menu11;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금현황조회
 *
 */
@Repository
public class Menu47Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<STermDebtVo> getList() {
		return sqlSession.selectList("menu47.getList");
	}
	
	public List<STermDebtVo> getList(STermDebtVo sTermDebtVo) {
		return sqlSession.selectList("menu47.getList", sTermDebtVo);
	}
	
	public List<STermDebtVo> getList(Map map) {
		return sqlSession.selectList("menu47.getListWithOrder", map);
	}
	
	public List<STermDebtVo> getSearchedList(STermDebtVo sTermDebtVo){
		return sqlSession.selectList("menu47.getSearchedList", sTermDebtVo);
	}
	
}
