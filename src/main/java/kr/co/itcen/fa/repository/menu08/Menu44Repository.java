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
 *  무형자산현황조회
 */
@Repository
public class Menu44Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김유진현황");
		sqlSession.insert("menu44.save", testVo);
	}

	public Object getSection() {
		List<Object> result = sqlSession.selectList("menu44.getSection");
		return result;
	}
	
	public int selectCount(IntangibleAssetsVo intangibleAssetsVo) {
		return sqlSession.selectOne("menu44.selectCount", intangibleAssetsVo);
	}

	public int selectAllCount(IntangibleAssetsVo intangibleAssetsVo) {
		return sqlSession.selectOne("menu44.selectAllCount", intangibleAssetsVo);
	}

	public List<IntangibleAssetsVo> getList(IntangibleAssetsVo intangibleAssetsVo) {
		List<IntangibleAssetsVo> result = sqlSession.selectList("menu44.getList", intangibleAssetsVo);
		return result;
	}

	public List<IntangibleAssetsVo> getAllList(IntangibleAssetsVo intangibleAssetsVo) {
		List<IntangibleAssetsVo> result = sqlSession.selectList("menu44.getAllList", intangibleAssetsVo);
		return result;
	}

}
