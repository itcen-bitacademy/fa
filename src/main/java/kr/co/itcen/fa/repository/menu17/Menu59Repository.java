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
	
	public Boolean insert(AccountManagement vo) {
		int count = sqlSession.insert("menu59.insert",vo);
		return count == 1;	
	}
	
	public List<AccountManagement> getAllList(){
				
		return sqlSession.selectList("menu59.getAllList");
	}
	
	public List<AccountManagement> getAllAccountList(){
		
		return sqlSession.selectList("menu59.getAllAccountList");
	}
}
