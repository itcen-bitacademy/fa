package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// GetList
	public List<CustomerVo> list() {
		return sqlSession.selectList("menu27.getList");
	}

	// Create
	public Map<String, Object> create(CustomerVo customervo) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.insert("menu27.create", customervo);
		map.put("customerList", sqlSession.selectList("menu27.getList"));
		return map;
	}

	// Read
	public Map<String, Object> read(CustomerVo customerVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerList", sqlSession.selectList("menu27.read", customerVo));
		return map;
	}

	// Update
	public Map<String, Object> update(CustomerVo customerVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu27.update", customerVo);
		map.put("customerList", sqlSession.selectList("menu27.getList"));
		return map;
	}

	// Delete
	public Map<String, Object> delete(CustomerVo customerVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu27.delete", customerVo);
		map.put("customerList", sqlSession.selectList("menu27.getList"));
		return map;
	}

	// Delete All
	public void deleteAll(CustomerVo customervo) {
		sqlSession.delete("menu27.deleteAll", customervo);
	}

}
