package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu55Repository;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목별매입매출현황
 *
 */
@Service
public class Menu55Service {
	
	@Autowired
	private Menu55Repository menu55Repository;

	//전체 리스트
	public List<CurrentSituationVo> getList(CurrentSituationVo vo){
		return menu55Repository.getList(vo);
	}
	
	//품목을 가져오기 위한 코드
	public List<CurrentSituationVo> getitemcode(String itemcode) {
		return menu55Repository.getitemcode(itemcode);
	}

}
