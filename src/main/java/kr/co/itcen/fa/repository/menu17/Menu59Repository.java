package kr.co.itcen.fa.repository.menu17;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.AccountManagement;

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
	public Boolean insert(AccountManagement vo) {
		int count = sqlSession.insert("menu59.insert",vo);
		return count == 1;	
	}
	
	//계정과목 처음 조회(대차대조표 출력)
	public List<AccountManagement> getAllList(){
				
		return sqlSession.selectList("menu59.getAllList");
	}

	//계정과목 선택조회
	public List<AccountManagement> getList(AccountManagement vo){
				
		return sqlSession.selectList("menu59.getList",vo);
	}
	
	//계정과목 셀렉트 박스에 대한 데이터 출력
	public List<AccountManagement> getAllAccountList(){
		
		return sqlSession.selectList("menu59.getAllAccountList");
	}

	//계정과목 수정
	public Boolean update(AccountManagement vo) {
		int count = sqlSession.update("menu59.accountUpdate",vo);
		return count == 1;	
	}		
	
	//계정과목 삭제
	public Boolean delete(Long no) {
		int count = sqlSession.update("menu59.accountDelete",no);
		return count == 1;	
	}	
	
	
}
