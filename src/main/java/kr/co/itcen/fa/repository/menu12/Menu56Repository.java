package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;
import kr.co.itcen.fa.vo.menu12.TestVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별매입매출현황
 *
 */
@Repository
public class Menu56Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("곽세연");
		sqlSession.insert("menu56.save", testVo);
	}
	
	public List<CurrentSituationVo> getList() {
		List<CurrentSituationVo> list = sqlSession.selectList("menu56.getList");
		return list;
		
	}

	
	
	
}