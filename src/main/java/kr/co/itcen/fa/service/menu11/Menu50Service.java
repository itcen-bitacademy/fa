package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu50Repository;
import kr.co.itcen.fa.vo.menu11.BankVo;
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
	public List<PdebtVo> list(int startNum, int lastNum) {
		return menu50Repository.list(startNum, lastNum);
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
	
}
