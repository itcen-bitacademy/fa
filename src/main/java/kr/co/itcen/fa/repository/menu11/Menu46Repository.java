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
	
	//기본, 조회
	public List<STermDebtVo> getList(Map map) {
		System.out.println("startRow : " + map.get("startRow") + " pageSize : " + map.get("pageSize"));
		return sqlSession.selectList("menu46.getList", map);
	}
	
	public int getTotalCnt(Map map) {
		System.out.println("financialYear : " + map.get("financialYear"));
		return sqlSession.selectOne("menu46.getTotalCnt", map);
	}
	
	//입력
	public Boolean insert(STermDebtVo sTermDebtVo) {
		int count = sqlSession.insert("menu46.insert", sTermDebtVo);
		return (count==1);
	}
	
	//수정
	public Boolean update(STermDebtVo sTermDebtVo) {
		System.out.println("update 콜됨");
		int count = sqlSession.update("menu46.update1", sTermDebtVo);
		return (count==1);
	}
	
	//삭제
	public void updateDeleteFlag(List<Long> noList) {
		sqlSession.update("menu46.updateDeleteFlag", noList);
	}
	
}
