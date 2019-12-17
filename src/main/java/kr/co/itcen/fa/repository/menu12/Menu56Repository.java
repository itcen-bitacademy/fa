package kr.co.itcen.fa.repository.menu12;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
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
	public List<CurrentSituationVo> getList(PaginationUtil pagination ,CurrentSituationVo vo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pagination", pagination);
		map.put("vo",vo);
		List<CurrentSituationVo> list = sqlSession.selectList("menu56.getList",map);
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
	
	//전체 글의 수를 세기 위한 카운트
	public int selectAllCount(CurrentSituationVo vo) {
		return sqlSession.selectOne("menu56.selectAllCount",vo);
	}
	
}