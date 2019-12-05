package kr.co.itcen.fa.repository.menu01;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.TestVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;

/**
 * 
 * @author 임성주
 * 전표현황조회
 *
 */

@Repository
public class Menu04Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("김길동");
		sqlSession.insert("menu04.save", testVo);
	}
	public List<VoucherVo> viewVoucher() {
		return sqlSession.selectList("menu04.viewVoucher");
	}


}