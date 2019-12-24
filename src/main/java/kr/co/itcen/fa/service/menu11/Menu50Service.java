package kr.co.itcen.fa.service.menu11;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu50Repository;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

/**
 * 
 * @author 박준호 
 * 사채관리
 *
 */
@Service
public class Menu50Service {

	@Autowired
	private Menu50Repository menu50Repository;

	@Autowired
	private Menu03Service menu03Service;

	// 사채정보입력
	@Transactional
	public Boolean insert(PdebtVo pdebtVo, UserVo userVo) {
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();

		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(pdebtVo.getDebtDate());

		// 예금
		itemVo.setAmount(pdebtVo.getDebtAmount());
		itemVo.setAmountFlag("d"); // 차변 - d : [예금] 자산의 증가 - 내 계좌로 돈이 들어오기 때문에..
		itemVo.setAccountNo(1110103L); // 보통예금 : 1110103
		itemVoList.add(itemVo);

		// 차입금
		itemVo2.setAmount(pdebtVo.getDebtAmount()); // 사채차입금액 입력
		itemVo2.setAmountFlag("c"); // 대변 - c : [부채] 부채의 증가 - 빚이 생김
		itemVo2.setAccountNo(2402101L); // 사채 : 계정과목코드 1팀 테이블 tb_account 확인
		itemVoList.add(itemVo2);

		mappingVo.setVoucherUse(pdebtVo.getName());// 사용목적
		mappingVo.setSystemCode(pdebtVo.getCode());// 시스템코드
		mappingVo.setCustomerNo(pdebtVo.getBankCode());
		mappingVo.setDepositNo(pdebtVo.getDepositNo());// 계좌번호

		Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo);
		pdebtVo.setVoucherNo(no);

		return menu50Repository.insert(pdebtVo);
	}

	// 사채관리 페이지에서 수정을 눌렀을 때, 해당 사채정보 수정
	@Transactional
	public Boolean update(PdebtVo pdebtVo, UserVo userVo) {
		pdebtVo.setVoucherNo(menu50Repository.select(pdebtVo.getNo()));
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		MappingVo mappingVo = new MappingVo();

		voucherVo.setNo(pdebtVo.getVoucherNo());
		voucherVo.setRegDate(pdebtVo.getDebtDate());

		// 예금
		itemVo.setAmount(pdebtVo.getDebtAmount()); // 예금
		itemVo.setAmountFlag("d"); // 차변 - d : [예금] 자산의 증가 - 내 계좌로 돈이 들어오기 때문에..
		itemVo.setAccountNo(1110103L); // 보통예금 : 1110103
		itemVo.setVoucherNo(pdebtVo.getVoucherNo());
		itemVoList.add(itemVo);

		// 차입금
		itemVo2.setAmount(pdebtVo.getDebtAmount()); // 사채차입금액 입력
		itemVo2.setAmountFlag("c"); // 대변 - c : [부채] 부채의 증가 - 빚이 생김
		itemVo2.setAccountNo(2402101L); // 사채 : 계정과목코드 1팀 테이블 tb_account 확인
		itemVo2.setVoucherNo(pdebtVo.getVoucherNo());
		itemVoList.add(itemVo2);

		mappingVo.setVoucherUse(pdebtVo.getName());// 사용목적
		mappingVo.setSystemCode(pdebtVo.getCode());// 제코드l190
		mappingVo.setCustomerNo(pdebtVo.getBankCode());
		mappingVo.setDepositNo(pdebtVo.getDepositNo());// 계좌번호
		mappingVo.setVoucherNo(pdebtVo.getVoucherNo());

		Long no = menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, userVo);
		pdebtVo.setVoucherNo(no);
		return menu50Repository.update(pdebtVo);
	}

	// 사채테이블에서 사채정보 삭제
	@Transactional
	public Boolean delete(Long[] no, UserVo userVo) {
		List<Long> list = menu50Repository.selectVoucherNo(no);
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();

		for (Long no1 : list) {
			VoucherVo v = new VoucherVo();
			v.setNo(no1);
			voucherVolist.add(v);
		}

		for (VoucherVo v : voucherVolist) {
			System.out.println(v);
		}

		menu03Service.deleteVoucher(voucherVolist, userVo);

		return menu50Repository.delete(no);
	}

	// 사채현황관리 페이지에서 리스트에 데이터 출력
	public DataResult<PdebtVo> list(int page, String year, String code) {
		DataResult<PdebtVo> dataResult = new DataResult<PdebtVo>();
		int totalCnt = menu50Repository.listCount(year, code);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<PdebtVo> list = menu50Repository.list(year, code, pagination);
		dataResult.setDatas(list);

		return dataResult;
	}

	// 사채코드와 일치하는 데이터 조회
	public PdebtVo selectOnePdebtInfo(String debtcode) {
		return menu50Repository.selectOnePdebtInfo(debtcode);
	}

	// 은행 팝업창에서 은행코드로 조회 - 은행코드로 데이터 출력
	public BankVo selectOneBankcodeInfo(String bankcode) {
		return menu50Repository.selectOneBankcodeInfo(bankcode);
	}

	// 은행 팝업창에서 은행명으로 데이터 리스트형식으로 조회 - 은행명으로 데이터 출력
	public List<BankVo> selectOneBanknameInfo(String bankname) {
		return menu50Repository.selectOneBanknameInfo(bankname);
	}

	// 공통테이블에 있는 차입금대분류 데이터 호출
	public List<SectionVo> selectSection() {
		return menu50Repository.selectSection();
	}

	// 전표번호와 일치하는 사채테이블 데이터 조회
	public Long select(Long no) {
		return menu50Repository.select(no);
	}

	//----------------------------------- Menu50RepayApicontroller -----------------------------------//
	// 상환데이터 입력
	@Transactional
	public PdebtVo insertRepayVo(RepayVo repayVo, UserVo userVo) {
		repayVo.setInsertId(userVo.getId()); // 유저 아이디 셋팅
		PdebtVo pdebtVo = menu50Repository.getOne(repayVo.getDebtNo()); // 기존 사채 컬럼 값 읽기

		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();

		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(repayVo.getPayDate());

		if (!pdebtVo.getIntPayWay().equals("E")) {
			itemVo.setAmount(repayVo.getIntAmount());// 이자납입금
			itemVo.setAmountFlag("d");// 차변
			itemVo.setAccountNo(9201101L);// 계정과목코드
			itemVoList.add(itemVo);
		}
		
		if (!(repayVo.getPayPrinc() == 0)) {
			itemVo2.setAmount(repayVo.getPayPrinc());// 사채에서 빠진 금액
			itemVo2.setAmountFlag("d");// 차변
			itemVo2.setAccountNo(2402101L);
			itemVoList.add(itemVo2);
		}

		itemVo3.setAmount(repayVo.getPayPrinc() + repayVo.getIntAmount());// 보통예금 : 예금액= 상환액으로 입력한 값
		itemVo3.setAmountFlag("c");// 대변
		itemVo3.setAccountNo(1110103L);// tb_account 보통예금 - no:1110103
		itemVoList.add(itemVo3);

		mappingVo.setVoucherUse(pdebtVo.getName());// 사용목적
		mappingVo.setSystemCode(pdebtVo.getCode());// 사채코드 삽입 ex) I191212001
		mappingVo.setCustomerNo(pdebtVo.getBankCode());
		mappingVo.setDepositNo(pdebtVo.getDepositNo());// 계좌번호

		Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo);
		repayVo.setVoucherNo(no);
		
		menu50Repository.update(pdebtVo); // 이전 사채 정보 수정
		pdebtVo = menu50Repository.getOne(repayVo.getDebtNo());
		menu50Repository.insertRepayVo(repayVo); // 상환 테이블에 insert

		if (pdebtVo.getRepayBal() == 0)
			menu50Repository.updateRepayFlag(pdebtVo.getNo());
		
		return pdebtVo;
	}

	// 상환데이터 수정
	public Boolean updateRepayVo(RepayVo vo) {
		return menu50Repository.updateRepayVo(vo);
	}

	// 상환후 갱신된 정보 select
	public PdebtVo getOne(Long debtNo) {
		return menu50Repository.getOne(debtNo);
	}

	// 상환완료된 데이터 flag update
	public Boolean updateRepayFlag(Long no) {
		return menu50Repository.updateRepayFlag(no);
	}

	// 전표번호 읽어오기
	public List<Long> selectVoucherNo(Long[] no) {
		return menu50Repository.selectVoucherNo(no);
	}

	// 동일한 사채코드가 존재하는지 비교
	public PdebtVo existCode(String code) {
		return menu50Repository.getCode(code);
	}

	// 상환내역이 있을경우 수정불가
	public List<RepayVo> getRepay(Long no) {
		return menu50Repository.getRepay(no);
	}

	// 상환내역이 있을경우 수정불가 (no를 배열로 전달)
	public List<RepayVo> getRepay(Long[] no) {
		return menu50Repository.getRepay(no);
	}

	// 은행코드로 거래처테이블에서 정보가져오기
	public CustomerVo selectNoFromCustomer(String no) {
		return menu50Repository.selectNoFromCustomer(no);
	}

	// 은행명으로 거래처테이블에서 정보가져오기
	public List<CustomerVo> selectNameFromCustomer(String name) {
		return menu50Repository.selectNameFromCustomer(name);
	}

	public List<PdebtVo> selectList(Long[] no) {
		return menu50Repository.selectList(no);
	}

}
