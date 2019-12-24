package kr.co.itcen.fa.service.menu11;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu48Repository;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
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
	
	@Autowired
	private Menu03Service menu03Service;
	
	
	public void test() {
		menu48Repository.test();
	}
	
	//insert 장기차입금
	@Transactional
	public Boolean insert(LTermdebtVo vo,UserVo user) {
	
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(vo.getDebtDate());
		
		
		
		itemVo.setAmount(vo.getDebtAmount());//예금
		itemVo.setAmountFlag("d");//차변
		itemVo.setAccountNo(1110103L);//계정과목코드
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(vo.getDebtAmount());//장기차입금
		itemVo2.setAmountFlag("c");
		itemVo2.setAccountNo(2401101L);
		itemVoList.add(itemVo2);
		
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setCustomerNo(vo.getBankCode());
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		
		
		
		Long no=menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
		
		vo.setVoucherNo(no);
	
		
		return menu48Repository.insert(vo);
		
	}
	//상환 insert
	
	@Transactional
	public LTermdebtVo insert(RepayVo vo,UserVo uservo) {
		
		vo.setInsertId(uservo.getId());//유저 아이디 셋팅
		LTermdebtVo lvo = menu48Repository.getOne(vo.getDebtNo());//기존 장기차입금 컬럼 값 읽기
		
		
		
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(vo.getPayDate());
		if(!lvo.getIntPayWay().equals("E")) {
			itemVo.setAmount(vo.getIntAmount());//이자납입금
			itemVo.setAmountFlag("d");//차변
			itemVo.setAccountNo(9201101L);//계정과목코드
			itemVoList.add(itemVo);
		}
		if(!(vo.getPayPrinc() == 0)) {
			itemVo2.setAmount(vo.getPayPrinc());//장기차입금에서 빠진 금액
			itemVo2.setAmountFlag("d");//차변
			itemVo2.setAccountNo(2401101L);
			itemVoList.add(itemVo2);
		}
		itemVo3.setAmount(vo.getPayPrinc()+vo.getIntAmount());//예금액= 상환액으로 입력한 값
		itemVo3.setAmountFlag("c");//대변
		itemVo3.setAccountNo(1110103L);//dPrma
		itemVoList.add(itemVo3);
		
		mappingVo.setVoucherUse(lvo.getName());//사용목적
		mappingVo.setSystemCode(lvo.getCode());//제코드l190
		
		mappingVo.setCustomerNo(lvo.getBankCode());
		mappingVo.setDepositNo(lvo.getDepositNo());//계좌번호
		
		
		Long no=menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, uservo);
		
		vo.setVoucherNo(no);
		
		
		menu48Repository.update(vo);//기존 장기 차입금 수정
		lvo = menu48Repository.getOne(vo.getDebtNo());//기존 장기차입금 컬럼 값 읽기
		menu48Repository.insert(vo);
		if(lvo.getRepayBal() == 0)
			menu48Repository.updateRepayFlag(lvo.getNo());
		
		return lvo;
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
	@Transactional
	public Boolean update(LTermdebtVo vo,UserVo user) {
		vo.setVoucherNo(menu48Repository.select(vo.getNo()));
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setNo(vo.getVoucherNo());
		
		
		voucherVo.setRegDate(vo.getDebtDate());
		itemVo.setAmount(vo.getDebtAmount());//장기차입금 금액
		itemVo.setAmountFlag("c");//차변
		itemVo.setAccountNo(2401101L);
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo);
		
			
		itemVo2.setAmount(vo.getDebtAmount());//예금
		itemVo2.setAmountFlag("d");
		itemVo2.setAccountNo(1110103L);
		itemVo2.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo2);
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setCustomerNo(vo.getBankCode());
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		mappingVo.setVoucherNo(vo.getVoucherNo());
		
		
		Long n=menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, user);
		vo.setVoucherNo(n);
		return menu48Repository.update(vo);
	}
	@Transactional
	public Boolean delete(Long[] no,UserVo uservo) {
		
		List<Long> list = menu48Repository.selectVoucherNo(no);
		
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		for(Long no1: list) {
			VoucherVo v = new VoucherVo();
			v.setNo(no1);
			
			voucherVolist.add(v);
		}
		for(VoucherVo v : voucherVolist) {
			System.out.println(v);
		}
		
		menu03Service.deleteVoucher(voucherVolist, uservo);
		
		
		return  menu48Repository.delete(no);
	}

	public List<SectionVo> selectSection() {
		// TODO Auto-generated method stub
		return menu48Repository.selectSection();
	}

	
	

	public LTermdebtVo existCode(String code) {
		return menu48Repository.getCode(code);
	}


	public List<RepayVo> getRepay(Long no) {
		
		return menu48Repository.getRepay(no);
	}
	public List<RepayVo> getRepay(Long[] no) {
		
		return menu48Repository.getRepay(no);
	}

	public List<LTermdebtVo> selectList(Long[] no) {
		
		return menu48Repository.selectList(no);
	}

	public Boolean updateBankAccount(BankAccountVo bankAccount) {
		return menu48Repository.updateBankAccount(bankAccount);
	}

}