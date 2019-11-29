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
 *  @author 안태영
 *  공통코드관리
 */
@Service
public class Menu65Service {
	
	@Autowired
	private Menu65Repository menu65Repository;
	
	public void test() {
		menu65Repository.test();
	}
	
	// 추가 화면에서 Select List에 대해 출력해주는 기능 
	public List<SectionVo> getAllMainSection(){
		return menu65Repository.findAllByParentNoNull();
	}
	
	// 추가 화면에서 화면에 입력한 내용에 대해서 넣어주는 기능
	public void addSection(SectionVo sectionVo) {
		menu65Repository.save(sectionVo);
		
	}
	
	// 모든 리스트를 출력해주는 메소드
	public List<Section> getAllSection(){
		List<Section> result = new ArrayList<>();
		
		Section listSection = null;
		List<SectionVo> list = menu65Repository.findAll();
		
		for(SectionVo vo : list) {
			if(vo.getParentNo() == null) {
				listSection = new Section(vo.getNo(), vo.getClassification(), vo.getLastUpdate());
				result.add(listSection);
				continue;
			}
			
			if(listSection != null) {
				listSection.addsubMenu(new Section(vo.getNo(), vo.getClassification(), vo.getLastUpdate()));
			}
		}
		
		return result;
	}
	
	
	
	
	
	 
}
