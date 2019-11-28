package kr.co.itcen.fa.repository.menu18;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu18.TestVo;

/**
 * 
 * @author 안대혁
 * 공통코드 관리
 */
@Repository
public class Menu65Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("안대혁");
		sqlSession.insert("menu65.save", testVo);
	}
	
	// 품목코드 저장 메소드
	public void save(SectionVo sectionVo) {
		sqlSession.insert("section.save", sectionVo);
	}
	
	public List<SectionVo> findAllByParentNoNull(){
		return sqlSession.selectList("section.findAllByParentNoNull");
	}
	
	// 대분류명을 SelectBox에 표시해주는 메소드
	public List<SectionVo> findAll(){
		return sqlSession.selectList(null);
	}
	
	
}
