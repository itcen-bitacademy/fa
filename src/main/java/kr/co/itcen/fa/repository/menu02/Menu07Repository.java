package kr.co.itcen.fa.repository.menu02;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;
import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 윤종진
 * 매입현황조회
 *
 */

@Repository
public class Menu07Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("zxcvb321"); // 이름
		
		sqlSession.insert("menu07.save", testVo);
	}

	public List<PurchasemanagementVo> getList() {
		List<PurchasemanagementVo> result = sqlSession.selectList("menu07.getlist");
		return result;
	}

	public int getCount() {
		List<PurchasemanagementVo> result = sqlSession.selectList("menu07.getcount");
		return result.size();
	}

	public List<PurchasemanagementVo> getList(int page) {
		List<PurchasemanagementVo> result = sqlSession.selectList("menu07.getList",page);
		return result;
	}


	public List<PurchasemanagementVo> getList(PurchasemanagementVo vo) {
		List<PurchasemanagementVo> result = sqlSession.selectList("menu07.getSearchList", vo);
		System.out.println("Repository : " + result);
		return result;
	}
}
