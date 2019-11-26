package kr.co.itcen.fa.repository.menu18;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu18.TeamVo;

/**
 * 
 *  @author kickscar
 *  팀관리
 */
@Repository
public class Menu21Repository {

	@Autowired
	private SqlSession sqlSession;

	public void saveTeam(TeamVo teamVo) {
		sqlSession.insert("admin.saveTeam", teamVo);
	}

	public List<TeamVo> findAllTeam() {
		return sqlSession.selectList("admin.findAllTeam");
	}
}
