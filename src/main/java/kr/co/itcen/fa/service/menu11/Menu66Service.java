package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu66Repository;
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
@Service
public class Menu66Service {
	
	@Autowired
	private Menu66Repository menu66Repository;

	public DataResult<RepayVo> list(int page, String code, String debtType) {
		DataResult<RepayVo> dataResult = new DataResult<RepayVo>();
		int totalCnt = menu66Repository.listCount(code, debtType);
		
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<RepayVo> list = menu66Repository.list(code, debtType, pagination);
		dataResult.setDatas(list);

		return dataResult;
	}

	public Boolean update(RepayVo vo) {
		return menu66Repository.update(vo);
	}
	
	// 전표번호와 일치하는 상환테이블 데이터 조회
	public Long select(Long no) {
		return menu66Repository.select(no);
	}
	
	// 상환잔액을 업데이트 하기 전 이전으로 돌리기
	public Boolean restoreRepayBal(RepayVo vo) {
		return menu66Repository.restoreRepayBal(vo);
	}
	
	// 상환후 갱신된 단기차입금 정보 select
	public STermDebtVo getSTermDebtOne(Long debtNo) {
		return menu66Repository.getSTermDebtOne(debtNo);
	}

	// 상환후 갱신된 장기차입금 정보 select
	public LTermdebtVo getLTermDebtOne(Long debtNo) {
		return menu66Repository.getLTermDebtOne(debtNo);
	}

	// 상환후 갱신된 사채 정보 select
	public PdebtVo getPdebtOne(Long debtNo) {
		return menu66Repository.getPdebtOne(debtNo);
	}

	// 상환잔액 업데이트
	public Boolean updateRepayVo(RepayVo vo) {
		return menu66Repository.updateRepayVo(vo);
	}

	// 전표번호 읽어오기
	public List<Long> selectVoucherNo(Long[] no) {
		return menu66Repository.selectVoucherNo(no);
	}

	// 상환테이블에서 상환정보 삭제
	public Boolean delete(Long[] no) {
		return menu66Repository.delete(no);
	}

}
