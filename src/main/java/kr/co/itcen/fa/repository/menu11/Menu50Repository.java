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
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
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
	
	// 사채정보입력
	public void insert(PdebtVo pdebtVo) {
		sqlSession.insert("menu50.insert", pdebtVo);
	}
	
	// 사채테이블의 데이터 카운트
	public int listCount(String year, String code) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("code", code);
		return sqlSession.selectOne("menu50.selectAllCount", map);
	}
	
	// 사채현황관리 리스트에 출력할 리스트 데이터 호출
	public List<PdebtVo> list(String year, String code, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("code",code);
		map.put("pagination", pagination);
		List<PdebtVo> list= sqlSession.selectList("menu50.selectAll",map);
		return list;
	}
	
	// 사채코드와 일치하는 데이터 조회
	public PdebtVo selectOnePdebtInfo(String debtcode) {
		return sqlSession.selectOne("menu50.getPdebtInfo", debtcode);
	}

	// 은행 팝업창에서 은행코드로 조회 - 은행코드로 데이터 출력
	public BankVo selectOneBankcodeInfo(String bankcode) {
		return sqlSession.selectOne("menu50.getBankcodeInfo", bankcode);
	}

	// 은행 팝업창에서 은행명으로 데이터 리스트형식으로 조회 - 은행명으로 데이터 출력
	public List<BankVo> selectOneBanknameInfo(String bankname) {
		return sqlSession.selectList("menu50.getBanknameList", bankname);
	}

	// 사채관리 페이지에서 수정을 눌렀을 때, 해당 사채정보 수정
	public Boolean update(PdebtVo vo) {
		int count = sqlSession.update("menu50.pdebtupdate", vo);
		return count == 1;
	}

	// 사채테이블에서 사채정보 삭제
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

	// 공통테이블에 있는 차입금대분류 데이터 호출
	public List<SectionVo> selectSection() {
		return sqlSession.selectList("menu50.selectsection");
	}

	// 전표번호와 일치하는 사채테이블 데이터 조회
	public Long select(Long no) {
		Long longNo = sqlSession.selectOne("menu50.selectByVoucherNo", no);
		return longNo;
	}
	
	// 상환데이터 입력
	public Boolean insertRepayVo(RepayVo vo) {
		int count = sqlSession.insert("menu50.insertRepay", vo);
		return count == 1;
	}

	// 상환데이터 수정
	public Boolean updateRepayVo(RepayVo vo) {
		int count = sqlSession.update("menu50.repayUpdate", vo);
		return count == 1;
	}

	// 상환후 갱신된 정보 select
	public PdebtVo getOne(Long debtNo) {
		PdebtVo vo = sqlSession.selectOne("menu50.selectOne", debtNo);
		return vo;
	}

	// 상환완료된 데이터 flag update
	public Boolean updateRepayFlag(Long no) {
		int count = sqlSession.update("menu50.updateRepayFlag", no);
		return count == 1;
	}

	// 전표번호 읽어오기
	public List<Long> selectVoucherNo(Long[] no) {
		List<Long> list = new ArrayList<Long>();
		for (Long no1 : no) {
			list.add(no1);
		}
		return sqlSession.selectList("menu50.selectVoucherNo", list);
	}
	
	// 동일한 사채코드가 존재하는지 비교
	public PdebtVo getCode(String code) {
		PdebtVo vo = sqlSession.selectOne("menu50.getbycode", code);
		return vo;
	}

	//상환내역이 있을경우 수정불가
	public List<RepayVo> getRepay(Long no) {
		List<RepayVo> list = sqlSession.selectList("menu50.selectRepaylist", no);
		return list;
	}

	//상환내역이 있을경우 수정불가 (no를 배열로 전달)
	public List<RepayVo> getRepay(Long[] no) {
		List<Long> listRepay = new ArrayList<Long>();
		for (Long no1 : no) {
			listRepay.add(no1);
		}
		List<RepayVo> list = sqlSession.selectList("menu50.selectRepayAlllist", listRepay);
		return list;
	}

	public CustomerVo selectNoFromCustomer(String no) {
		return sqlSession.selectOne("menu50.selectVoucherNo", no);
	}

	public List<CustomerVo> selectNameFromCustomer(String name) {
		return sqlSession.selectList("menu50.selectVoucherNo", name);
	}

	public List<PdebtVo> selectList(Long[] no) {
		List<Long>listNo = new ArrayList<Long>();
		for(Long no1: no) {
			listNo.add(no1);
		}
		List<PdebtVo> list = sqlSession.selectList("menu50.selectpdebtlist",listNo);
		return list;
	}
	
}
