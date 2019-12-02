package kr.co.itcen.fa.repository.menu02;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.FactoryVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 *  @author 강민호
 *  매입품목관리
 */

@Repository
public class Menu33Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void add(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		int count = sqlSession.selectOne("menu33.factorycodeselect");
		String fa_code = "";
		
		if(count < 9) {
			fa_code = "00" + (count+1);
		} else if(count >= 9 && count < 99) {
			fa_code = "0" + (count+1);
		} else {
			fa_code = "" + (count+1);
		}
		
		factoryVo.setNo(fa_code);
		purchaseitemVo.setFactory_code(fa_code);
		
		sqlSession.insert("menu33.purchaseitemadd", purchaseitemVo);
		sqlSession.insert("menu33.factoryadd", factoryVo);
	}

	public void update(PurchaseitemVo purchaseitemVo, FactoryVo factoryVo) {
		sqlSession.update("menu33.purchaseitemupdate", purchaseitemVo);
		sqlSession.update("menu33.factoryupdate", factoryVo);
	}
}




