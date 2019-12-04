package kr.co.itcen.fa.repository.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 이지수
 * 은행코드관리
 *
 */
@Repository
public class Menu16Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("이지수");
		sqlSession.insert("menu16.save", testVo);
	}

	public List<BankVo> list(String code, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("pagination", pagination);
		List<BankVo> list = sqlSession.selectList("menu16.list",map);
		return list;
	}

	public Boolean insert(BankVo vo) {
		int count = sqlSession.insert("menu16.insert",vo);
		return count == 1;
	}

	public Boolean update(BankVo vo) {
		int count = sqlSession.update("menu16.update",vo);
		return count == 1;	
	}

	public Boolean delete(BankVo vo) {
		int count = sqlSession.delete("menu16.delete",vo);
		return count == 1;
		
	}

	public int selectBankListCount(String code) {
		int count = sqlSession.selectOne("menu16.selectBankListCount",code);
		return count;
	}

	public Object getCode(String code) {
		BankVo result = sqlSession.selectOne("menu16.getByCode",code);
		return result;
	}

	
}
