package kr.co.itcen.fa.repository.menu11;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.Chromaticity;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;
/**
 * 
 * @author 박준호
 * 상환내역관리
 *
 */
@Repository
public class Menu66Repository {

	@Autowired
	private SqlSession sqlSession;
	
	//조건에 해당하는 총 건수 반환
	public int getTotalCnt(RepayVo vo){
		return sqlSession.selectOne("menu66.getTotalCnt",vo);
	}
	//해당 리스트를 반환
	public List<RepayVo> getList(Map map){
		return sqlSession.selectList("menu66.getList", map);
	}
	// 상환테이블 데이터 카운트
	public int listCount(String code, String debtType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("debtType", debtType);
		return sqlSession.selectOne("menu66.selectAllCount", map);
	}
	
	// 상환테이블 리스트 데이터 출력
	public List<RepayVo> list(String code, String debtType, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("debtType", debtType);
		map.put("pagination", pagination);
		
		List<RepayVo> list = sqlSession.selectList("menu66.selectAll", map);
		for (RepayVo repayVo : list) {
			System.out.println("data : " + repayVo.toString());
		}
		return list;
	}

	public Boolean update(RepayVo vo) {
		int count = sqlSession.update("menu66.update", vo);
		return count == 1;
	}

	// 전표번호와 일치하는 상환테이블 데이터 조회
	public Long select(Long no) {
		Long longNo = sqlSession.selectOne("menu66.selectByVoucherNo", no);
		return longNo;
	}

	// 상환잔액을 수정되기 이전으로 돌리기
	public Boolean restoreRepayBal(RepayVo vo) {
		int count = sqlSession.update("menu66.restoreRepayBal", vo);
		System.out.println("restoreRepayBal : " + count);
		return count == 1;
	}

	// 상환후 갱신된 단기차입금 정보 select
	public STermDebtVo getSTermDebtOne(Long debtNo) {
		STermDebtVo vo = sqlSession.selectOne("menu66.selectStermOne", debtNo);
		return vo;
	}

	// 상환후 갱신된 장기차입금 정보 select
	public LTermdebtVo getLTermDebtOne(Long debtNo) {
		LTermdebtVo vo = sqlSession.selectOne("menu66.selectLtermOne", debtNo);
		return vo;
	}

	// 상환후 갱신된 사채 정보 select
	public PdebtVo getPdebtOne(Long debtNo) {
		PdebtVo vo = sqlSession.selectOne("menu66.selectPdebtOne", debtNo);
		return vo;
	}
	
	// 상환잔액 업데이트
	public Boolean updateRepayVo(RepayVo vo) {
		int count = sqlSession.update("menu66.repayUpdate", vo);
		System.out.println("updateRepayVo : " + count);
		return count == 1;
	}

	// 전표번호 읽어오기
	public List<Long> selectVoucherNo(Long[] no) {
		List<Long> list = new ArrayList<Long>();
		for (Long no1 : no) {
			list.add(no1);
		}
		return sqlSession.selectList("menu66.selectVoucherNo", list);
	}

	// 상환테이블에서 상환정보 삭제
	public Boolean delete(Long[] no) {
		List<Long> list = new ArrayList<Long>();
		for (Long no1 : no) {
			list.add(no1);
		}
		
		int totalElements = list.size();
		for (int index = 0; index < totalElements; index++) {
			System.out.println(list.get(index));
		}
		
		int count = sqlSession.update("menu66.delete", list);
		return count >= 1;
	}

	public Boolean deleteDebt(Long[] no, String[] debtType, Long[] tempPayPrinc) {
		List<Long> list = new ArrayList<Long>();
		for (Long no1 : no) {
			list.add(no1);
		}
		
		int totalElements = list.size();
		for (int index = 0; index < totalElements; index++) {
			System.out.println(list.get(index));
		}
		
		int count = sqlSession.update("menu66.deleteDebt", list);
		return count >= 1;
	}
	
}
