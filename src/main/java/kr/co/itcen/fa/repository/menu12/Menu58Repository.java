package kr.co.itcen.fa.repository.menu12;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;

/**
 * 
 * @author 양홍석
 * 월별거래처매입현황
 *
 */
@Repository
public class Menu58Repository {

	@Autowired
	private SqlSession sqlSession;

	public int selectAllPurchasCount(PurchasemanagementVo purchasemanagementVo) {
		return sqlSession.selectOne("menu58.count", purchasemanagementVo);
	}

	public List<PurchasemanagementVo> selectAllPurchase(Map<String, Object> map) {
		return sqlSession.selectList("menu58.list", map);
	}
	
	public CustomerVo get(String no) {
		return sqlSession.selectOne("menu58.get", no);
	}
}
