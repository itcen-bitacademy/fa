package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 이종윤
 * 거래처 현황 조회
 *
 */

@Repository
public class Menu28Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("거래처현황조회");
		sqlSession.insert("menu28.save", testVo);
	}

	public int listCount(CustomerVo customerVo) {
		System.out.println(customerVo.getDeleteFlag());
		int i = sqlSession.selectOne("menu28.selectAllCount", customerVo);
		System.out.println(i);
		
		return sqlSession.selectOne("menu28.selectAllCount", customerVo);
	}

	public List<CustomerVo> list(PaginationUtil pagination, CustomerVo customerVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("vo", customerVo);
		List<CustomerVo> list = sqlSession.selectList("menu28.optionSearch", map);
		return list;

	}

}
