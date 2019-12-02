package kr.co.itcen.fa.service.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu17.Menu20Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;

/**
 * 
 * @author 김재원
 * 마감현황관리
 */

@Service
public class Menu20Service {
	
	@Autowired
	private Menu20Repository menu20Repository;
	
	
	/**
	 * 
	 * 마감일 년도 조회
	 */
	public List<String> selectClosingYear() {
		return menu20Repository.selectClosingYear();
	}
	
	
	/**
	 * 
	 * 년도별 마감현황 조회
	 */
	public DataResult<ClosingDateVo> selectClosingDateByYear(Menu17SearchForm menu17SearchForm) {
		int totalCount = menu20Repository.selectClosingDateCountByYear(menu17SearchForm);
		
		PaginationUtil paginationUtil = new PaginationUtil(menu17SearchForm.getPage(), totalCount, 11, 5);
		menu17SearchForm.setPagination(paginationUtil);
		
		DataResult<ClosingDateVo> dataResult = new DataResult<>();
		dataResult.setPagination(paginationUtil);
		dataResult.setDatas(menu20Repository.selectClosingDateByYear(menu17SearchForm));
		
		return dataResult;
	}
}
