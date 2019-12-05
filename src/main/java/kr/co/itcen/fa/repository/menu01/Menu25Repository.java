package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 황슬기 
 * 계좌관리
 *
 */

@Repository
public class Menu25Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("김길동");
	//	sqlSession.insert("menu25.save", testVo);
	}

	public Map<String, Object> create(BankAccountVo bavo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 191202 sql문 구현 필요함
		sqlSession.insert("menu25.create", bavo);
		
		map.put("bankList", sqlSession.selectList("menu25.list"));
		return map;
	}

	public Map<String, Object> update(BankAccountVo bavo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
						
		// TODO Auto-generated method stub	
		
		sqlSession.update("menu25.update", bavo);
		
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		
		map.put("bankList", sqlSession.selectList("menu25.list", s));
		return map;
	}

	public Map<String, Object> delete(BankAccountVo bavo) {
		Map<String, Object> map = new HashMap<String, Object>();
		// TODO Auto-generated method stub
		sqlSession.update("menu25.delete", bavo);
		
		map.put("bankList", sqlSession.selectList("menu25.list"));
		return map;
	}
	
	public boolean Nexist(BankAccountVo vo) {
		int exist = sqlSession.selectOne("menu25.nexist", vo);
		return exist == 1;
	}
	
	public boolean Yexist(BankAccountVo vo) {
		int exist = sqlSession.selectOne("menu25.yexist", vo);
		return exist == 1;
	}

	public List<BankAccountVo> list(PaginationUtil pagination) {
		// TODO Auto-generated method stub
		
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		System.out.println(pagination.getPageIndex());
		System.out.println(pagination.getListSize());
		
		List<BankAccountVo> res = sqlSession.selectList("menu25.list", s); 
		
		return res;
	}

	public void deleteAll(BankAccountVo bavo) {
		// TODO Auto-generated method stub
		sqlSession.delete("menu25.deleteAll", bavo);
	}

	public Map<String, Object> gets(String depositNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		// TODO Auto-generated method stub		
		map.put("bankAccountList", sqlSession.selectList("menu25.gets", depositNo));
		return map;
	}

	public int selectCount() {
		int res = sqlSession.selectOne("menu25.getCount");
		return res;
	}
}
