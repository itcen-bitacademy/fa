package kr.co.itcen.fa.repository.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;
import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 김유진
 *  무형자산현황조회
 */
@Repository
public class Menu44Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김유진현황");
		sqlSession.insert("menu44.save", testVo);
	}

	public Object getSection() {
		List<Object> result = sqlSession.selectList("menu44.getSection");
		return result;
	}
	
	public int selectCount(IntangibleAssetsVo intangibleAssetsVo, String startDate, String endDate) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", intangibleAssetsVo.getId());
		map.put("customerName", intangibleAssetsVo.getCustomerName());
		map.put("address", intangibleAssetsVo.getAddress());
		map.put("classification", intangibleAssetsVo.getClassification());
		map.put("customerManager", intangibleAssetsVo.getCustomerManager());
		map.put("payDate", intangibleAssetsVo.getPayDate());
		map.put("acqPrice", intangibleAssetsVo.getAcqPrice());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("flag", intangibleAssetsVo.getFlag());
		return sqlSession.selectOne("menu44.selectCount", map);
	}

	public List<IntangibleAssetsVo> getList(PaginationUtil paginationUtil, IntangibleAssetsVo intangibleAssetsVo, String startDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", intangibleAssetsVo.getId());
		map.put("customerName", intangibleAssetsVo.getCustomerName());
		map.put("address", intangibleAssetsVo.getAddress());
		map.put("classification", intangibleAssetsVo.getClassification());
		map.put("customerManager", intangibleAssetsVo.getCustomerManager());
		map.put("payDate", intangibleAssetsVo.getPayDate());
		map.put("acqPrice", intangibleAssetsVo.getAcqPrice());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("flag", intangibleAssetsVo.getFlag());
		map.put("pagination", paginationUtil);
		List<IntangibleAssetsVo> result = sqlSession.selectList("menu44.getList", map);
		
		System.out.println(result.size());
		return result;
	}
}
