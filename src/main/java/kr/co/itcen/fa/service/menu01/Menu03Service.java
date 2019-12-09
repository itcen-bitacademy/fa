package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu03Repository;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.StatementDataVo;

/**
 * 
 * @author 임성주
 * 전표관리
 *
 */
@Service
public class Menu03Service {
		
		@Autowired
		private Menu03Repository menu03Repository;
		
		//@Autowired
		//private Menu04Repository menu04Repository;
		
		public void test() {
			menu03Repository.test();
		}
		
		// 전표생성 (다른 팀)
		public Long createVoucher(VoucherVo voucherVo,  List<ItemVo> itemVo, MappingVo mappingVo, @AuthUser UserVo userVo) {
			voucherVo.setInsertUserid(userVo.getId());
			
			for(int i = 0; i < itemVo.size(); i++) {
				itemVo.get(i).setInsertUserid(userVo.getId());
			}
			System.out.println("!!!!!!!!!!!!" + userVo.getTeamName());
			mappingVo.setInsertTeam(userVo.getTeamName());
			mappingVo.setInsertUserid(userVo.getId());
			
			System.out.println("22222222222222222" + voucherVo.getRegDate());
			menu03Repository.createVoucher(voucherVo, itemVo, mappingVo);
			
			return voucherVo.getNo(); // 전표번호
		}
		
		// 전표수정 (다른 팀)
		public Long updateVoucher(VoucherVo voucherVo,  List<ItemVo> itemVo, MappingVo mappingVo, @AuthUser UserVo userVo) {
			voucherVo.setUpdateUserid(userVo.getId());
			System.out.println("###########" + voucherVo.getNo());
			System.out.println("service" + mappingVo.getVoucherNo());
			for(int i = 0; i < itemVo.size(); i++) {
				System.out.println("@@@@@@@@@@" + voucherVo.getNo());
				itemVo.get(i).setUpdateUserid(userVo.getId());
			}
			System.out.println("^^^^^^^^^^" + voucherVo.getNo());
			System.out.println("service" + mappingVo.getVoucherNo());
			mappingVo.setInsertTeam(userVo.getTeamName());
			mappingVo.setUpdateUserid(userVo.getId());
			System.out.println("***********" + voucherVo.getNo());
			System.out.println("service" + mappingVo.getVoucherNo());
			voucherVo.setNo(menu03Repository.updateVoucher(voucherVo, itemVo, mappingVo));
			System.out.println("service : " + voucherVo.getNo());
			return voucherVo.getNo();
		}
		
		// 전표삭제 (다른 팀)
		public void deleteVoucher(List<VoucherVo> voucherVo, @AuthUser UserVo userVo) {
			menu03Repository.deleteVoucher(voucherVo, userVo);
		}
		
		
		// 페이징 처리
		public DataResult<VoucherVo> selectAllVoucherCount(int page) {
			DataResult<VoucherVo> dataResult = new DataResult<VoucherVo>();
			
			int totalCount = menu03Repository.selectAllVoucherCount();
			PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
			dataResult.setPagination(paginationUtil);
			
			List<VoucherVo> list = menu03Repository.selectAllVoucher(paginationUtil);
			dataResult.setDatas(list);
			
			return dataResult;
		}
		
		// 전표생성 (1팀)
		public void createVoucher(VoucherVo voucherVo, @AuthUser UserVo userVo) {
			System.out.println("a : " + userVo.getTeamName());
			System.out.println("b : " + userVo.getId());
			voucherVo.setInsertTeam(userVo.getTeamName());
			voucherVo.setInsertUserid(userVo.getId());
			
			menu03Repository.createVoucher(voucherVo);
		}
		
		// 전표삭제
		public Boolean deleteVoucher(VoucherVo voucherVo) {
			return menu03Repository.deleteVoucher(voucherVo);
		}
		
		// 전표수정
		public Boolean updateVoucher(VoucherVo voucherVo) {
			return menu03Repository.updateVoucher(voucherVo);
			
		}
		
		
		// 결산
		public List<StatementDataVo> statementData(ClosingDateVo closingDataVo) {
			return menu03Repository.statementData(closingDataVo);
		}
		
		
	}