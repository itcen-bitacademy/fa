package kr.co.itcen.fa.service.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu19Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Service
public class Menu19Service {
	
	@Autowired
	private Menu19Repository menu19Repository;
	
	public void test() {
		menu19Repository.test();
	}
	
	/**
	 * 
	 * 마감일 등록
	 */
	public int insertClosingDate(ClosingDateVo closingDate) {
		return menu19Repository.insertClosingDate(closingDate);
	}
	
	/**
	 * 
	 * 마감일 전체 조회(마감일순 내림차순)
	 */
	public List<ClosingDateVo> selectAllClosingDate() {
		return menu19Repository.selectAllClosingDate();
	}
	
	
	/**
	 * 
	 * 마감일 수정(미결산 마감일만 수정 가능)
	 */
	public int updateClosingDate(ClosingDateVo closingDate) {
		return menu19Repository.updateClosingDate(closingDate);
	}
	
	
	/**
	 * 
	 * 마감일 삭제(미결산 마감일만 삭제 가능)
	 */
	public int deleteClosingDate(ClosingDateVo closingDate) {
		return menu19Repository.deleteClosingDate(closingDate);
	}
}
