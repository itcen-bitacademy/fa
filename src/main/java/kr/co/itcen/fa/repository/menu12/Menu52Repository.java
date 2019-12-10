package kr.co.itcen.fa.repository.menu12;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처현황조회
 *
 */
@Repository
public class Menu52Repository {

	@Autowired
	private SqlSession sqlSession;

	public int findCustomerCnt(CustomerVo customerVo) {
		return sqlSession.selectOne("menu52.count", customerVo);
	}

	public List<CustomerVo> findAllCustomer(Map<String, Object> map) {
		return sqlSession.selectList("menu52.findAllCustomer", map);
	}
	
	public Map<String, Object> gets(Map<String, String> parameters) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CustomerVo> s = sqlSession.selectList("menu52.gets", parameters);
		map.put("customerList", s);
		
		return map;
	}

	public CustomerVo get(String no) {
		return sqlSession.selectOne("menu52.get", no);
	}
}
