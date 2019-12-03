package kr.co.itcen.fa.repository.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 박준호
 * 사채관리
 *
 */
@Repository
public class Menu50Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("박준호");
		sqlSession.insert("menu50.save", testVo);
	}
	
	public void insert(PdebtVo pdebtVo) {
		sqlSession.insert("menu50.insert", pdebtVo);
	}
	
	// 사채관리 테이블에 들어있는 전체 데이터 갯수 출력
	public int pdebtTotalcount() {
		return sqlSession.selectOne("menu50.pdebtTotalcount");
	}
	
	// 처음에 리스트에 출력할 때 실행하는 메소드
	/*
	 * public List<PdebtVo> list(int startNum, int lastNum) { Map<String, Integer>
	 * map = new HashMap<String, Integer>(); map.put("startNum", startNum);
	 * map.put("lastNum", lastNum); return sqlSession.selectList("menu50.list",
	 * map); }
	 */
	
	// 데이터 카운트
	public int listCount(String year, String code) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("code", code);
		return sqlSession.selectOne("menu50.selectAllCount", map);
	}
	
	// 리스트 데이터 출력
	public List<PdebtVo> list(String year, String code, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("code",code);
		map.put("pagination", pagination);
		List<PdebtVo> list= sqlSession.selectList("menu50.selectAll",map);
		return list;
	}
	
	public PdebtVo selectOnePdebtInfo(String debtcode) {
		return sqlSession.selectOne("menu50.getPdebtInfo", debtcode);
	}
	
	public void updateDeleteFlag(List<Long> noList) {
		sqlSession.update("menu50.updateDeleteFlag", noList);
	}

	public List<BankVo> bankInfoList() {
		return sqlSession.selectList("menu50.bankList");
	}

	public BankVo selectOneBankcodeInfo(String bankcode) {
		return sqlSession.selectOne("menu50.getBankcodeInfo", bankcode);
	}

	public List<BankVo> selectOneBanknameInfo(String bankname) {
		return sqlSession.selectList("menu50.getBanknameList", bankname);
	}

	public Boolean update(PdebtVo vo) {
		int count = sqlSession.update("menu50.update", vo);
		return count == 1;
	}
}
