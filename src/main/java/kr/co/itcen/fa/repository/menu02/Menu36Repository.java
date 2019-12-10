package kr.co.itcen.fa.repository.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 이지은
 * 매입거래처현황조회
 *
 */

@Repository
public class Menu36Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("이름넣기"); // 이름
		
		sqlSession.insert("menu36.save", testVo);
	}
	
	public int selectAllCount(CustomerVo customerVo) {
		return sqlSession.selectOne("menu36.selectAllCount", customerVo);
	}
	
	public List<CustomerVo> getList(){
		List<CustomerVo> result = sqlSession.selectList("menu36.getList");
		return result;
	}
	
	public List<CustomerVo> getList(CustomerVo customerVo){
		List<CustomerVo> result = sqlSession.selectList("menu36.getList", customerVo);
		return result;
	}
	
	public Map<String, Object> gets(Map<String, String> parameters) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CustomerVo> s = sqlSession.selectList("menu36.gets", parameters);
		map.put("customerList", s);
		
		
		return map;
	}

}
