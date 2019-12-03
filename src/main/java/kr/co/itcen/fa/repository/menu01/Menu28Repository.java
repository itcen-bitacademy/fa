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
 * 거래처 현황 조회
 *
 */

@Repository
public class Menu28Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("거래처현황조회");
		sqlSession.insert("menu28.save", testVo);
	}

	public List<CustomerVo> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("menu28.getList");
	}

	public List<CustomerVo> searchList(String customerDiv, String datepicker1, String datepicker2, String customerNo,
			String deleteFlag) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerDiv", customerDiv);
		map.put("datepicker1", datepicker1);
		map.put("datepicker2", datepicker2);
		map.put("customerNo", customerNo);
		map.put("deleteFlag", deleteFlag);
		
		List<CustomerVo> list= sqlSession.selectList("menu27.searchList", map);
		return list;
	}

}
