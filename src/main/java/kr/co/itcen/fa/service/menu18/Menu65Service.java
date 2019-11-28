package kr.co.itcen.fa.service.menu18;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.Section;
import kr.co.itcen.fa.repository.menu18.Menu65Repository;
import kr.co.itcen.fa.vo.SectionVo;

/**
 * 
 *  @author 안대혁
 *  공통코드관리
 */
@Service
public class Menu65Service {
	
	@Autowired
	private Menu65Repository menu65Repository;
	
	public void test() {
		menu65Repository.test();
	}
	
	public List<SectionVo> getAllMainSection(){
		return menu65Repository.findAllByParentNoNull();
	}
	
	public void addSection(SectionVo sectionVo) {
		menu65Repository.save(sectionVo);
		
	}
	
	// 모든 리스트를 출력해주는 메소드
	public List<Section> getAllSection(){
		List<Section> result = new ArrayList<>();
		
		Section listSection = null;
		List<SectionVo> list = menu65Repository.findAll();
		
		return result;
	}
	
	
	
	 
}
