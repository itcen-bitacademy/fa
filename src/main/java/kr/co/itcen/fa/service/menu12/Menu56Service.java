package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu56Repository;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별 매입매출현황
 *
 */
@Service
public class Menu56Service {
	
	@Autowired
	private Menu56Repository menu56Repository;
	
	public void test() {
		menu56Repository.test();
	}
	
	public List<CurrentSituationVo> getList(CurrentSituationVo vo){
		return menu56Repository.getList(vo);
	}
	
	// 대분류  보여주기 위한 코드
	public List<SectionVo> getCategory(){
		return menu56Repository.getCategory(); 
	}
	
	// 품목 분류 보여주기 위한 코드
	public List<CurrentSituationVo> getItemname(String sectioncode){
		return menu56Repository.getItemname(sectioncode);
	}
	
}
