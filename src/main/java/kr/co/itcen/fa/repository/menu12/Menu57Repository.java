package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.SalesVo;
import kr.co.itcen.fa.vo.menu12.TestVo;

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

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("곽세연");
		sqlSession.insert("menu57.save", testVo);
	}
	//전체 리스트
	public List<SalesVo> getList(SalesVo vo){
		List<SalesVo> list = sqlSession.selectList("menu57.getList",vo);
		return list;
		
	}
	//검색을 위한 거래처명 리스트
	public List<SalesVo> getcustomerName(){
		return sqlSession.selectList("menu57.getcustomerName");
		
	}
	
}