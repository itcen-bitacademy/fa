package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처관리
 *
 */
@Repository
public class Menu15Repository {

	@Autowired
	private SqlSession sqlSession;

	public void saveCustomer(CustomerVo customerVo) {
		sqlSession.insert("menu15.save", customerVo);
	}

	public List<CustomerVo> findAllCustomer(String no) {
		no = "%" + no + "%";
		return sqlSession.selectList("menu15.findAll", no);
	}

	public void updateCustomer(CustomerVo customerVo) {
		sqlSession.update("menu15.update", customerVo);
	}

	public CustomerVo getCustomer(String no) {
		return sqlSession.selectOne("menu15.findByNo", no);
	}

	public int deleteCustomer(List<String> checkNoList) {
		return sqlSession.update("menu15.deleteByNo", checkNoList);
	}
	
	
}
