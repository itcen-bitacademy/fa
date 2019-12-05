package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu45Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.BankVo;

/**
 * 
 * @author 이지수
 * 은행코드현황조회
 *
 */
@Service
public class Menu45Service {
	
	@Autowired
	private Menu45Repository menu45Repository;

	// 은행명으로 은행정보 조회
	public List<BankVo> selectBankInfo(String bankname) {
		return menu45Repository.selectBankInfo(bankname);
	}

	// 은행정보 리스트로 조회
	public DataResult<BankVo> list(BankVo vo, int page) {
		DataResult<BankVo> dataResult = new DataResult<BankVo>();
		
		int totalCnt = menu45Repository.selectBankListCount(vo);
		System.out.println("totalCnt 토탈카운트 : " + totalCnt);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		/*System.out.println("Menu45Service page : " + page);
		System.out.println("getPage : " + pagination.getPage());
		System.out.println("getTotalCnt : " + pagination.getTotalCnt());
		System.out.println("getTotalPageCnt : " + pagination.getTotalPageCnt());
		System.out.println("getPageSize : " + pagination.getPageSize());
		System.out.println("getListSize : " + pagination.getListSize());
		System.out.println("getStartPage : " + pagination.getStartPage());
		System.out.println("getEndPage : " + pagination.getEndPage());
		System.out.println("isPrev : " + pagination.isPrev());
		System.out.println("isNext : " + pagination.isNext());
		System.out.println("getPageIndex : " + pagination.getPageIndex());*/
		
		dataResult.setPagination(pagination);
		List<BankVo> list = menu45Repository.list(vo, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}
}
