package kr.co.itcen.fa.repository.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
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
	
	public int listCount(String year, String code) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("code",code);
		
		return sqlSession.selectOne("menu48.selectAllCount", map);
	}

	public List<LTermdebtVo> list(String year, String code, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("code",code);
		map.put("pagination", pagination);
		List<LTermdebtVo> list= sqlSession.selectList("menu48.selectAll",map);
		return list;
	}
	public Boolean update(LTermdebtVo vo) {
		int count = sqlSession.update("menu48.update",vo);
		return count==1;
	}

	public Boolean delete(Long no) {
		int count = sqlSession.update("menu48.delete",no);
		return count==1;
	}
}
