package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu16Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 이지수
 * 은행코드관리
 *
 */
@Service
public class Menu16Service {
	
	@Autowired
	private Menu16Repository menu16Repository;
	
	public void test() {
		menu16Repository.test();
	}

	public DataResult<BankVo> list(String code, int page) {
		DataResult<BankVo> dataResult = new DataResult<BankVo>();
		
		int totalCnt = menu16Repository.selectBankListCount(code);
		System.out.println(totalCnt);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<BankVo> list = menu16Repository.list(code, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	public void insert(BankVo vo) {
		menu16Repository.insert(vo);
	}

	public void update(BankVo vo) {
		menu16Repository.update(vo);
		
	}

	public void delete(BankVo vo) {
		menu16Repository.delete(vo);
		
	}

	public DataResult<BankVo> selectBankList(int page, String code) {
		DataResult<BankVo> dataResult = new DataResult<BankVo>();
		
		// 전체 게시글을 읽어서 그 수를 totalCount라는 변수에 넣어주게됨.
		int totalCount = menu16Repository.selectBankListCount(code);
		
		// PaginationUtil 객체를 생성한후 그 인자로써, page <- Controller에 있는 default 값 = 1
		//파라미터로 받은 page 
		// 그 다음 totalCount를 다음 인자로 넣게 됨. 이 totalCount를 기반으로 해서 페이징이 결정됨.
		// 11과 5는 <- 11은 한 페이지에 11개의 게시글이 보여지게 하라는 뜻, 5라는 뜻은 5개의 페이징의 의미
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(paginationUtil);//dataResult타입에 pagination에 값 세팅 
		
		//// 검색기능을 구현했을때 사용하는 페이징
		//Menu11SearchForm menu11SearchForm = new Menu11SearchForm();//개인 조건을 넣어주는 폼 
		//menu11SearchForm.setPagination(paginationUtil);// paginnationUtil 세팅
		//List<BankVo> list = menu16Repository.selectAllClosingDate(menu11SearchForm);//뽑은 list를 dataResult타입을 list에 세팅 => 1개~ 11개 모두 리스트에 세팅
		//dataResult.setDatas(list);
		
		return dataResult;
	}

	public Boolean existCode(String code) {
		
		return menu16Repository.getCode(code) != null;
	}

	
		
}
