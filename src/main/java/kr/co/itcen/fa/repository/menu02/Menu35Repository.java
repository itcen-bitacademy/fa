package kr.co.itcen.fa.repository.menu02;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이지은
 * 매입거래처관리
 *
 */

@Repository
public class Menu35Repository {
	@Autowired
	private SqlSession sqlSession;
	
//	public void test() {
//		CustomerVo customerVo = new CustomerVo();
//		customerVo.setName("purchasecustomer35vo"); // 이름
//		
//		sqlSession.insert("menu35.getList", customerVo);
//	}
	
	public List<CustomerVo> getList(){
		List<CustomerVo> result = sqlSession.selectList("menu35.getList");
		return result;
	}
	
	public Boolean insert(CustomerVo vo) {
		int count = sqlSession.insert("menu35.insert", vo);
		return count == 1;
	}
	
	public Boolean update(CustomerVo vo) {
		int count = sqlSession.update("menu35.update", vo);
		return count == 1;
	}
	
	public void delete(List<String> checkNoArr) {
		sqlSession.delete("menu35.delete", checkNoArr);	
	}
	
	public List<CustomerVo> search(String no) {
		List<CustomerVo> result = sqlSession.selectList("menu35.search", no);
		return result;
	}
	
	public CustomerVo getCustomer(String no) {
		return sqlSession.selectOne("menu35.findByNo", no);
	}
}
