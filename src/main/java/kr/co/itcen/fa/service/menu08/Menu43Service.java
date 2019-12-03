package kr.co.itcen.fa.service.menu08;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu43Repository;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;


/**
 * 
 *  @author 김유진
 *  무형자산관리
 */

@Service
public class Menu43Service {
	
	@Autowired
	private Menu43Repository menu43Repository;
	
	public void test() {
		menu43Repository.test();
	}
	
	public void insert(IntangibleAssetsVo intangibleAssetsVo) {
		menu43Repository.insert(intangibleAssetsVo);
	}

	public List<IntangibleAssetsVo> getList() {
		return menu43Repository.getList();
	}

	public void update(IntangibleAssetsVo intangibleAssetsVo) {
		menu43Repository.update(intangibleAssetsVo);
	}

	public void delete(String id) {
		menu43Repository.delete(id);
	}
}
