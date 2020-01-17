package kr.co.itcen.fa.repository.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;
import kr.co.itcen.fa.vo.menu08.PurposeVo;
import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 김유진
 *  무형자산관리
 */
@Repository
public class Menu43Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김유진관리");
		sqlSession.insert("menu43.save", testVo);
	}
	
	// 무형자산 저장 메소드
	public void insert(IntangibleAssetsVo intangibleAssetsVo) {
		sqlSession.insert("menu43.insert", intangibleAssetsVo);
	}
	
	public void update(IntangibleAssetsVo intangibleAssetsVo) {
		sqlSession.update("menu43.update", intangibleAssetsVo);
	}

	public void delete(String id) {
		sqlSession.delete("menu43.delete", id);
	}

	public Object getSection() {
		List<Object> result = sqlSession.selectList("menu43.getSection");
		return result;
	}

	public String get(String id) {
		String result = sqlSession.selectOne("menu43.getById", id);
		return result;
	}

	public Object getCustomer() {
		List<Object> result = sqlSession.selectList("menu43.getCustomer");
		return result;
	}
	
	public Object getPurpose() {
		List<Object> result = sqlSession.selectList("menu43.getPurpose");
		return result;
	}

	public String getDepositNo(String customerNo) {
		String result = sqlSession.selectOne("menu43.getDepositNo", customerNo);
		return result;
	}

	public CustomerVo getCustomerInfo(String customerNo) {
		return sqlSession.selectOne("menu43.getCustomerInfo", customerNo);
	}

	public Long getVoucherNo(IntangibleAssetsVo intangibleAssetsVo) {
		return sqlSession.selectOne("menu43.getVoucherNo", intangibleAssetsVo);
	}

	public PurposeVo getPurposeInfo(String purpose) {
		return sqlSession.selectOne("menu43.getPurposeInfo", purpose);
	}

	public int selectCount(IntangibleAssetsVo intangibleAssetsVo, String startDate, String endDate) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", intangibleAssetsVo.getId());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectOne("menu43.selectCount", map);
	}
	
	public List<IntangibleAssetsVo> getList(PaginationUtil pagination, IntangibleAssetsVo intangibleAssetsVo,
			String startDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", intangibleAssetsVo.getId());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("pagination", pagination);
		List<IntangibleAssetsVo> result = sqlSession.selectList("menu43.getList", map);
		
		System.out.println(result.size());
		return result;
	}

}
