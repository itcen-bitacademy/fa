package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 이종윤
 * 거래처관리
 *
 */

@Repository
public class Menu27Repository {
	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("거래처관리");
		sqlSession.insert("menu27.save", testVo);
	}

	public Boolean insert(CustomerVo customerVo) {
		int count = sqlSession.insert("menu27.insert", customerVo);
		return count==1;
			
	}

	public void update(CustomerVo customerVo) {
		sqlSession.update("menu27.update", customerVo);
	}

	public void delete(CustomerVo customerVo) {
		sqlSession.delete("menu27.delete", customerVo);
		
	}

	public List<CustomerVo> list() {
		return sqlSession.selectList("menu27.getList");
	}

	public Map<String, Object> create(CustomerVo customervo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 다른 조와 데이터 통합 전 임의의 Test data insert
		//customervo.setAccountNo("12348");
		// 191202 sql문 구현 필요함
		sqlSession.insert("menu27.create", customervo);
		
		map.put("customerList", sqlSession.selectList("menu25.list"));
		return map;
	}

}
