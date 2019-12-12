package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목별매입매출현황
 *
 */
@Repository
public class Menu55Repository {

	@Autowired
	private SqlSession sqlSession;

	//전체리스트
	public List<CurrentSituationVo> getList(CurrentSituationVo vo){
		
		List<CurrentSituationVo> list = sqlSession.selectList("menu55.getList",vo);
		return list;
	}
	
	//품목 을 가져오기위한 코드
	public List<CurrentSituationVo> getitemcode(String itemcode) {
		List<CurrentSituationVo> result = sqlSession.selectList("menu55.getitemcode",itemcode);
		return result;
		
		
	}
	
}
