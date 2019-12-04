package kr.co.itcen.fa.repository.menu12;

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

	public int findCustomerCnt() {
		return sqlSession.selectOne("menu52.count");
	}

	public List<CustomerVo> findAllCustomer(Map<String, Object> map) {
		return sqlSession.selectList("menu52.findAllCustomer", map);
	}
	
	
}
