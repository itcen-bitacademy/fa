package kr.co.itcen.fa.repository.menu08;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu08.TestVo;
import kr.co.itcen.fa.vo.menu08.StaffVo;


/**
 * 
 *  @author 권영미
 *  차량관리
 */
@Repository
public class Menu41Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("권영미관리");
		sqlSession.insert("menu41.save", testVo);
	}
	
	//직급 리스트 테스트
	public List<StaffVo> getJik() {
		List<StaffVo> list = sqlSession.selectList("menu41.name");
		System.out.println(list);
		return list;
	}
}
