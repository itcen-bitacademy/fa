package kr.co.itcen.fa.service.menu11;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu50Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

/**
 * 
 * @author 박준호
 * 사채관리
 *
 */
@Service
public class Menu50Service {
	
	@Autowired
	private Menu50Repository menu50Repository;
	
	// 사채정보입력
	public void insert(PdebtVo pdebtVo) {
		menu50Repository.insert(pdebtVo);
	}
	
	// 사채현황관리 페이지에서 리스트에 데이터 출력
	public DataResult<PdebtVo> list(int page, String year, String code) {
		DataResult<PdebtVo> dataResult = new DataResult<PdebtVo>();
		int totalCnt = menu50Repository.listCount(year, code);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<PdebtVo> list = menu50Repository.list(year, code, pagination);
		dataResult.setDatas(list);

		return dataResult;
	}
	
	// 사채코드와 일치하는 데이터 조회
	public PdebtVo selectOnePdebtInfo(String debtcode) {
		return menu50Repository.selectOnePdebtInfo(debtcode);
	}

	// 은행 팝업창에서 은행코드로 조회 - 은행코드로 데이터 출력
	public BankVo selectOneBankcodeInfo(String bankcode) {
		return menu50Repository.selectOneBankcodeInfo(bankcode);
	}

	// 은행 팝업창에서 은행명으로 데이터 리스트형식으로 조회 - 은행명으로 데이터 출력
	public List<BankVo> selectOneBanknameInfo(String bankname) {
		return menu50Repository.selectOneBanknameInfo(bankname);
	}

	// 사채관리 페이지에서 수정을 눌렀을 때, 해당 사채정보 수정
	public Boolean update(PdebtVo pdebtVo) throws ParseException {
		return menu50Repository.update(pdebtVo);
	}
	
	// 사채테이블에서 사채정보 삭제
	public Boolean delete(Long[] no) {
		return  menu50Repository.delete(no);
	}

	// 공통테이블에 있는 차입금대분류 데이터 호출
	public List<SectionVo> selectSection() {
		return menu50Repository.selectSection();
	}

	// 전표번호와 일치하는 사채테이블 데이터 조회
	public Long select(Long no) {
		return menu50Repository.select(no);
	}
	
	// 상환데이터 입력
	public Boolean insertRepayVo(RepayVo vo) {
		return menu50Repository.insertRepayVo(vo);
	}

	// 상환데이터 수정
	public Boolean updateRepayVo(RepayVo vo) {
		return menu50Repository.updateRepayVo(vo);
	}

	// 상환후 갱신된 정보 select
	public PdebtVo getOne(Long debtNo) {
		return menu50Repository.getOne(debtNo);
	}

	// 상환완료된 데이터 flag update
	public Boolean updateRepayFlag(Long no) {
		return menu50Repository.updateRepayFlag(no);
	}

	// 전표번호 읽어오기
	public List<Long> selectVoucherNo(Long[] no) {
		return menu50Repository.selectVoucherNo(no);
	}
	
	// 동일한 사채코드가 존재하는지 비교
	public PdebtVo existCode(String code) {
		return menu50Repository.getCode(code);
	}

	//상환내역이 있을경우 수정불가
	public List<RepayVo> getRepay(Long no) {
		return menu50Repository.getRepay(no);
	}

	//상환내역이 있을경우 수정불가 (no를 배열로 전달)
	public List<RepayVo> getRepay(Long[] no) {
		return menu50Repository.getRepay(no);
	}

}
