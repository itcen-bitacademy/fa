package kr.co.itcen.fa.repository.menu01;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.Menu03SearchForm;
import kr.co.itcen.fa.vo.menu01.TestVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;

/**
 * 
 * @author 임성주 
 * 전표관리
 *
 */

@Repository
public class Menu03Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("김길동");
		sqlSession.insert("menu03.save", testVo);
	}
	
	// 전표생성
	public Long createVoucher(VoucherVo voucherVo, List<ItemVo> itemVo, MappingVo mappingVo) {
		sqlSession.insert("menu03.insertVoucher", voucherVo); // 전표테이블 입력
		System.out.println("222233333333" + voucherVo.getNo());
		for(int i = 0; i < itemVo.size(); i++) {
			itemVo.get(i).setVoucherNo(voucherVo.getNo());
			System.out.println("33333333" + voucherVo.getNo());
			sqlSession.insert("menu03.insertItem", itemVo.get(i)); // 항목테이블 입력
		}
		
		mappingVo.setVoucherNo(voucherVo.getNo());
		sqlSession.insert("menu03.insertMapping", mappingVo); // 매핑테이블 입력
		
		return voucherVo.getNo();	// 전표번호
	}
	
	// 전표 전체 갯수 조회
	public int selectAllVoucherCount() {
		return sqlSession.selectOne("menu03.selectAllVoucherCount");
	}
	
	public List<VoucherVo> selectAllVoucher(Menu03SearchForm menu03SearchForm) {
		// TODO: 페이징 추가
		return sqlSession.selectList("menu03.selectAllVoucher", menu03SearchForm);
	}
	
}
