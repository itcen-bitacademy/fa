package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
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

	// GetList
	public List<CustomerVo> list(PaginationUtil pagination) {
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		List<CustomerVo> res = sqlSession.selectList("menu27.getList", s); 
		return res;
	}

	// Create
	public Map<String, Object> create(CustomerVo customerVo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.insert("menu27.create", customerVo);
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		map.put("customerList", sqlSession.selectList("menu27.getList", s));
		return map;
		
	}

	// Read
	public Map<String, Object> read(CustomerVo customerVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerList", sqlSession.selectList("menu27.read", customerVo));
		return map;
	}

	// Update
	public Map<String, Object> update(CustomerVo customerVo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu27.update", customerVo);
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		map.put("customerList", sqlSession.selectList("menu27.getList", s));
		return map;
	}

	// Delete
	public Map<String, Object> delete(CustomerVo customerVo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu27.delete", customerVo);
		
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		
		map.put("customerList", sqlSession.selectList("menu27.getList", s));
		return map;
	}

	// Delete All
	public boolean deleteAll(CustomerVo customervo) {
		int count = sqlSession.delete("menu27.deleteAll", customervo);
		return (count ==1);
	}

	public int selectCount() {
		int res = sqlSession.selectOne("menu27.getCount");
		return res;
	}

	
	//update deposit_no from 슬기형
	public Map<String, Object> updateBankAccount(BankAccountVo bankAccountVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu27.updateBankAccount", bankAccountVo);
		return map;
	}

	public CustomerVo existNo(String no) {
		CustomerVo customerVo = sqlSession.selectOne("menu27.existNo",no);
		return customerVo;
	}
	
	// 삭제된 거래처 복구
	public Map<String, Object> deletedrecreate(CustomerVo customervo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu27.deletedrecreate", customervo);
		Map <String, Object> s = new HashMap<String, Object>();
		s.put("pagination", pagination);
		map.put("customerList", sqlSession.selectList("menu27.getList", s));
		return map;
	}
	
	//deleteFlag가 N이면 true
	public boolean getDeleteFlag(CustomerVo customervo) {
		int getdf = sqlSession.selectOne("menu27.getDeleteFlag",customervo);
		return getdf==1;
	}
	

}
