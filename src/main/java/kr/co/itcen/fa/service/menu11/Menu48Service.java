package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu48Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Service
public class Menu48Service {
	
	@Autowired
	private Menu48Repository menu48Repository;
	
	public void test() {
		menu48Repository.test();
	}

	public Boolean insert(LTermdebtVo vo) {
		return menu48Repository.insert(vo);
		
	}
	//상환 insert
	public Boolean insert(RepayVo vo) {
		return menu48Repository.insert(vo);
		
	}
	public DataResult<LTermdebtVo> list(int page, String year, String code) {
		
		DataResult<LTermdebtVo> dataResult = new DataResult<LTermdebtVo>();
		
		int totalCnt = menu48Repository.listCount(year, code);
		
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<LTermdebtVo> list = menu48Repository.list(year,code, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	public Boolean update(LTermdebtVo vo) {
		return menu48Repository.update(vo);
	}

	public Boolean delete(Long[] no) {
		return  menu48Repository.delete(no);
	}

	public List<SectionVo> selectSection() {
		// TODO Auto-generated method stub
		return menu48Repository.selectSection();
	}

	public Long select(Long no) {
		// TODO Auto-generated method stub
		return menu48Repository.select(no);
	}
	public Boolean update(RepayVo vo) {
		return menu48Repository.update(vo);
	}

	public LTermdebtVo getOne(Long debtNo) {
		
		return menu48Repository.getOne(debtNo);
	}

	public LTermdebtVo existCode(String code) {
		return menu48Repository.getCode(code);
	}

	public Boolean updateRepayFlag(Long no) {
		return menu48Repository.updateRepayFlag(no);
	}

	public List<Long> selectVoucherNo(Long[] no) {
		return menu48Repository.selectVoucherNo(no);
	}

	public List<RepayVo> getRepay(Long no) {
		
		return menu48Repository.getRepay(no);
	}


}