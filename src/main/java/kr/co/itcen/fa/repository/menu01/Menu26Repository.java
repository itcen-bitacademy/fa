package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 황슬기 
 * 계좌조회
 *
 */

@Repository
public class Menu26Repository {
	@Autowired
	private SqlSession sqlSession;
	

	public List<BankAccountVo> list(BankAccountVo bavo, PaginationUtil pagination) {
		Map<String, Object> s = new HashMap<String, Object>();
		bavo.setDepositNo(bavo.getDepositNo()+"%");
		
		s.put("bavo", bavo);
		s.put("pagination", pagination);
		
		List<BankAccountVo> res = sqlSession.selectList("menu26.read", s); 
		
		return res;
	}
	
	public int selectCount(BankAccountVo bavo) {	
		int res = sqlSession.selectOne("menu26.getCount", bavo);
		return res;
	}

}
