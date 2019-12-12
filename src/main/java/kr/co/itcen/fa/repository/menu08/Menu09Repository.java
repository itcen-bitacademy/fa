package kr.co.itcen.fa.repository.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu08.BuildingVo;
import kr.co.itcen.fa.vo.menu08.LandVo;
import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 정의돈
 *  토지관리
 */
@Repository
public class Menu09Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("정의돈관리");
		sqlSession.insert("menu09.save", testVo);
	}
	
	public List<SectionVo> getSectionList() {
		
		List<SectionVo> list = sqlSession.selectList("menu09.sectionList");
		
		
		return list;
	}

	public List<CustomerVo> getCustomerList() {
		
		
		List<CustomerVo> list = sqlSession.selectList("menu09.customerList");
		System.out.println(list);
		
		return list;
	}

	public List<LandVo> getLandList() {
		
		List<LandVo> list = sqlSession.selectList("menu09.landList");
		System.out.println(list);
		return list;
	}

	public void insertLand(LandVo landVo) {

		sqlSession.insert("menu09.insertLand", landVo);
	}

	public void delLand(String id, String userId) {
		
		System.out.println("레포지토리 델렛");
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("userId", userId);
		map.put("id", id);
		sqlSession.update("menu09.deleteLand", map);
		
	}

	public void updateLand(LandVo landVo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("수우종");
		System.out.println(landVo);
		System.out.println("------------------------------");
		
		map.put("landVo", landVo);
		
		
		sqlSession.update("menu09.updateLand", landVo);
	}

//	public List<LandVo> getSearchList(String id) {
//		List<LandVo> list = sqlSession.selectList("menu09.landList", id);
//		System.out.println(list);
//		return list;
//	}

	public String checkId(String id) {
		
		String check = sqlSession.selectOne("menu09.checkId", id);
		return check;
	}

	public CustomerVo getDepositNo(String customerNo) {
		System.out.println(customerNo);
		
		CustomerVo cus = sqlSession.selectOne("menu09.getDepositNo", customerNo);
		System.out.println("레포지토리"+cus);
		
		return cus;
	}


	public int listCount(String id) {
		return sqlSession.selectOne("menu09.pageCount", id);
	}

	public List<LandVo> list(String id, PaginationUtil pagination) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagination", pagination);
		List<LandVo> list = sqlSession.selectList("menu09.list", map);
		
		return list;
	}

	public Long getVoucherNo(String id) {
		
		Long voucherNo = sqlSession.selectOne("menu09.getVoucher", id);
		return voucherNo;
	}


	
}
