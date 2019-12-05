package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu44Repository;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;


/**
 * 
 *  @author 김유진
 *  무형자산조회
 */

@Service
public class Menu44Service {
	
	@Autowired
	private Menu44Repository menu44Repository;
	
	public void test() {
		menu44Repository.test();
	}

	public Map<? extends String, ? extends Object> getSection() {
		Map<String, Object> map = new HashMap<>();
		map.put("sectionList",menu44Repository.getSection());
		return map;
	}

	public List<IntangibleAssetsVo> getList() {
		return menu44Repository.getList();
	}
}