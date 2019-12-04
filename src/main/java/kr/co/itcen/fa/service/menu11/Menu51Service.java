package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu51Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

/**
 * 
 * @author 박준호 사채현황조회
 *
 */
@Service
public class Menu51Service {

	@Autowired
	private Menu51Repository menu51Repository;

	public DataResult<PdebtVo> list(int page, PdebtVo pdebtVo) {
		DataResult<PdebtVo> dataResult = new DataResult<PdebtVo>();
		int totalCnt = menu51Repository.listCount(pdebtVo);
		System.out.println("totalCnt 토탈카운트 : " + totalCnt);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		System.out.println("사채현황조회 Menu51Service page : " + page);
		System.out.println("getPage : " + pagination.getPage());
		System.out.println("getTotalCnt : " + pagination.getTotalCnt());
		System.out.println("getTotalPageCnt : " + pagination.getTotalPageCnt());
		System.out.println("getPageSize : " + pagination.getPageSize());
		System.out.println("getListSize : " + pagination.getListSize());
		System.out.println("getStartPage : " + pagination.getStartPage());
		System.out.println("getEndPage : " + pagination.getEndPage());
		System.out.println("isPrev : " + pagination.isPrev());
		System.out.println("isNext : " + pagination.isNext());
		System.out.println("getPageIndex : " + pagination.getPageIndex());
		
		System.out.println("getDebtDate : " + pdebtVo.getDebtDate());
		System.out.println("getIntPayWay : " + pdebtVo.getIntPayWay());
		System.out.println("getBankCode : " + pdebtVo.getBankCode());
		System.out.println("getExpDate : " + pdebtVo.getExpDate());
		
		dataResult.setPagination(pagination);
		List<PdebtVo> list = menu51Repository.list(pagination, pdebtVo);
		dataResult.setDatas(list);

		return dataResult;
	}

	public List<SectionVo> selectSection() {
		return menu51Repository.selectSection();
	}
}
