package kr.co.itcen.fa.repository.menu08;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<IntangibleAssetsVo> getList(String kwd) {
		List<IntangibleAssetsVo> result = sqlSession.selectList("menu43.getList", kwd);
		return result;
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

}
