package kr.co.itcen.fa.vo.menu01;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 임성주
 * 매핑관리
 *
 */

@Alias("1mappingvo")
public class MappingVo {
	private Long no; // 매핑번호
	private String voucherUse; // 전표사용목적
	private int tax; // 부가세
	private String insertUserid; // 등록자
	private Date insertDay; 	 // 등록일
	private String updateUserid; // 수정자
	private Date updateDay; 	 // 수정일
	private boolean useYn;		 // 사용여부
	private Long voucherNo; // 전표번호
	private Long voucherOrderNo; // 전표순번
	private Long purchaseNo; // 매입번호
	private Long landId; //토지번호
	private Long buildingId; // 건물번호
	private Long vehicleId; // 차량번호
	private Long intangibleAssetsId; // 무형자산번호
	private Long sTermDebtNo; // 단기차입금번호
	private Long lTermDebtNo; // 장기차입금번호
	private Long pDebtNo; // 사채번호
	private Long repaymentNo; // 상환내역번호
	private Long salesIdx; // 매출번호
	private Long cardNo; // 카드번호
	private Long dipositeNo; // 계좌번호
	private Long customerNo; // 거래처번호
	private String manageNo; // 증빙코드(세금계산서)
	
	@Override
	public String toString() {
		return "MappingVo [no=" + no + ", voucherUse=" + voucherUse + ", tax=" + tax + ", insertUserid=" + insertUserid
				+ ", insertDay=" + insertDay + ", updateUserid=" + updateUserid + ", updateDay=" + updateDay
				+ ", useYn=" + useYn + ", voucherNo=" + voucherNo + ", voucherOrderNo=" + voucherOrderNo
				+ ", purchaseNo=" + purchaseNo + ", landId=" + landId + ", buildingId=" + buildingId + ", vehicleId="
				+ vehicleId + ", intangibleAssetsId=" + intangibleAssetsId + ", sTermDebtNo=" + sTermDebtNo
				+ ", lTermDebtNo=" + lTermDebtNo + ", pDebtNo=" + pDebtNo + ", repaymentNo=" + repaymentNo
				+ ", salesIdx=" + salesIdx + ", cardNo=" + cardNo + ", dipositeNo=" + dipositeNo + ", customerNo="
				+ customerNo + ", manageNo=" + manageNo + "]";
	}
	
	// getter, setter
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getVoucherUse() {
		return voucherUse;
	}
	public void setVoucherUse(String voucherUse) {
		this.voucherUse = voucherUse;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public String getInsertUserid() {
		return insertUserid;
	}
	public void setInsertUserid(String insertUserid) {
		this.insertUserid = insertUserid;
	}
	public Date getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(Date insertDay) {
		this.insertDay = insertDay;
	}
	public String getUpdateUserid() {
		return updateUserid;
	}
	public void setUpdateUserid(String updateUserid) {
		this.updateUserid = updateUserid;
	}
	public Date getUpdateDay() {
		return updateDay;
	}
	public void setUpdateDay(Date updateDay) {
		this.updateDay = updateDay;
	}
	public boolean isUseYn() {
		return useYn;
	}
	public void setUseYn(boolean useYn) {
		this.useYn = useYn;
	}
	public Long getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(Long voucherNo) {
		this.voucherNo = voucherNo;
	}
	public Long getVoucherOrderNo() {
		return voucherOrderNo;
	}
	public void setVoucherOrderNo(Long voucherOrderNo) {
		this.voucherOrderNo = voucherOrderNo;
	}
	public Long getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(Long purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	public Long getLandId() {
		return landId;
	}
	public void setLandId(Long landId) {
		this.landId = landId;
	}
	public Long getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(Long buildingId) {
		this.buildingId = buildingId;
	}
	public Long getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(Long vehicleId) {
		this.vehicleId = vehicleId;
	}
	public Long getIntangibleAssetsId() {
		return intangibleAssetsId;
	}
	public void setIntangibleAssetsId(Long intangibleAssetsId) {
		this.intangibleAssetsId = intangibleAssetsId;
	}
	public Long getsTermDebtNo() {
		return sTermDebtNo;
	}
	public void setsTermDebtNo(Long sTermDebtNo) {
		this.sTermDebtNo = sTermDebtNo;
	}
	public Long getlTermDebtNo() {
		return lTermDebtNo;
	}
	public void setlTermDebtNo(Long lTermDebtNo) {
		this.lTermDebtNo = lTermDebtNo;
	}
	public Long getpDebtNo() {
		return pDebtNo;
	}
	public void setpDebtNo(Long pDebtNo) {
		this.pDebtNo = pDebtNo;
	}
	public Long getRepaymentNo() {
		return repaymentNo;
	}
	public void setRepaymentNo(Long repaymentNo) {
		this.repaymentNo = repaymentNo;
	}
	public Long getSalesIdx() {
		return salesIdx;
	}
	public void setSalesIdx(Long salesIdx) {
		this.salesIdx = salesIdx;
	}
	public Long getCardNo() {
		return cardNo;
	}
	public void setCardNo(Long cardNo) {
		this.cardNo = cardNo;
	}
	public Long getDipositeNo() {
		return dipositeNo;
	}
	public void setDipositeNo(Long dipositeNo) {
		this.dipositeNo = dipositeNo;
	}
	public Long getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(Long customerNo) {
		this.customerNo = customerNo;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	
}
