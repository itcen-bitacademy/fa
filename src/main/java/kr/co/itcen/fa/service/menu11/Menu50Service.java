package kr.co.itcen.fa.service.menu11;

import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu50Repository;
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
@Service
public class Menu50Service {
	
	@Autowired
	private Menu50Repository menu50Repository;
	
	public void insert(PdebtVo pdebtVo) {
		menu50Repository.insert(pdebtVo);
	}
	
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
		return menu50Repository.update(pdebtVo);
	}
	
	// 계좌번호로 데이터 가져오기
	public List<BankAccountVo> selectBankaccountInfo(String depositNo) {
		List<BankAccountVo> bankaccountList = menu50Repository.selectBankaccountInfo(depositNo);
		return bankaccountList;
	}
	
	public Boolean delete(Long[] no) {
		return  menu50Repository.delete(no);
	}

	public List<SectionVo> selectSection() {
		return menu50Repository.selectSection();
	}

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

	public Boolean updateRepayFlag(Long no) {
		return menu50Repository.updateRepayFlag(no);
	}

	public PdebtVo existCode(String code) {
		return menu50Repository.getCode(code);
	}

	public List<Long> selectVoucherNo(Long[] no) {
		return menu50Repository.selectVoucherNo(no);
	}

	// 계좌번호로 은행코드 호출
	public String selectBankCode(String depositNo) {
		return menu50Repository.selectBankCode(depositNo);
	}

}
