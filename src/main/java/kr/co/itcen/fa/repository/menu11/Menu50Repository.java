package kr.co.itcen.fa.repository.menu11;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
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
	
	public void insert(PdebtVo pdebtVo) {
		sqlSession.insert("menu50.insert", pdebtVo);
	}
	
	// 사채관리 테이블에 들어있는 전체 데이터 갯수 출력
	public int pdebtTotalcount() {
		return sqlSession.selectOne("menu50.pdebtTotalcount");
	}
	
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
	
	public List<BankAccountVo> selectBankaccountInfo(String depositNo) {
		List<BankAccountVo> bankaccountList = sqlSession.selectList("menu50.getBankaccountInfo", depositNo);
		System.out.println(bankaccountList);
		return bankaccountList;
	}

	public Boolean delete(Long[] no) {
		List<Long> list = new ArrayList<Long>();
		for (Long no1 : no) {
			list.add(no1);
		}
		
		int totalElements = list.size();
		for (int index = 0; index < totalElements; index++) {
			System.out.println(list.get(index));
		}
		
		int count = sqlSession.update("menu50.delete", list);
		return count >= 1;
	}

	public List<SectionVo> selectSection() {
		return sqlSession.selectList("menu50.selectsection");
	}

	public Long select(Long no) {
		Long longNo = sqlSession.selectOne("menu50.selectByVoucherNo", no);
		return longNo;
	}

	// 상환데이터 수정
	public Boolean updateRepayVo(RepayVo vo) {
		int count = sqlSession.update("menu50.repayupdate", vo);
		return count == 1;
	}

	// 상환데이터 입력
	public Boolean insertRepayVo(RepayVo vo) {
		int count = sqlSession.insert("menu50.insertrepay", vo);
		return count == 1;
	}

	// 상환후 갱신된 정보 select
	public PdebtVo getOne(Long debtNo) {
		PdebtVo vo = sqlSession.selectOne("menu50.selectone", debtNo);
		return vo;
	}

	public Boolean updateRepayFlag(Long no) {
		int count = sqlSession.update("menu50.updaterepayflag", no);
		return count == 1;
	}

	public PdebtVo getCode(String code) {
		PdebtVo vo = sqlSession.selectOne("menu50.getbycode", code);
		return vo;
	}

	public List<Long> selectVoucherNo(Long[] no) {
		List<Long> list = new ArrayList<Long>();
		for (Long no1 : no) {
			list.add(no1);
		}
		return sqlSession.selectList("menu50.selectVoucherNo", list);
	}
	
}
