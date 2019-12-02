package kr.co.itcen.fa.repository.menu01;

import java.util.List;

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

}
