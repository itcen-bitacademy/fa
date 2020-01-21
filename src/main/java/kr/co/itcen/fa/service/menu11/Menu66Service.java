package kr.co.itcen.fa.service.menu11;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu66Repository;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.util.Pagination;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 박준호
 * 상환내역관리
 *
 */
@Service
public class Menu66Service {
	
	@Autowired
	private Menu66Repository menu66Repository;
	
	@Autowired
	private Menu03Service menu03Service;

	@Transactional
	public DataResult<RepayVo> list(int page, String code, String debtType) {
		DataResult<RepayVo> dataResult = new DataResult<RepayVo>();
		int totalCnt = menu66Repository.listCount(code, debtType);
		
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<RepayVo> list = menu66Repository.list(code, debtType, pagination);
		dataResult.setDatas(list);

		return dataResult;
	}
	
	@Transactional
	public Map getList(RepayVo vo, int page, int pageSize){
		int totalCnt = menu66Repository.getTotalCnt(vo);
		System.out.println("totalCnt : " + totalCnt);
		Pagination pagination = new Pagination(page, totalCnt);
		Map map = pagination.getRowRangeMap();
		map.put("vo", vo);
		System.out.println("Service map : " + map);
		List<RepayVo> list = menu66Repository.getList(map);
		
		System.out.println("list : " + list);
		map.clear();
		map.put("list", list);
		map.put("pagination", pagination);
		
		return map;
	}
	
	public Map getList() {
		return getList(new RepayVo(), 1, 8);
	}
	public Boolean update(RepayVo vo) {
		return menu66Repository.update(vo);
	}
	
	// 전표번호와 일치하는 상환테이블 데이터 조회
	public Long select(Long no) {
		return menu66Repository.select(no);
	}
	
	// 상환잔액을 업데이트 하기 전 이전으로 돌리기
	public Boolean restoreRepayBal(RepayVo vo) {
		return menu66Repository.restoreRepayBal(vo);
	}
	
	// 상환후 갱신된 단기차입금 정보 select
	public STermDebtVo getSTermDebtOne(Long debtNo) {
		return menu66Repository.getSTermDebtOne(debtNo);
	}

	// 상환후 갱신된 장기차입금 정보 select
	public LTermdebtVo getLTermDebtOne(Long debtNo) {
		return menu66Repository.getLTermDebtOne(debtNo);
	}

	// 상환후 갱신된 사채 정보 select
	public PdebtVo getPdebtOne(Long debtNo) {
		return menu66Repository.getPdebtOne(debtNo);
	}

	// 상환잔액 업데이트
	public Boolean updateRepayVo(RepayVo vo) {
		return menu66Repository.updateRepayVo(vo);
	}

	// 전표번호 읽어오기
	public List<Long> selectVoucherNo(Long[] no) {
		return menu66Repository.selectVoucherNo(no);
	}

	// 상환테이블에서 상환정보 삭제
	public Boolean delete(Long[] no) {
		return menu66Repository.delete(no);
	}

	public Boolean deleteDebt(Long[] no, String[] debtType, Long[] tempPayPrinc) {
		return menu66Repository.deleteDebt(no, debtType, tempPayPrinc);
	}

	public void updateDebtList(List<RepayVo> voList) {
		for(RepayVo vo : voList) 					//잔액을 원래대로 돌린다.
			menu66Repository.restoreRepayBal4Delete(vo);
	}
	
	public void updateDebt(RepayVo vo) {
		menu66Repository.restoreRepayBal(vo);
	}
	
	@Transactional
	public Long updateVoucher(RepayVo vo, UserVo authUser) {
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();

		MappingVo mappingVo = new MappingVo();
		voucherVo.setNo(vo.getVoucherNo());
		voucherVo.setRegDate(vo.getPayDate());

		//----------------- ItemVo 각각 개정과목코드에 맞게 매핑 ----------------------//
		itemVo.setAmount(vo.getIntAmount());// 이자납입금
		itemVo.setAmountFlag("d");// 차변
		itemVo.setAccountNo(9201101L);// 계정과목코드
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo);

		//-----------------단기, 장기, 사채 계정코드 분기----------------------//
		itemVo2.setAmount(vo.getPayPrinc());								// 사채에서 빠진 금액
		itemVo2.setAmountFlag("d");											// 차변
		itemVo2.setAccountNo(getAccountNoByDebtType(vo.getDebtType()));		//부채에 따른 계정코드를 가져온다.
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo2);
		//-----------------단기, 장기, 사채 계정코드 분기----------------------//

		itemVo3.setAmount(vo.getPayPrinc() + vo.getIntAmount());// 보통예금 : 예금액 = 상환액으로 입력한 값
		itemVo3.setAmountFlag("c");// 대변
		itemVo3.setAccountNo(1110103L);// tb_account 보통예금
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo3);
		//----------------- ItemVo ----------------------//
		
		setMappingVoByDebtType(mappingVo, vo);
		
		System.out.println("========= updateVoucher =========");
		System.out.println(voucherVo);
		System.out.println(itemVoList);
		System.out.println(mappingVo);
		System.out.println("========= updateVoucher =========");
		
		return menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, authUser);
	}
	
	@Transactional
	public void deleteVoucerList(List<RepayVo> voList, UserVo authUser) {
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		
		for(RepayVo repayVo : voList) {
			VoucherVo vo = new VoucherVo();
			vo.setNo(repayVo.getVoucherNo());
			voucherVolist.add(vo);
		}
		
		menu03Service.deleteVoucher(voucherVolist, authUser);	
	}
	
	public void deleteChecked(List<RepayVo> voList) {
		menu66Repository.updateDeleteFlag(voList);
	}
	
	public Long getAccountNoByDebtType(String debtType) {
		Long accountNo = 0L;
		if(debtType.equals("S")) {
			accountNo = 2180101L; // 단기차입금
		} else if (debtType.equals("L")) {
			accountNo = 2401101L; // 장기차입금
		} else if (debtType.equals("P")) {
			accountNo = 2402101L; // 사채
		}
		
		return accountNo;
	}
	
	public void setMappingVoByDebtType(MappingVo mappingVo, RepayVo vo) {
		STermDebtVo sTermDebtVo = null;
		LTermdebtVo lTermdebtVo = null;
		PdebtVo pdebtVo = null;
		
		if(vo.getDebtType().equals("S")) {
			sTermDebtVo = menu66Repository.getSTermDebtOne(vo.getDebtNo()); // 기존 단기차입금 컬럼 값 읽기
		} else if (vo.getDebtType().equals("L")) {
			lTermdebtVo = menu66Repository.getLTermDebtOne(vo.getDebtNo()); // 기존 장기차입금 컬럼 값 읽기
		} else if (vo.getDebtType().equals("P")) {
			pdebtVo = menu66Repository.getPdebtOne(vo.getDebtNo()); // 기존 사채 컬럼 값 읽기
		}
		
		if(vo.getDebtType().equals("S")) {
			mappingVo.setVoucherUse(sTermDebtVo.getName());// 사용목적
			mappingVo.setSystemCode(sTermDebtVo.getCode());// 사채코드 삽입 ex) I191212001
			mappingVo.setCustomerNo(sTermDebtVo.getBankCode());
			//mappingVo.setDepositNo(sTermDebtVo.getDepositNo());// 계좌번호
		} else if (vo.getDebtType().equals("L")) {
			mappingVo.setVoucherUse(lTermdebtVo.getName());// 사용목적
			mappingVo.setSystemCode(lTermdebtVo.getCode());// 사채코드 삽입 ex) I191212001
			mappingVo.setCustomerNo(lTermdebtVo.getBankCode());
			//mappingVo.setDepositNo(lTermdebtVo.getDepositNo());// 계좌번호
		} else if (vo.getDebtType().equals("P")) {
			mappingVo.setVoucherUse(pdebtVo.getName());// 사용목적
			mappingVo.setSystemCode(pdebtVo.getCode());// 사채코드 삽입 ex) I191212001
			mappingVo.setCustomerNo(pdebtVo.getBankCode());
			//mappingVo.setDepositNo(pdebtVo.getDepositNo());// 계좌번호
		}
	}
}
