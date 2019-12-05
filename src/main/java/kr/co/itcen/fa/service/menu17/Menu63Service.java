package kr.co.itcen.fa.service.menu17;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu63Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;


/**
 * 
 * @author 유지훈
 * 대차대조표조회
 */

@Service
public class Menu63Service {
	
	@Autowired
	private Menu63Repository menu63Repository;
	
	//대차대조표(BalanceSheet) Insert
	public Boolean insertBalanceSheet(ClosingDateVo vo) {
		int result = menu63Repository.insertBalanceSheet(vo);
		return result == 1;
	}
	
	
	//대차대조표(BalanceSheet) Select
	public Map<String,Object> get(Long no) {
		return menu63Repository.get(no);
	}
	
	
	//대차대조표(BalanceSheet) Delete
	public boolean deleteBalanceSheet(ClosingDateVo closingDate) {
		int result = menu63Repository.deleteBalanceSheet(closingDate);
		return result == 1;
	}
	
}
