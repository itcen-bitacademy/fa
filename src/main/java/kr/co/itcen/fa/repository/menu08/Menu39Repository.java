package kr.co.itcen.fa.repository.menu08;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu08.BuildingVo;



/**
 * 
 *  @author 김민준
 *  건물관리
 */
@Repository
public class Menu39Repository {

	@Autowired
	private SqlSession sqlSession;

	/*
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김민준관리!");
		sqlSession.insert("menu39.save", testVo);
	}
	*/
	
	public Boolean add(BuildingVo vo) {
		int count = sqlSession.insert("menu39.add", vo);
		return count == 1;
	}

	public List<BuildingVo> getList(String id) {
		List<BuildingVo> list = sqlSession.selectList("menu39.list",id);
		return list;
	}
	
	public Boolean modify(BuildingVo vo) {
		int count = sqlSession.update("menu39.modify", vo);
		return count == 1;
	}
	
	public Boolean delete(String id) {
		int count = sqlSession.update("menu39.delete", id);
		return count == 1;
	}

	public List<SectionVo> getSection() {
		List<SectionVo> sectionList = sqlSession.selectList("menu39.getSection");
		return sectionList;
	}

}
