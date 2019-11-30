package kr.co.itcen.fa.repository.menu11;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Repository
public class Menu48Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김준호");
		sqlSession.insert("menu48.save", testVo);
	}

	public Boolean insert(LTermdebtVo vo) {
		int count = sqlSession.insert("menu48.insert",vo);
		return count==1;
	}

	public List<LTermdebtVo> list() {
		List<LTermdebtVo> list= sqlSession.selectList("menu48.selectAll");
		return list;
	}
	
}
