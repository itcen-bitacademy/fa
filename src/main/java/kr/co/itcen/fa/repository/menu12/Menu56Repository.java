package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.SectionVo;
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
	
	// 품목대분류별 매입매출현황 화면
	// 대분류 목록을 보여주기 위한 코드
	public List<SectionVo> getMainCategory(){
		return sqlSession.selectList("menu56.getmaincategory");
	}
	
	// 품목대분류별 매입매출현황 화면
	// 품목 분류 목록을 보여주기 위한 코드
	public List<SectionVo> getSubCategory(int no){
		return sqlSession.selectList("menu56.getsubcategory", no);
	}
	
	
	
}