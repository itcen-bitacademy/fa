package kr.co.itcen.fa.service.menu11;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu50Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

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
	
	public void insert(PdebtVo pdebtVo) {
		menu50Repository.insert(pdebtVo);
	}
	
	// 사채테이블 각페이지당 데이터 11개 리스트로 조회
	/*
	 * public List<PdebtVo> list(int startNum, int lastNum) { return
	 * menu50Repository.list(startNum, lastNum); }
	 */
	
	public DataResult<PdebtVo> list(int page, String year, String code) {
		DataResult<PdebtVo> dataResult = new DataResult<PdebtVo>();
		int totalCnt = menu50Repository.listCount(year, code);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<PdebtVo> list = menu50Repository.list(year, code, pagination);
		dataResult.setDatas(list);

		return dataResult;
	}
	
	// 사채테이블 전체 데이터 갯수 조회
	public int pdebtTotalcount() {
		return menu50Repository.pdebtTotalcount();
	}
	
	public PdebtVo selectOnePdebtInfo(String debtcode) {
		return menu50Repository.selectOnePdebtInfo(debtcode);
	}
	
	public void deleteChecked(List<Long> noList) {
		menu50Repository.updateDeleteFlag(noList);
	}

	public List<BankVo> bankInfoList() {
		return menu50Repository.bankInfoList();
	}

	// 은행코드로 데이터 출력
	public BankVo selectOneBankcodeInfo(String bankcode) {
		return menu50Repository.selectOneBankcodeInfo(bankcode);
	}

	public List<BankVo> selectOneBanknameInfo(String bankname) {
		return menu50Repository.selectOneBanknameInfo(bankname);
	}

	// 데이터 수정
	public Boolean update(PdebtVo pdebtVo) throws ParseException {
		DateFormat convertDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String deptExpDate = pdebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		pdebtVo.setDebtDate(convertDateFormat.parse(deptExpDate.substring(0, 10))); // 차입일자 date format으로 변경
		pdebtVo.setExpDate(convertDateFormat.parse(deptExpDate.substring(13))); // 만기일자 date format으로 변경
		return menu50Repository.update(pdebtVo);
	}
	
}
