package kr.co.itcen.fa.service.menu01;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu30Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.PreviousVo;
import kr.co.itcen.fa.vo.menu01.ReceiptVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu17.StatementDataVo;

/**
 * 
 * @author 김승곤 황슬기
 * 계정거래처명세서조회
 *
 */
@Service
public class Menu30Service {
	
	@Autowired
	private Menu30Repository menu30Repository;
	

	public DataResult<ReceiptVo> search(int page, ReceiptVo revo) {
		DataResult<ReceiptVo> dataResult = new DataResult<ReceiptVo>();
	
		System.out.println(revo);
		int totalCnt = menu30Repository.listCount(revo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		System.out.println(totalCnt);
		dataResult.setPagination(pagination);
		List<ReceiptVo> list = menu30Repository.list(pagination,revo);
		dataResult.setDatas(list);
		
		List<StatementDataVo> statementDataList = menu30Repository.statementData();
		closingEntries(statementDataList);
		
		return dataResult;
	}
	
	public void closingEntries(List<StatementDataVo> sVo) {
		if(sVo==null) {								//전달값이 없을경우 그냥 반환
			return;
		}
		List<PreviousVo> pVo = new ArrayList<PreviousVo>();
		
		for(int i=0; i<sVo.size();i++) {				//거래처 계정별 amount 계산
			if(sVo.get(i).getAccountNo()>=4000000) {
				continue;
			}
			
			if(exist(pVo, sVo.get(i))) {
				if(get(pVo, sVo.get(i)).getAmountFlag().equals(sVo.get(i).getAmountFlag())) {
					get(pVo, sVo.get(i)).setAmount(get(pVo, sVo.get(i)).getAmount() + sVo.get(i).getAmount());
				}else {
					get(pVo, sVo.get(i)).setAmount(get(pVo, sVo.get(i)).getAmount() - sVo.get(i).getAmount());
				}
				
			}else {
				PreviousVo vo = new PreviousVo();
				vo.setAccountNo(sVo.get(i).getAccountNo());
				vo.setCustomerNo(sVo.get(i).getCustomerNo());
				if(vo.getAccountNo().toString().substring(0,1).equals("1")) {
					vo.setAmountFlag("d");
				}else {
					vo.setAmountFlag("c");
				}
				
				if(vo.getAmountFlag().equals(sVo.get(i).getAmountFlag())) {
					vo.setAmount(sVo.get(i).getAmount());
				}else {
					vo.setAmount(-sVo.get(i).getAmount());
				}
				
				
				pVo.add(vo);
			}
		}
		
		
		for(int i=0; i<pVo.size(); i++) {						// 잔액큰 기준으로 차대변 변환
			if(pVo.get(i).getAmount()<0) {
				pVo.get(i).setAmount(-pVo.get(i).getAmount());
				if(pVo.get(i).getAmountFlag().equals("c")) {
					pVo.get(i).setAmountFlag("d");
				}else {
					pVo.get(i).setAmountFlag("c");
				}
			}
		}
		
		for(int i=0; i<pVo.size(); i++) {						//전표 입력
			VoucherVo voucherVo = new VoucherVo();
			VoucherVo voucherVo2 = new VoucherVo();
			ItemVo itemVo = new ItemVo();
			ItemVo itemVo2 = new ItemVo();
			MappingVo mappingVo = new MappingVo();
			MappingVo mappingVo2 = new MappingVo();
			
			if(pVo.get(i).getAmountFlag().equals("c")) {

				voucherVo.setRegDate("2019-11-30");				//->regdate기준으로 수정예정
				
				itemVo.setAmount(pVo.get(i).getAmount());
				itemVo.setAmountFlag("d");
				itemVo.setAccountNo(pVo.get(i).getAccountNo());
				
				mappingVo.setVoucherUse("차월이월");						//적요		
				mappingVo.setCustomerNo(pVo.get(i).getCustomerNo());		
			
//				Long no=menu03Service.createVoucher(voucherVo, itemVo, mappingVo, user);
				
				voucherVo2.setRegDate("2019-12-01");
				itemVo2.setAmount(pVo.get(i).getAmount());//예금
				itemVo2.setAmountFlag("c");//차변
				itemVo2.setAccountNo(pVo.get(i).getAccountNo());//계정과목코드
				
				mappingVo2.setVoucherUse("전월이월");						//적요
				mappingVo2.setCustomerNo(pVo.get(i).getCustomerNo());	
				
				System.out.println( mappingVo.getCustomerNo()+":"+itemVo.getAccountNo() + ":"+itemVo.getAmount() +":"	+ itemVo.getAmountFlag()+":"+voucherVo.getRegDate());
				System.out.println( mappingVo2.getCustomerNo()+":"+itemVo2.getAccountNo() + ":"+itemVo2.getAmount() +":"	+ itemVo2.getAmountFlag()+":"+voucherVo2.getRegDate());
//				Long no=menu03Service.createVoucher(voucherVo2, itemVo2, mappingVo2, user);
				
			}else {
				voucherVo.setRegDate("2019-11-30");
				
				itemVo.setAmount(pVo.get(i).getAmount());
				itemVo.setAmountFlag("c");
				itemVo.setAccountNo(pVo.get(i).getAccountNo());
				
				mappingVo.setVoucherUse("차월이월");						//적요		
				mappingVo.setCustomerNo(pVo.get(i).getCustomerNo());		
			
//				Long no=menu03Service.createVoucher(voucherVo, itemVo, mappingVo, user);
				
				voucherVo2.setRegDate("2019-12-01");
				itemVo2.setAmount(pVo.get(i).getAmount());//예금
				itemVo2.setAmountFlag("d");//차변
				itemVo2.setAccountNo(pVo.get(i).getAccountNo());//계정과목코드
				
				mappingVo2.setVoucherUse("전월이월");						//적요
				mappingVo2.setCustomerNo(pVo.get(i).getCustomerNo());	
				
//				Long no=menu03Service.createVoucher(voucherVo2, itemVo2, mappingVo2, user);
			
				System.out.println( mappingVo.getCustomerNo()+":"+itemVo.getAccountNo() + ":"+itemVo.getAmount() +":"	+ itemVo.getAmountFlag()+":"+voucherVo.getRegDate());
				System.out.println( mappingVo2.getCustomerNo()+":"+itemVo2.getAccountNo() + ":"+itemVo2.getAmount() +":"	+ itemVo2.getAmountFlag()+":"+voucherVo2.getRegDate());
			}
			
			
		}
		
		
	}	
	
	
	public boolean exist(List<PreviousVo> pVo, StatementDataVo sVo) {			//존재하는지 여부
		if(pVo==null) {
			return false;
		}
		for(int i=0; i<pVo.size(); i++) {
			if(pVo.get(i).exist(sVo.getAccountNo(),sVo.getCustomerNo())) {
				
				return true;
			}
		}
		return false;
	}
	
	public PreviousVo get(List<PreviousVo> pVo, StatementDataVo sVo) {			//값얻기
		for(int i=0; i<pVo.size(); i++) {
			if(pVo.get(i).exist(sVo.getAccountNo(),sVo.getCustomerNo())) {
				return pVo.get(i);
			}
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
