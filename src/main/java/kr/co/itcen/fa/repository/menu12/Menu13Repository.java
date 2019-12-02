package kr.co.itcen.fa.repository.menu12;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.SalesVo;

@Repository
public class Menu13Repository {
	@Autowired
	private SqlSession sqlSession;

	public void insert(ArrayList<SalesVo> list) {
		sqlSession.insert("menu13.insert", list);	
	}
}
