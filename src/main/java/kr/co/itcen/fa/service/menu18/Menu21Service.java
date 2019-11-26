package kr.co.itcen.fa.service.menu18;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu18.Menu21Repository;
import kr.co.itcen.fa.vo.menu18.TeamVo;

/**
 * 
 *  @author kickscar
 *  팀관리
 */
@Service
public class Menu21Service {

	@Autowired
	private Menu21Repository menu21Repository;
	
	public void addTeam(TeamVo teamVo) {
		menu21Repository.saveTeam(teamVo);
	}
	
	public List<TeamVo> getAllTeam(){
		return menu21Repository.findAllTeam();
	}
}
