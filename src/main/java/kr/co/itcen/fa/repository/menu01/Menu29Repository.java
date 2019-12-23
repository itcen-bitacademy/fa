package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.ReceiptVo;

/**
 * 
 * @author 김승곤 황슬기
 * 계정거래처명세서조회
 *
 */

@Repository
public class Menu29Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount(ReceiptVo revo) {
		
		return sqlSession.selectOne("menu29.listCount",revo);
	}

	public List<ReceiptVo> list(PaginationUtil pagination, ReceiptVo revo) {
		Map<String, Object> map = new HashMap<String, Object>();
		revo.setCustomerNo("0200017");
		map.put("pagination", pagination);
		map.put("vo", revo);
		List<ReceiptVo> list= sqlSession.selectList("menu29.list",map);
		return list;
	}
}
