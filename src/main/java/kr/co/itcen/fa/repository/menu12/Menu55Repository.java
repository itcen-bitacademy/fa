package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목별매입매출현황
 *
 */
@Repository
public class Menu55Repository {

	@Autowired
	private SqlSession sqlSession;

//	public void test() {
//		TestVo testVo = new TestVo();
//		testVo.setName("곽세연");
//		sqlSession.insert("menu55.save", testVo);
//	}
//	
	public List<CurrentSituationVo> getList(CurrentSituationVo vo){
		
		List<CurrentSituationVo> list = sqlSession.selectList("menu55.getList",vo);
		return list;
	}
	
	public List<CurrentSituationVo> getitemname(String itemname) {
		List<CurrentSituationVo> result = sqlSession.selectList("menu55.getitemname");
		return result;
		
		
	}
	
}
