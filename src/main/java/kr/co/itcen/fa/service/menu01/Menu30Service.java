package kr.co.itcen.fa.service.menu01;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu30Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.PreviousVo;
import kr.co.itcen.fa.vo.menu01.ReceiptVo;
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
		
		for(int i=0; i<sVo.size();i++) {
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
		for(int i=0 ;i<pVo.size();i++) {
			System.out.print(pVo.get(i).toString());
			System.out.println();
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
