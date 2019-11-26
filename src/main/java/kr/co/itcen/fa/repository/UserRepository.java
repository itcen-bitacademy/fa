package kr.co.itcen.fa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.UserVo;

@Repository
public class UserRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public void save(UserVo userVo) {
		sqlSession.insert("user.save", userVo);
	}
	
	public UserVo findByIdAndPassword(UserVo userVo) {
		return sqlSession.selectOne("user.findByIdAndPassword", userVo);
	}
	
	public List<UserVo> findAll() {
		return sqlSession.selectList("user.findAll");
	}

}
