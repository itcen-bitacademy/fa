package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별매입매출현황
 *
 */
@Repository
public class Menu56Repository {

	@Autowired
	private SqlSession sqlSession;

	//전체 리스트 
	public List<CurrentSituationVo> getList(CurrentSituationVo vo) {
		List<CurrentSituationVo> list = sqlSession.selectList("menu56.getList",vo);
		return list;
		
	}
	
	// 대분류 을 보여주기 위한 코드
	public List<SectionVo> getCategory(){
		return sqlSession.selectList("menu56.getcategory");
	}
	
	// 품목 을 보여주기 위한 코드
	public List<CurrentSituationVo> getItemname(String sectioncode){
		return sqlSession.selectList("menu56.getitemname",sectioncode );
	}
	
	
	
}