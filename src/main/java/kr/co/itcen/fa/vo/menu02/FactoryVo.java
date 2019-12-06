package kr.co.itcen.fa.vo.menu02;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 강민호 
 * 공장 테이블
 *
 */

@Alias("factory33vo")
public class FactoryVo {
	private String no;					//공장코드
	private String name;				//공장명
	private String purchaseitemcode;	//매입품목코드
	private String postaddress;			//우편번호
	private String roadaddress;			//도로명주소
	private String detailaddress;		//상세주소
	private String managername;			//담당자명
	private String originNo;			//기존 공장코드
	private String deleteflag;			//삭제여부
	private String insertuserid;		//입력자
	private String insertday;			//입력날짜
	private String updateuserid;		//수정자
	private String updateday;			//수정날짜
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPurchaseitemcode() {
		return purchaseitemcode;
	}
	public void setPurchaseitemcode(String purchaseitemcode) {
		this.purchaseitemcode = purchaseitemcode;
	}
	public String getPostaddress() {
		return postaddress;
	}
	public void setPostaddress(String postaddress) {
		this.postaddress = postaddress;
	}
	public String getRoadaddress() {
		return roadaddress;
	}
	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getManagername() {
		return managername;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public String getOriginNo() {
		return originNo;
	}
	public void setOriginNo(String originNo) {
		this.originNo = originNo;
	}
	public String getDeleteflag() {
		return deleteflag;
	}
	public void setDeleteflag(String deleteflag) {
		this.deleteflag = deleteflag;
	}
	public String getInsertuserid() {
		return insertuserid;
	}
	public void setInsertuserid(String insertuserid) {
		this.insertuserid = insertuserid;
	}
	public String getInsertday() {
		return insertday;
	}
	public void setInsertday(String insertday) {
		this.insertday = insertday;
	}
	public String getUpdateuserid() {
		return updateuserid;
	}
	public void setUpdateuserid(String updateuserid) {
		this.updateuserid = updateuserid;
	}
	public String getUpdateday() {
		return updateday;
	}
	public void setUpdateday(String updateday) {
		this.updateday = updateday;
	}
	@Override
	public String toString() {
		return "FactoryVo [no=" + no + ", name=" + name + ", purchaseitemcode=" + purchaseitemcode + ", postaddress="
				+ postaddress + ", roadaddress=" + roadaddress + ", detailaddress=" + detailaddress + ", managername="
				+ managername + ", originNo=" + originNo + ", deleteflag=" + deleteflag + ", insertuserid="
				+ insertuserid + ", insertday=" + insertday + ", updateuserid=" + updateuserid + ", updateday="
				+ updateday + "]";
	}
}
