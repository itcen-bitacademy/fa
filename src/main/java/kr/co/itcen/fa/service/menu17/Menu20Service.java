package kr.co.itcen.fa.service.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu20Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;

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
	public List<ClosingDateVo> selectClosingDateByYear(String year) {
		return menu20Repository.selectClosingDateByYear(year);
	}
}
