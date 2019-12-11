package kr.co.itcen.fa.repository.menu17;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.AccountManagementVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;

/**
 * @작성자:	이성훈
 * @작성일:	Nov 27, 2019
 * @이메일:	dltjdgnsok72@gmail.com 
 */

@Repository
public class Menu59Repository {
	
	@Autowired
	private SqlSession sqlSession;
	
	//계정과목 저장
	public Boolean add(AccountManagementVo vo) {
		int count = sqlSession.insert("menu59.insert",vo);
		return count == 1;	
	}
	

	//계정과목 조회
	public List<AccountManagementVo> getList(Menu17SearchForm menu17SearchForm){
	
		return sqlSession.selectList("menu59.getList",menu17SearchForm);
	}

	//계정과목 조회 개수
	public int selectCount(AccountManagementVo vo) {
		return sqlSession.selectOne("menu59.selectCount",vo);
	}
	
	//계정과목,순서 중복값 체크
	public List<AccountManagementVo> chechedAccount(AccountManagementVo vo) {
		return sqlSession.selectList("menu59.chechedAccount",vo);
	}	

	//계정과목 중복값 체크
	public List<AccountManagementVo> chechedAccount2(AccountManagementVo vo) {
		return sqlSession.selectList("menu59.chechedAccount2",vo);
	}	

	//계정과목 순서 중복값 체크
	public List<AccountManagementVo> chechedAccount3(AccountManagementVo vo) {
		return sqlSession.selectList("menu59.chechedAccount3",vo);
	}	
	
	//계정과목 셀렉트 박스에 대한 데이터 출력
	public List<AccountManagementVo> getAllAccountList(){
		
		return sqlSession.selectList("menu59.getAllAccountList");
	}

	//계정과목 수정
	public Boolean update(AccountManagementVo vo) {
		int count = sqlSession.update("menu59.accountUpdate",vo);
		return count == 1;	
	}		
	
	//계정과목 삭제
	public Boolean delete(Long no) {
		int count = sqlSession.update("menu59.accountDelete",no);
		return count == 1;	
	}	
	
	
}
