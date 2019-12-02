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
 * 단기차입금관리
 *
 */
@Repository
public class Menu46Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<STermDebtVo> getList() {
		return sqlSession.selectList("menu46.getList");
	}
	
	public Boolean insert(STermDebtVo sTermDebtVo) {
		int count = sqlSession.insert("menu46.insert", sTermDebtVo);
		return (count==1);
	}
	
	public Boolean update(STermDebtVo sTermDebtVo) {
		int count = sqlSession.update("menu46.update", sTermDebtVo);
		return (count==1);
	}
	
	public void updateDeleteFlag(List<Long> noList) {
		sqlSession.update("menu46.updateDeleteFlag", noList);
	}
	
	public List<STermDebtVo> getSearchedList(Map map){
		return sqlSession.selectList("menu46.getSearchedList", map);
	}
}
