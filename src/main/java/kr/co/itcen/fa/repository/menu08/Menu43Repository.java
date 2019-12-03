package kr.co.itcen.fa.repository.menu08;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;
import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 김유진
 *  무형자산관리
 */
@Repository
public class Menu43Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김유진관리");
		sqlSession.insert("menu43.save", testVo);
	}
	
	// 무형자산 저장 메소드
	public void insert(IntangibleAssetsVo intangibleAssetsVo) {
		sqlSession.insert("menu43.insert", intangibleAssetsVo);
	}
	
	public List<IntangibleAssetsVo> getList() {
		List<IntangibleAssetsVo> result = sqlSession.selectList("menu43.getList");
		return result;
	}

	public void update(IntangibleAssetsVo intangibleAssetsVo) {
		sqlSession.update("menu43.update", intangibleAssetsVo);
	}

	public void delete(String id) {
		sqlSession.delete("menu43.delete", id);
	}
}
