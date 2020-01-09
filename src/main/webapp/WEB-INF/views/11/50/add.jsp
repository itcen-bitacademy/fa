
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
#dialog-confirm{z-index: 2222!important;}
/* 상환정보 dialog에서 Error Modal 생성시, dialog앞에 Modal생성 */
.p-debt-code-input {width: 270px;}

/* 테이블의 첫 row 모두 padding right */
.form-horizontal .control-label {text-align: left;}
.first-span-first-padding-right {padding-right: 20px;}
.second-span-first-padding-right {padding-right: 20px;}
.radio {float: left; width: 17%;}

.search-input-width-first {width: 130px;}
.search-input-width-second {width: 225px;}

.debt-name-input {width: 420px;}
.mgr-input {width: 90px; display: inline;}
.mgr-number-input-h4 {display: inline; margin-left: 30px; margin-right: 20px;}
.mgr-call-input {width: 140px; display: inline;}

.mybtn {float: left; margin-right: 10px;}

.textarea{resize: none; width: 282px; height: 84px;}
</style>
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">

				<div class="page-header position-relative">
					<h1 class="pull-left">사채관리</h1>
				</div>

				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" method="post" action="" id="inputForm" name="debtInputForm" >
					<div class="container-fluid">
						<!-- Example row of columns -->
						<div class="row">
							<div class="span8">
								<table class="input-form-left">
									<tr>
										<td>
											<label class="control-label">사채코드</label>
										</td>
										<td colspan="2">
										<input type="hidden" name="no" id = "no" />
										<c:choose>
											<c:when test='${code eq ""}'>
												<input type="text" name="code" id ="code" class="p-debt-code-input" maxlength="10"/>
											</c:when>
											<c:otherwise>
												<input type="text" name="code" id="code" class="p-debt-code-input" value="${code}" maxlength="10"/>
											</c:otherwise>
										</c:choose>
										<input class="btn btn-primary btn-small" id="duplicatecode-checkbtn" name="checkcodebtn" type="button" value="중복확인">
										<img id="img-checkcode" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">사채명</label>
										</td>
										<td colspan="2">
											<textarea id="onlyHangulAndNumber" class="textarea" name="name" maxlength="90" ></textarea>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">차입금액</label>
										</td>
										<td style="display: inline-block;"><input type="text" id="inputPrice" name="textDebtAmount" style="text-align:right;"/> <h5 style="display: inline-block;">(원)</h5><input type="hidden" id="hidden-dept-amount" name="debtAmount" /></td>
									</tr>
									<tr>
										<td>
											<label class="control-label">차입일자 ~ 만기일자</label>
										</td>
										<td colspan="2">
											<div class="row-fluid input-prepend">
												<input type="text" name="debtExpDate" id="id-date-range-picker-1" readonly="readonly"/><span class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">이자지급방식</label>
										</td>
										<td colspan="2">
										<div class="radio">
											<label class="control-label">
												<input name="intPayWay" type="radio" class="ace" value="Y"/>
												<span class="lbl">연</span>
											</label>
										</div>
										<div class="radio">
											<label class="control-label">
												<input name="intPayWay" type="radio" class="ace" value="M"/>
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio">
											<label class="control-label">
												<input name="intPayWay" type="radio" class="ace" value="E"/>
												<span class="lbl">해당없음</span>
											</label>
										</div>
									</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">거래처코드</label>
										</td>
										<td colspan="2">
												<div class="input-append">
													<input type="text" class="search-input-width-first" name="bankCode" placeholder="은행코드" maxlength="7" readonly/>
														<span class="add-on">
							                                    <a href="#" id="a-bankinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i></a>
							                        	</span>
												</div>
												<input type="text" class="search-input-width-second" name="bankName" placeholder="은행명" readonly/>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">위험등급</label>
										</td>
										<td colspan="2">
										<select class="chosen-select form-control" name="dangerCode" id="dangercode-field-select" data-placeholder="위험등급">
											<option value=""></option>
											<option value="RED1-초고위험">초고위험</option>
											<option value="ORANGE2-고위험">고위험</option>
											<option value="YELLOW3-중위험">중위험</option>
											<option value="GREEN4-저위험">저위험</option>
											<option value="BLUE5-초저위험">초저위험</option>
										</select>
										</td>
									</tr>
								</table>
							</div>
							<div class="span8">
								<table>
									<tr>
										<td>
											<label class="control-label">회계연도</label>
										</td>
										<td>
											<c:choose>
												<c:when test='${year eq ""}'>
													<input type="number" min="1900" max="2099" step="1" value="2019" id="financialyearId" name="financialYear" placeholder="회계연도" />
												</c:when>
												<c:otherwise>
													<input type="number" min="1900" max="2099" step="1" value="${year}" id="financialyearId" name="financialYear" placeholder="회계연도" />
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">차입금대분류</label>
										</td>
										<td colspan="2">
										<select class="chosen-select form-control" id="majorcode-field-select" data-placeholder="차입금대분류" name="majorCode" >
												<option value=""></option>
												<c:forEach items="${sectionlist}" var="sectionvo">
													<option value="${sectionvo.code}">${sectionvo.classification }</option>
												</c:forEach>
										</select>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">상환방법</label>
										</td>
										<td colspan="2">
												<div class="radio">
													<label class="control-label">
														<input name="repayWay" type="radio" class="ace" value="Y"/>
														<span class="lbl">연</span>
													</label>
												</div>
												<div class="radio">
													<label class="control-label">
														<input name="repayWay" type="radio" class="ace"  value="M"/>
														<span class="lbl">월</span>
													</label>
												</div>
												<div class="radio">
													<label class="control-label">
														<input name="repayWay" type="radio" class="ace"  value="E"/>
														<span class="lbl">만기</span>
													</label>
												</div>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">이율</label>
										</td>
										<td colspan="2">
											<input type="text" name="intRate" onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)" style="text-align:right;"/> <h5 style="display: inline-block;">(%)</h5>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">담당자</label>
										</td>
										<td>
											<input type="text" class="mgr-input" name="mgr" />
										</td>
										<td>
											<label class="control-label">담당자전화번호</label>
										</td>
										<td>
											<input type="text" class="mgr-call-input" name="mgrCall" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
										</td>
									</tr>
									<tr>
										<td>
											<label class="control-label">계좌</label>
										</td>
										<td colspan="3">
											<div class="input-append">
												<input type="text" class="search-input-width-first" id="input-id-depositNo" name="depositNo" placeholder="계좌번호" readonly/>
													<span class="add-on">
						                            	<a href="#" id="a-bankaccountinfo-dialog" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i></a>
						                            </span>
											</div>
												<!-- 계좌정보 Modal pop-up : end -->
												<input type="text" class="search-input-width-second" name="depositHost" placeholder="예금주" readonly/>
										</td>
									</tr>
								</table>
								
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
								<div id="dialog-bankinfo-message" title="은행코드" hidden="hidden">
									<table id ="dialog-message-table" align="center">
										<tr>
											<td>
												<label class="control-label">은행코드</label>
													<div class="input-append">
														<input type="text"  id="input-dialog-bankcode" style="width:100px;"/>
															<span class="add-on">
								                            	<a href="#" id="a-dialog-bankcode"><i class="icon-search icon-on-right bigger-110"></i></a>
										                    </span>
													</div>
											</td>
											<td>
												<label class="control-label">은행명</label>
													<div class="input-append">
														<input type="text"  id="input-dialog-bankname" style="width:100px;"/>
															<span class="add-on">
										                    	<a href="#" id="a-dialog-bankname"><i class="icon-search icon-on-right bigger-110"></i></a>
										                    </span>
													</div>
											</td>
										</tr>
									</table>
									<!-- 은행코드 및 은행명 데이터 리스트 -->
									<table id="modal-bank-table" class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">은행코드</th>
												<th class="center">은행명</th>
											</tr>
										</thead>
										<tbody id="tbody-bankList">
										</tbody>
									</table>
								</div>
								<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
												
												
								<!-- 계좌정보 Modal pop-up : start -->
								<div id="dialog-account-message" title="계좌" hidden="hidden">
									<table id="dialog-account-message-table">
										<tr>
											<td>
												<label class="control-label">계좌번호</label>
												<input type="text" id="input-dialog-depositNo" style="width: 100px;" />
													<a href="#" id="a-dialog-depositNo"><span class="btn btn-small btn-info" style="margin-bottom: 10px;">조회</span></a>
											</td>
										</tr>
									</table>
									<!-- 계좌정보 데이터 리스트 -->
									<table id="modal-deposit-table" class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">계좌번호</th>
												<th class="center">예금주</th>
												<th class="center">은행코드</th>
												<th class="center">은행명</th>
											</tr>
										</thead>
										<tbody id="tbody-bankaccountList">
										</tbody>
									</table>
								</div>
								
								<!-- 차입금코드,납입원금,납입이자,납입일자,부채유형 Modal pop-up : start -->
								<div id="dialog-repayment" title="상환정보등록" hidden="hidden">
									<table id ="dialog-repayment-table" align="center">
										<tr>
											<td>
												<label class="control-label">차입금코드</label>
												<input type="text" id="repaycode" name="debtcode" readonly= "readonly"/>
											</td>
										</tr>
										<tr>
											<td>
											<label class="control-label">납입일자</label>
											<div class="row-fluid input-prepend">
							                 <input class="date-picker" type="text" name="payDate" id="id-date-picker-1"  data-date-format="yyyy-mm-dd" />
							                    <span class="add-on">
							                     <i class="icon-calendar"></i>
							              	</span>
							                </div>
											</td>
										</tr>
										<tr>
											<td>
												<label class="control-label">납입원금</label>
												<input type="text" name="text-name-payPrinc" id= "text-id-payPrinc" style="text-align:right;"/> <h5 style="display: inline-block;">(원)</h5>
												<input type="hidden" name="payPrinc" id= "payPrinc" style="text-align:right;"/>
											</td>
										</tr>
										<tr>
											<td>
												<label class="control-label">이자금액</label>
												<input type="text" name="intAmount" id= "intAmount" readonly="readonly" style="text-align:right;"/> <h5 style="display: inline-block;">(원)</h5>
											</td>
										</tr>
										<tr>
											<td>
												<label class="control-label">총액</label>
												<input type="text" name="totalAmount" id= "totalAmount" readonly="readonly" style="text-align:right;" value="0"/> <h5 style="display: inline-block;">(원)</h5>
											</td>
										</tr>
										</table>
								</div>
								<!-- 차입금코드,납입원금,납입이자,납입일자,부채유형 Modal pop-up : end -->
							
								<!-- 상환 내역 리스트 -->
								<div id="dialog-repayment-ischeck" title="상환정보여부" hidden="hidden">
									<!-- 계좌정보 데이터 리스트 -->
											<table id="modal-repayment-table" class="table  table-bordered table-hover">
												<label id="repay-code"></label>
												<thead>
													<tr>
														<th class="center">코드</th>
														<th class="center">상환금액</th>
														<th class="center">이자금액</th>
														<th class="center">상환일</th>
													</tr>
												</thead>
												<tbody id="tbody-repaymentList">
												</tbody>
											</table>
								</div>
								
								<!-- 상환 내역 리스트 -->
								<div id="dialog-repayment-delete" title="상환정보여부" hidden="hidden">
									<!-- 계좌정보 데이터 리스트 -->
								</div>
								
								<div id="dialog-confirm" class="hide">
									<p id="dialog-txt" class="bolder grey">
									</p>
								</div>
					
							</div>
						</div>
					</div>
					<hr>
						<div class="row-fluid">
							<button type="button" id="insertbtn" class="btn btn-primary btn-small mybtn">입력</button>
							<button type="submit" id="updatebtn" class="btn btn-warning btn-small mybtn">수정</button>
							<button type="button" id="deletebtn" class="btn btn-danger btn-small mybtn" onclick="deleteChecked()">삭제</button>
							<button type="button" id="searchbtn" class="btn btn-info btn-small mybtn">조회</button>
							<button type="button" id="repaybtn" class="btn btn-small mybtn">상환</button>
							<button type="button" id="clearbtn" class="btn btn-default btn-small mybtn">초기화</button>
						</div>
					<hr>
				</form>
				<!-- PAGE CONTENT ENDS -->

				<!-- list -->
				<p>총 ${contentsCount }건</p>
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" >
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="checkall" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">사채코드</th>
							<th class="center">사채명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환잔액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자</th>
							<th class="center">만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>
							<th class="center">은행코드</th>
							<th class="center">계좌</th>
							<th class="center">위험등급</th>
							<th class="center">등록일</th>
						</tr>
					</thead>
						<tbody id="tbody-list">
						<c:forEach items="${dataResult.datas}" var="vo" varStatus="status">
							<tr class="row-select">
								<td class="center" data-no="${vo.no }">
									<label class="pos-rel" onclick='event.cancelBubble=true'>
										<input type="checkbox" class="ace checkboxtable" data-no="${vo.no }" name="checkBox" id="checkboxId" onchange='rowChecked(this)'/>
										<span class="lbl"></span>
									</label>
								</td>
								<td class="center">${vo.code}</td>
								<td>${vo.name}</td>
						        <c:choose>
											<c:when test="${vo.majorCode eq '001'}"><td class="center">국내은행</td></c:when>
											<c:when test="${vo.majorCode eq '002'}"><td class="center">저축은행</td></c:when>
											<c:when test="${vo.majorCode eq '003'}"><td class="center">신용금고</td></c:when>
											<c:when test="${vo.majorCode eq '004'}"><td class="center">새마을금고</td></c:when>
											<c:when test="${vo.majorCode eq '005'}"><td class="center">외국계은행</td></c:when>
											<c:otherwise><td class="center">증권</td></c:otherwise>
								</c:choose>	
								<td class="center"><fmt:formatNumber value="${vo.debtAmount}" pattern="#,###" /><input type="hidden" name="tbody-hidden-debtAmount" value="${vo.debtAmount}" /></td>				
								<td class="center"><fmt:formatNumber value="${vo.repayBal}" pattern="#,###" /></td>
								<c:choose>
											<c:when test="${vo.repayWay eq 'Y'}"><td class="center">연</td></c:when>
											<c:when test="${vo.repayWay eq 'M'}"><td class="center">월</td></c:when>
											<c:otherwise><td class="center">만기</td></c:otherwise>
								</c:choose>		
								<td class="center">${vo.debtDate}</td>
								<td class="center">${vo.expDate}</td>
								<td class="center">${vo.intRate}</td>
								<c:choose>
											<c:when test="${vo.intPayWay eq 'Y'}"><td class="center">연</td></c:when>
											<c:when test="${vo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
											<c:otherwise><td class="center">해당없음</td></c:otherwise>
								</c:choose>	
								<td class="center">${vo.mgr}</td>
								<td class="center">${vo.mgrCall}</td>
								<td class="center" data-bankname="${vo.bankName }">${vo.bankCode}</td>
								<td class="center" data-deposithost="${vo.depositHost }">${vo.depositNo}</td>
								<td class="center">${vo.dangerName}</td>
								<td class="center" >${vo.insertDate}</td>
							</tr>
							</c:forEach>
						</tbody>
				</table>
			</div>
			<!-- /.page-content -->
			
			<!-- 페이징 처리 알고리즘 start -->
			<div class="pagination">
			    <ul>
			        <c:choose>
			            <c:when test="${dataResult.pagination.prev }">
			                <li>
			                    <a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${dataResult.pagination.startPage - 1 }">
			                        <i class="icon-double-angle-left"></i>
			                    </a>
			                </li>
			            </c:when>
			            <c:otherwise>
			                <li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
			            </c:otherwise>
			        </c:choose>
			        <c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
			            <c:choose>
			                <c:when test="${pg eq dataResult.pagination.page }">
			                    <li class="active">
			                        <a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${pg }">${pg}</a>
			                    </li>
			                </c:when>
			                <c:otherwise>
			                    <li>
			                        <a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${pg}">${pg}</a>
			                    </li>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			        <c:choose>
			            <c:when test="${dataResult.pagination.next }">
			                <li>
			                    <a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${dataResult.pagination.endPage + 1 }">
			                        <i class="icon-double-angle-right"></i>
			                    </a>
			                </li>
			            </c:when>
			            <c:otherwise>
			                <li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
			            </c:otherwise>
			        </c:choose>
			    </ul>
			</div>
			<!-- 페이징 처리 알고리즘 end -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
			
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/ace/js/ace-elements.min.js"></script>
	<script>
	$(function() {
		// button action 막기
		$('button').on('click', function(e) { e.preventDefault(); })
		$(".chosen-select").chosen();

		// daterangepicker 호출
		$('#id-date-range-picker-1').daterangepicker({
			format: 'YYYY-MM-DD'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		// datepicker 호출
		$('.date-picker').datepicker().next().on(ace.click_event, function(){ $(this).prev().focus(); });
	
		// 리스트에서 row를 선택하면 row의 해당 데이터 form에 추가
		$("#tbody-list tr").click(function(){ 
			var tr = $(this);
			var td = tr.children();
			if(td.eq(0).children().children().prop('checked') == false){
				formInsertion(this);
			} else {
				formDeletion(this);
			}
		});
	});
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// Validation Modal Code 작성 -------------------------------------------------------------------------------------------//
	var ischecked = false; //중복체크 하지 않을 경우를 확인하기 위한 변수
	$(function() {
		// 입력버튼 이벤트 연결
		$('#insertbtn').on('click', insertDebtData);
		
		// 수정버튼 이벤트 연결
		$('#updatebtn').on('click', updateDebtData);
		
		// 삭제버튼 이벤트 연결
		$('#deletebtn').on('click', deleteDebtData);
		
		// 조회버튼 이벤트 연결
		$('#searchbtn').on('click', searchDebtData);
		
		// 상환버튼 이벤트 연결
		$('#repaybtn').on('click', repayDebtData);
		
		// 초기화버튼 이벤트 연결
		$('#clearbtn').on('click', clearDebtData);
		
		// 중복코드 확인 이벤트 연결
		$('#duplicatecode-checkbtn').on('click', checkCodeDebtData);
		
		// 사채코드 중복체크
		$("#code").change(function(){ $("#duplicatecode-checkbtn").show(); $("#img-checkcode").hide(); });	
		
		// 삭제시 체크박스에 선택 및 다중선택 적용
		$('#checkall').on('click', checkDebtDataForDelete);
		
		// 거래처테이블에서 은행코드로 거래처 검색 - Ajax
		$('#a-dialog-bankcode').on('click', searchCustomerByBankcode);
		
		// 거래처테이블에서 은행명으로 거래처 검색 - Ajax
		$('#a-dialog-bankname').on('click', searchCustomerByBankname);
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// dialog
		// 거래처 dialog 생성
		$('#a-bankinfo-dialog').on('click', showCustomerDialog);
		
		// 계좌 dialog 생성
		$('#a-bankaccountinfo-dialog').on('click', showAccountDialog);
		
		// 계좌정보 불러와서 뿌려주기
		$('#dialog-account-message-table').on('click', '#a-dialog-depositNo', bringAccountInfo);
		
		// 계좌정보 테이블에서 row를 선택하면, row의 해당 데이터 form input에 추가
		$(document.body).delegate('#tbody-bankaccountList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=depositNo]").val(td.eq(0).text());
			$("input[name=depositHost]").val(td.eq(1).text());
			$("#dialog-account-message").dialog('close');
		});
		
		$("#dialog-repayment").dialog({ autoOpen : false });
		
		// 계좌정보 테이블 Modal(dialog 생성)
		$("#dialog-account-message").dialog({ autoOpen : false });
		//--------------------------------------------------------------------------------------------------------------------------//
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// 숫자에 콤마 적용해서 데이터 처리 : 차입금액
	    $('input[name="textDebtAmount"]').bind('keyup keydown', function(){
	        inputNumberFormat(this);
	        var amount = $('input[name=textDebtAmount]').val();
	        var coverAmount = amount.replace(/,/g, '');
	        $('input[name="debtAmount"]').val(coverAmount);
	        console.log("debtAmount : " + coverAmount);
	    });
		
		// 숫자에 콤마 적용해서 데이터 처리 : 납입금 입력
	    $("#text-id-payPrinc").bind('keyup keydown', function(){
	        inputNumberFormat(this);
	        var amount = $('input[name=text-name-payPrinc]').val();
	        var coverAmount = amount.replace(/,/g, '');
	        $('input[name="payPrinc"]').val(coverAmount);
	        
	        var intAmount = removeCommaReturn($("#intAmount").val());
	        console.log("intAmount : " + intAmount);
	     	
    		var totalAmount = parseInt($("#payPrinc").val()) + parseInt(intAmount);
    		var convertTotalAmount = numberFormat(totalAmount);
    		console.log("totalAmount : " + totalAmount);
    		
    		if(!$.isNumeric(totalAmount)) {
    			$('#totalAmount').val('0');
    			return;
    		}
    		
    		function numberFormat(inputNumber) {
    			return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		$('input[name="totalAmount"]').val(convertTotalAmount);
	    });
	    
	 	// 숫자에 콤마 적용해서 데이터 처리 : 상환내역팝업창 - 납입금액
	    $("#payPrinc").bind('keyup keydown', function(){
	        inputNumberFormat(this);
	        var amount = $('input[name=payPrinc]').val();
	        var coverAmount = amount.replace(/,/g, '');
	        // hidden값에..콤마를 뺀 값을 넣어둔다.
	        $('input[name="debtAmount"]').val(coverAmount);
	    });
	  	//--------------------------------------------------------------------------------------------------------------------------//
		
	  	// 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 input form에 추가
		$(document.body).delegate('#tbody-bankList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=bankCode]").val(td.eq(0).text());
			$("input[name=bankName]").val(td.eq(1).text());
			$("#dialog-bankinfo-message").dialog('close'); // 데이터를 선택하면, 창이 닫힘
		});
	  
	});
	
	// dialog 실행 Modal 메소드
	function openModal(title, message) {
		dialog(message, true);
	}
	
	// 버튼 prevent default 설정
	function disableFormSubmit(event) {
		event.preventDefault();
	}
	
	var validationMessage = ''
	
	// 사채데이터 입력 - 입력하기 전 중복데이터 확인
	function insertDebtData() {
		if (!MyValidation()) {
			openModal('Error', validationMessage);
			return;
		}
		if(ischecked == false){
			openModal('Error', '중복체크 하고 오세요');
			return;
		}
		$('#inputForm').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add');
		$('#inputForm').attr('method', 'POST');
		$('#inputForm').submit();
	}
	
	// 사채데이터 수정
	function updateDebtData(event) {
		event.preventDefault();
		var count = $("input:checkbox[name=checkBox]:checked").length;
		
		if (count > 1){
			dialog('하나의 내용만 수정할 수 있습니다');
			return;
		}
		if (count <= 0){
			dialog('수정할 데이터를 선택하여 주세요');
			return;
		}
		
		var no = $('#no').val();
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/11/50/checkrepay?no=" + no,
			contentType : "application/json; charset=utf-8",
			type: "get",
			dataType: "json",
			data: "",
			success : function(response){
				if(response.result == "fail"){
					console.error(response.message);
					return;
				}
				
				if (response.data.length === 0) {
					if(!MyValidation()){
						openModal('Error', validationMessage);
						return;
					}
					
					$('#inputForm').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update');
					$('#inputForm').attr('method', 'POST');
					$('#inputForm').submit();
					alert("사채 submit");
					return;
				} else {
					openModal('Error', "해당 차입금정보는 상환내역이 있기때문에 수정할 수 없습니다.");
					
					var repayList = response.data;
	         	  	$("#repay-code").text(repayList[0].code);
	         	  	
	         	  	for(let a in repayList) {
	         	  		$("#tbody-repaymentList").append("<tr>" +
		                          "<td class='center'>" + repayList[a].code + "</td>" +
		                          "<td class='center'>" + repayList[a].payPrinc + "</td>" +
		                          "<td class='center'>" + repayList[a].intAmount + "</td>" +
		                          "<td class='center'>" + repayList[a].payDate + "</td>" +
		                          "</tr>");
	         	  	}
	         	  	
	         	  	$("#dialog-repayment-ischeck").dialog({
	         	  		title: "상환정보",
	         	  		title_html: true,
	         	  		resizable: false,
	         	  		height: 500,
	         	  		width: 400,
	         	  		modal: true,
	         	  		close: function() {
	         	  			$('#tbody-repaymentList tr').remove();
	                    },
	                    buttons: {
	                    "닫기" : function() {
	                    	$(this).dialog('close');
	                    	$('#tbody-repaymentList tr').remove();
	                    }
	                }
	            });
	         	  	$("#dialog-repayment-ischeck").dialog('open');
	         	}
			},
			error : function(xhr,error) {
				console.err("error" + error);
			}
		});
	}
	
	// 사채데이터 삭제
	function deleteDebtData() {
		var count = $("input:checkbox[name=checkBox]:checked").length;
		
		if(0 >= count){
			openModal('Error','삭제할 데이터를 선택해 주세요','');
			return;
		}
		 
		 var no = $('#no').val();
		 
		 $.ajax({
			url: "${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/checkrepaylist?no=" + no,
			contentType : "application/json; charset=utf-8",
			type: "get",
			dataType: "json",
			data: "",
			success : function(response){
				console.log(response);
				if(response.result == "fail"){
					console.error(response.message);
					return;
				}
				
				if(response.data.length <= 0){
					console.log("상환내역이없습니다. 삭제가능!!!!!");
					$("input").attr('disabled', true);
					$("input[name=no]").attr('disabled', false);
					console.log("success : " + $("input[name=no]").val());
					// form의 id 호출
					$('#inputForm').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete');
					$('#inputForm').attr('method', 'POST');
					$('#inputForm').submit();
					return;
				} else {
					var repayList = response.data;
					var code = 0;
					
					for(let a in repayList) {
						if(code!=repayList[a].code){
							$("#dialog-repayment-delete").append(
			         	  			"<table class='table  table-bordered table-hover'>"+
			         	  			"<label id='repay-code'>"+repayList[a].code+"</label>"+ 
			         	  				"<thead>"+ 
			         	  					"<tr>"+ 
			         	  						"<th class='center'>상환금액</th>" +
												"<th class='center'>이자금액</th>" +
												"<th class='center'>상환일</th>" +
											"</tr>" +
										"</thead>" +
			         	  				"<tbody>" + 
			         	  					"<tr>" + 
			         	  						"<td class='center'>" + repayList[a].payPrinc + "</td>" +
					                           	"<td class='center'>" + repayList[a].intAmount + "</td>" +
					                           	"<td class='center'>" + repayList[a].payDate + "</td>" +
				                           	"</tr>" +
			                           	"</tbody>"+
			                        "</table>");
							  code = repayList[a].code;
			         	  } else {
			         		  var dialog = $("#dialog-repayment-delete table:last tbody ");
			         		  dialog.append(
			         				  "<tr>" +
				                          "<td class='center'>" + repayList[a].payPrinc + "</td>" +
				                          "<td class='center'>" + repayList[a].intAmount + "</td>" +
				                          "<td class='center'>" + repayList[a].payDate + "</td>" +
			                          "</tr>"
		         	  			);
		         	  			code=repayList[a].code;
		         	  		}
		         	  	}//for end
		         	  	
		                $("#dialog-repayment-delete").dialog({
		                	title: "상환정보",
		                	title_html: true,
		                	resizable: false,
		                	height: 500,
		                	width: 400,
		                	modal: true,
		                	close: function() {
		                       $('#dialog-repayment-delete *').remove();
		                       $("input").attr('disabled',false);
		                    },
		                    buttons: {
		                    	"닫기" : function() {
		                    		$(this).dialog('close');
		                    		$('#dialog-repayment-delete *').remove();
		                    		$("input").attr('disabled',false);
		                    	}
		                    }
		                });
		                $("#dialog-repayment-delete").dialog('open');
					}
				},
				error : function(xhr,error) {
					console.err("error" + error);
			}
		});
	}
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// 리스트에서 선택한 데이터 삭제
	function deleteChecked(){
		var sendData = [];
		var checkedList = $("#tbody-list input[type=checkbox]:checked");
		checkedList.each(function(i, e){
			sendData.push($(this).attr('data-no'));
		});
		$("input[name=no]").val(sendData);
	}
	//--------------------------------------------------------------------------------------------------------------------------//
	
	// 사채정보 조회
	function searchDebtData() {
		var code = $("input[name=code]").val();
		if (code.charAt(0) !== 'I') {
			openModal('Error', '조회할 사채 코드는 반드시 대문자 I로 시작하여야 합니다.');
			return false;
		}
		
		if (code.length < 10) {
			openModal('Error', '조회할 사채 코드는 10자리를 입력하셔야 합니다.');
			return false;
		}
		
		$("input").attr('disabled',true);
		console.log($("input[name=code]").val());
		$("input[name=code]").attr('disabled',false);
		$("input[name=financialYear]").attr('disabled',false);
		
		$('#inputForm').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode}');
		$('#inputForm').attr('method', 'POST');
		$('#inputForm').submit();
	}
	
	// 상환정보 입력
	function repayDebtData() {
		$("#repaycode").val($('#code').val()); // 차입금코드를 상환팝업의 차입금코드에 입력
		console.log($("input[name=code]").val());
		var count = $("input:checkbox[name=checkBox]:checked").length;
			
		if (count > 1 || count == 0) {
			openModal('Error', '상환할 데이터를 선택해 주세요');
			return;
		}
			
		$("#tbody-list tr").each(function(i){
			var td = $(this).children();
			var n = td.eq(0).attr('data-no');
			var repayAmount; // 상환잔액
			var yearIntAmount = 0; // 연이자금액
			var monthIntAmount = 0; // 월이자금액
			var intRate = td.eq(9).text().replace('%', ''); // 연이율
			var intRate12 = td.eq(9).text().replace('%', '') / 12; // 월이율
			var convertTocommaIntAmount = 0; // 이자금액에 콤마를 추가해서 금액데이터 출력
				
			if (n == $("#no").val() && "연" === (td.eq(10).text())) {
				// 연이자 지급방식
				repayAmount = parseInt(td.eq(5).text().replace(/,/g, ''));
				yearIntAmount = parseInt((repayAmount * intRate) / 100);
				convertTocommaIntAmount = comma(yearIntAmount);
				$('input[name=intAmount]').val(convertTocommaIntAmount);
				console.log("연이자 : " + convertTocommaIntAmount);
			} else if (n == $("#no").val() && "월" === (td.eq(10).text())) {
				// 월이자 지급방식
				repayAmount = parseInt(td.eq(5).text().replace(/,/g, '')); 
				monthIntAmount = parseInt((repayAmount * intRate12) / 100);
				convertTocommaIntAmount = comma(monthIntAmount);
				$('input[name=intAmount]').val(convertTocommaIntAmount);
				console.log("월이자 : " + convertTocommaIntAmount);
			} else if (n == $("#no").val() && "해당없음" === (td.eq(10).text())){
				$('input[name=intAmount]').val('0');
				console.log("이자해당없음");
			}
		});
			
		$("#dialog-repayment").dialog('open');
		$("#dialog-repayment").dialog({
			title: "상환정보등록",
			title_html: true,
			resizable: false,
			height: 500,
			width: 400,
			modal: true,
			close: function() {
				$('#repaycode').val('');
			    $('input[name=payDate]').val('');
			    $('#payPrinc').val(''); // hidden 납입금
			    $('#text-id-payPrinc').val(''); // 납입금
			    $('#intAmount').val('');
			    $('#totalAmount').val(''); // 총액
			},
			buttons: {
				// 상환버튼 클릭시
				"상환": function() {
					event.preventDefault();
					var commaExistIntAmount = $('input[name=intAmount]').val();
			    	var repayBal; // 상환잔액
					var remainmoney; // 남은돈
						
					function removeCommaIntAmount(val){
						   if(val != ""){
						    	val = val.replace(/,/g, "");
						   }
						   return val;
					}
						
					var intAmount = removeCommaIntAmount(commaExistIntAmount); // 이자금액 controller로 전달하기 전 콤마 제거
					console.log("intAmount : " + intAmount);
				    	
			    	$("#tbody-list tr").each(function(i){
			    		var td = $(this).children();
						var n = td.eq(0).attr('data-no');
						if(n == $("#no").val()){
							repayBal = parseInt(td.eq(5).text().replace(/,/g, ''));
							remainmoney = parseInt(td.eq(5).text().replace(/,/g, '')) + intAmount;
						}
			    	});
				    	
					var vo = {
							"code" : $('input[name=debtcode]').val(),
							"debtNo" : $("#no").val(), // 테이블 번호
							"payPrinc" : parseInt($('input[name=payPrinc]').val()), //납입원금
							"payDate" : $('input[name=payDate]').val(), // 상환일
							"intAmount" : intAmount // 이자금액
					}
						
					console.log("repayBal repayBal : " + repayBal);
					console.log("intAmount intAmount : " + intAmount);
						
					if (!repayValidation(repayBal, intAmount)) {
						openModal('Error', validationMessage);
						return;
			    	}
					
					// ajax 통신
					$.ajax({
						url: "${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/repay",
						contentType : "application/json; charset=utf-8",
						type: "post",
						dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
						data: JSON.stringify(vo),
						success: function(response) {
							console.log(response);
							if (response.result =="fail") {
								console.error(response.message);
								return;
							}
							
							if (response.data == null) {
								openModal('Error', "값을 정확히 입력하지 않았습니다.");
								return;
							}
								
							$("#tbody-list tr").each(function(i) {
								var td = $(this).children();
								var n = td.eq(0).attr('data-no');
								var m = 0;
								if(n == response.data.no){
									m = response.data.repayBal;
									td.eq(5).html(m.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
								}
							});
							openModal('Error', "상환데이터가 성공적으로 입력되었습니다.")
						},
						error: function(xhr, error) {
							console.error("error : " + error);
						}
					});
					$(this).dialog('close');
					//상환내역 반영
			    },
			    "닫기" : function() {
			    	$(this).dialog('close');
			    	$('#repaycode').val('');
			    	$('#payPrinc').val('');
			    	$('#id-date-picker-1').val('');
			    	$('#intAmount').val('');
			    	$('#totalAmount').val('');
				}
			}
		});
	}
	
	// 사채정보 Form 데이터 초기화
	function clearDebtData() {
		$('input').not('input[name=intPayWay]').not('input[name=repayWay]').val('');
		$('#majorcode-field-select').val('').trigger('chosen:updated');
		$('#dangercode-field-select').val('').trigger('chosen:updated');
	    $('#code').attr('readonly',false);
	    $('#financialyearId').val(2019);
		    
	    $('input[name=intPayWay]').each(function(index, item){
	    	if($(item).prop('checked') == true){
	    		$(item).prop('checked', false);
	    	}
	    });
		    
	    $('input[name=repayWay]').each(function(index, item){
	    	if($(item).prop('checked') == true){
	    		$(item).prop('checked',false);
	    	}
	    });
	    
	    $('#onlyHangulAndNumber').val(''); // 사채명 clear
	    $("#img-checkcode").hide(); // '중복확인' 체크 이미지
	    $("#duplicatecode-checkbtn").show(); // '중복확인' 버튼
	    $('#duplicatecode-checkbtn').val('중복확인');
	       
	    $("#tbody-list tr").each(function(i){
	    	var td = $(this).children();
	    	if($(td.eq(0).children().children()).prop('checked') == true){
	    		$(td.eq(0).children().children()).prop('checked', false);
	    	}
	    });
	}
	
	// 사채코드 중복 확인
	function checkCodeDebtData() {
		var code = $("#code").val();
		
		// 사채코드 형식 확인 Validation
		if (!codeValid(code)) {
			openModal('Error', validationMessage);
			return;
		}
		
		// ajax 통신
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/11/50/checkcode?code=" + code,
			type: "get",
			contentType : "application/json; charset=utf-8",
			dataType: "json",
			data: "",
			success: function(response) {
				console.log(response);
				if(response.result == "fail"){
					console.error(response.message);
					return;
				}
				
				if (response.data == null) {
					ischecked=true;
					$("#duplicatecode-checkbtn").hide();
					$("#img-checkcode").show();
					return;
				} else if (response.data.deleteFlag == "Y") {
					$("#code").val("");
					openModal('Error', "삭제된 코드입니다.");
				} else {
					$("#code").val("");
					openModal('Error', "이미 존재하는 코드입니다.");
				}
			},
			error:function(xhr,error) {
				console.err("error" + error);
			}
		});
	}
	
	// 삭제시 단일 및 다중 선택하여 데이터 삭제
	function checkDebtDataForDelete() {
		if ($(this).hasClass('allChecked')) {
			$('input[type="checkbox"]', '#simple-table').prop('checked', false);
		} else {
			$('input[type="checkbox"]', '#simple-table').prop('checked', true);
		}
		$(this).toggleClass('allChecked');
	}
	
	// 은행코드로 거래처 검색
	function searchCustomerByBankcode(event) {
		event.preventDefault();
		$("#tbody-bankList").find("tr").remove();
		var bankcodeVal = $("#input-dialog-bankcode").val();
		
		if(bankcodeVal === '') {
			openModal('Error', '은행코드를 입력해주세요.');
			return false;
		} else if (bankcodeVal.length < 7){
			openModal('Error', '은행코드를 7자 입력해주세요.');
			return false;
		}
		
		// ajax 통신
		$.ajax({
			url: "${pageContext.request.contextPath }/api/customer/getbankCode?bankCodeVal=" + bankcodeVal,
			contentType : "application/json; charset=utf-8",
			type: "get",
			dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
			data: "",
			statusCode: {
			    404: function() {
			      alert("page not found");
			    }
			},
			success: function(response){
				console.log(response.data);
				if (response.data.length === 0) {
					openModal('Error', '입력한 은행코드에 대한 결과를 찾을 수 없습니다.');
					$("#input-dialog-bankcode").val('');
					return;
				}
				
				$("#input-dialog-bankcode").val('');
				$.each(response.data,function(index, item){
		                $("#tbody-bankList").append("<tr>" +
		                		"<td class='center'>" + item.no + "</td>" +
						        "<td class='center'>" + item.name + "</td>" +
						        "</tr>");
		    	})
			},
			error: function(xhr, error){
				console.error("error : " + error);
			}
		});
	}
	
	// 은행명으로 거래처 검색
	function searchCustomerByBankname(event) {
		event.preventDefault();
		$("#tbody-bankList").find("tr").remove();
		var banknameVal = $("#input-dialog-bankname").val();
		
		if(banknameVal === '') {
			openModal('Error', '은행명을 입력해주세요.');
			return false;
		}
		// ajax 통신
		$.ajax({
			url: "${pageContext.request.contextPath }/api/customer/getbankName?bankNameVal=" + banknameVal,
			contentType : "application/json; charset=utf-8",
			type: "get",
			dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
			data: "",
			statusCode: {
			    404: function() {
			      alert("page not found");
			    }
			},
			success: function(response){
				console.log(response.data);
				if (response.data.length === 0) {
					openModal('Error', '입력한 은행명에 대한 결과를 찾을 수 없습니다.');
					$("#input-dialog-bankname").val('');
					return;
				}
				
				$("#input-dialog-bankname").val('');
				$.each(response.data,function(index, item){
		                $("#tbody-bankList").append("<tr>" +
		                		"<td class='center'>" + item.no + "</td>" +
						        "<td class='center'>" + item.name + "</td>" +
						        "</tr>");
		        })
			},
			error: function(xhr, error){
				console.error("error : " + error);
			}
		});
	}
	
	// 거래처를 검색하기 위한 dialog 생성
	function showCustomerDialog() {
		//$("#dialog-bankinfo-message").dialog('open');
		$("#dialog-bankinfo-message").dialog({
			title: "은행정보",
			title_html: true,
		   	resizable: false,
		    height: 500,
		    width: 400,
		    modal: true,
		    close: function() {
		    	$('#tbody-bankList tr').remove();
		    },
		    buttons: {
		    "닫기" : function() {
		          	$(this).dialog('close');
		          	$('#tbody-bankList tr').remove();
		        }
		    }
		});
	}
	
	// 계좌를 검색하기 위한 dialog 생성
	function showAccountDialog() {
		$("#dialog-account-message").dialog('open');
		$("#dialog-account-message").dialog({
		   	title: "계좌정보",
		   	title_html: true,
			resizable: false,
			height: 500,
			width: 400,
			modal: true,
			close: function() {
			   	$('#tbody-bankacoountList tr').remove();
			},
			buttons: {
			"닫기" : function() {
					$(this).dialog('close');
					$('#tbody-bankaccountList tr').remove();
				}
			}
		});
	}
	
	function bringAccountInfo(event) {
		event.preventDefault();
	    $("#tbody-bankaccountList").find("tr").remove();
	    var depositNo = $("#input-dialog-depositNo").val();
	        
	    // ajax 통신
	    $.ajax({
	       url: "${pageContext.servletContext.contextPath }/api/deposit/gets?depositNo=" + depositNo,
	       contentType : "application/json; charset=utf-8",
	       type: "get",
	       dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
	       statusCode: {
	           404: function() {
	             alert("page not found");
	           }
	       },
	       success: function(result){
	          console.log(result);
	          if(result.success) {
	             $("#input-dialog-depositNo").val('');
	             var baccountList = result.bankAccountList;
	             console.log(result.bankAccountList);
	             for(let a in baccountList) {
	                $("#tbody-bankaccountList").append("<tr>" +
	                       "<td class='center'>" + baccountList[a].depositNo + "</td>" +
	                       "<td class='center'>" + baccountList[a].depositHost + "</td>" +
	                       "<td class='center'>" + baccountList[a].bankCode + "</td>" +
	                       "<td class='center'>" + baccountList[a].bankName + "</td>" +
	                   "</tr>");
	             }
	          }
	       },
	       error: function(xhr, error){
	          console.error("error : " + error);
	       }
	    });
	}
	
	// checkbox를 선택했을 때, table의 row데이터 form input에 추가
	function rowChecked(thisObj){
		if (!$(thisObj).is(":checked")) {										//check 해제인 경우
			formDeletion(thisObj);
		} else {																//check를 한 경우
			formInsertion(thisObj);
		}
	}
	
	//insert Validation
	function MyValidation(){
		//코드는  중복체크에서 확인해준다
		let code = $('input[name=code]').val();//차입코드
		let name = $('input[name=name]').val();//차입명
		let majorCode = $('#majorcode-field-select').val();//차입금대분류
		let debtAmount = $('input[name=textDebtAmount]').val();//차입금
		let repayWay = $("input[name='repayWay']:checked").val(); // 상환방법
		let debtExpDate = $('input[name=debtExpDate]').val();//차입일,만기일
		let intRate = $('input[name=intRate]').val();//이율
		let intPayWay = $("input[name='intPayWay']:checked").val();//이자지급방식
		let mgr = $('input[name=mgr]').val();//담당자
		let mgrCall = $('input[name=mgrCall]').val();//담당자 번호
		let bankCode = $('input[name=bankCode]').val();// 은행코드
		let bankName = $('input[name=bankName]').val();// 은행이름
		let depositNo = $('input[name=depositNo]').val();
		let depositHost = $('input[name=depositHost]').val();
		let dangerCode = $('#dangercode-field-select').val();
		
		var isRepayWayCheck = false;
		var isIntPayWayCheck = false;
		
		//차입금명 valid
		if ('' === code) {
			validationMessage = '사채 코드는 반드시 입력하셔야 합니다(10자)';
			return false;
		} else if('' === name) {
			validationMessage = '사채명은 반드시 입력하셔야 합니다(최대50자)';
			return false;
		} else if('' === majorCode){
			validationMessage = '차입금대분류는 반드시 입력하셔야 합니다';
			return false;
		} else if ('' === debtAmount) {
			validationMessage = '차입금액은 반드시 입력하셔야 합니다';
			return false;
		} else if (0 >= parseInt(debtAmount)) {
			validationMessage = '차입금액은 0보다 커야 합니다';
			return false;
		}
		
		$('input[name=repayWay]').each(function(index,	item){
			if ($(item).prop('checked') == true) { //상환방법  Valid
				isRepayWayCheck = true;
				console.log("in : " + isRepayWayCheck);
			}
		});
		
		console.log("out : " + isRepayWayCheck);
		
		if (!isRepayWayCheck) {
			validationMessage = '상환방법은 반드시 입력하셔야 합니다';
			return false;
		} else if ('' === debtExpDate) {
			validationMessage = '차입일/만기일은 반드시 입력하셔야 합니다';
			return false;
		} else if ('' == intRate) {
			validationMessage = '이율은 반드시 입력하셔야 합니다';
			return false;
		} else if ('.' == intRate.charAt(0)) {
			validationMessage = '이율을 정확히 입력하여 주세요';
			return false;
		}
		
		$('input[name=intPayWay]').each(function(index,	item){
			if ($(item).prop('checked') == true) { //이자 지급 방식 valid
				isIntPayWayCheck = true;
				console.log("in : " + isIntPayWayCheck);
			}
		});
		
		console.log("out : " + isIntPayWayCheck);
		
		if (!isIntPayWayCheck) {
			validationMessage = '이자지급방식은 반드시 입력하셔야 합니다';
			return false;
		} else if ('' == mgr) {
			validationMessage = '담당자는 반드시 입력하셔야 합니다';
			return false;
		} else if (mgr.length > 10) {
			validationMessage = '담당자는 10자 이하로 입력하셔야 합니다';
			return false;
		} else if('' == mgrCall){
			validationMessage = '담당자 전화번호는 반드시 입력하셔야 합니다';
			return false;
		} else if(mgrCall.length > 20){
			validationMessage = '담당자 전화번호는 20자 이하로 입력하셔야 합니다';
			return false;
		} else if ('' === bankCode && '' === bankName) {
			validationMessage = '은행코드와 은행이름은 반드시 입력하셔야 합니다';
			return false;
		} else if ('' === depositNo && '' === depositHost){
			validationMessage = '계좌번호는 반드시 입력하셔야 합니다';
			return false;
		} else if ('' === dangerCode){
			validationMessage = '위험등급은 반드시 입력하셔야 합니다';
			console.log(dangerCode);
			return false;
		}
		
		return true;
	}
	
	// 사채코드 Validation
	function codeValid(code){
		if ('' === code) {
			validationMessage = '사채 코드는 반드시 입력하셔야 합니다(10자)';
			return false;
		}
		if ('I' !== code.charAt(0)) {
			validationMessage = '사채 코드는 반드시 대문자 I로 시작하여야 합니다';
			return false;
		}
		if (code.length < 10) {
			validationMessage = '사채 코드는 10자리를 입력하셔야 합니다';
			return false;
		}
		return true;
	}
	
	//상환 validation
	function repayValidation(repayBal, intAmount){
		let payDate = $('#id-date-picker-1').val();// 납입일자
		let payPrinc = $('#payPrinc').val();// 납입원금
		
		console.log("payDate : " + payDate);
		console.log("payPrinc : " + payPrinc);
		console.log("repayBal : " + repayBal);
		console.log("intAmount : " + intAmount);
		
		if (payDate === '') {
			validationMessage = '납입일은 반드시 입력하셔야 합니다';
			return false;
		} else if (0 >= payPrinc) {
			validationMessage = '납입금은 0보다 커야 합니다';
			return false;
		} else if (repayBal < payPrinc) {
			validationMessage = '납입원금이 상환 잔액보다 큽니다. 상환잔액(' + repay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ')보다 작게 입력해주세요';
			return false;
		} else if (intAmount > payPrinc) {
			var noCommaIntAmount = comma(intAmount);
			validationMessage = '이자 금액보다 납입금이 작습니다 납입금('+ noCommaIntAmount + '원)보다 크게 입력해주세요';
			return false;
		}
		return true;
	}
	
	// 은행 Modal
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// 숫자 및 한글 Validation Code -------------------------------------------------------------------------------------------//
	function delHangle(evt){//한글을 지우는 부분, keyup에 들어간다.
		var objTarger = evt.srcElement || evt.target;
		var val = event.srcElement.value;
		
		if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(val)){
			objTarger.value = null;
		}
	}
	
	function isNumberKey(evt){//숫자를 제외한 값을 입력하지 못하게 한다.
		var charCode = (evt.which) ? evt.which : event.keyCode;
		var _value = event.srcElement.value;
	
		if((event.keyCode < 48) || (event.keyCode> 57)){
			if(event.keyCode != 46){//숫자 + .만 입력 가능
				return false;
			}
		}
	
		//소수점 2번 이상 못나오게 한다
		var _pattern0 = /^\d*[.]\d*$/;//현재 value값에 소수점이 있다면 소수점 입력 불가능
		
		if(_pattern0.test(_value)){
			if(charCode == 46){
				return false;
			}
		}
		
		//두자리 이하의 숫자만 입력 가능
		var _pattern1 = /^\d{2}$/;//현재 value 값이 2자리 숫자면 .만 입력 가능
			
		//{숫자}를 값을 변경시 자리수 조정 가능
		if(_pattern1.test(_value)){
			if(charCode != 46){
				openModal('Error','100 이하의 숫자만 입력 가능합니다');
				return false;
			}
		}
	
		//소수점 2째 자리까지만 입력 가능
		var _pattern2 = /^\d*[.]\d{2}$/;//현재 value 값이 소수점 2쨰자리 숫자이면 더이상 입력 x
	
		//{숫자}를 값을 변경시 자리수 조정 가능
		if(_pattern2.test(_value)){
			openModal('Error','소수점 둘째자리까지만 입력 가능합니다');
			return false;
		}
		
		var objTarger = evt.srcElement || evt.target;
		var val = event.srcElement.value;
		
		if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(val)){
			objTarger.value = null;
		}
		
		return true;
	}
	
	//--------------------------------------------------------------------------------------------------------------------------//
	// javascript function
	// <숫자에 콤마 적용해서 데이터 처리>
	// 1. 입력한 문자열 전달
	function inputNumberFormat(obj) {
	    obj.value = comma(uncomma(obj.value));
	}
	      
	// 2. 콤마찍기
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	// 3. 콤마풀기
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}

	//4. 콤마 제거 (제거값리턴)
	function removeCommaReturn(val){
	   if(val != ""){
	    	val = val.replace(/,/g, "");
	   }
	   return val;
	}
	//--------------------------------------------------------------------------------------------------------------------------//

	 // 핵심소스
	 // 유효성 검사시 Dialog Popup 창이 모달로 떠오르게 되는 소스
	 function dialog(txt, flag) {
	        $("#dialog-txt").html(txt);
	    	var dialog = $("#dialog-confirm").dialog({
				resizable: false,
				modal: true,
				buttons: [{
					text: "OK",
					"class" : "btn btn-danger btn-mini",
					click: function() {
						if(flag){
							$(this).dialog("close"); 
							//location.href="${pageContext.request.contextPath }/11/50";
						} else {
							$(this).dialog("close"); 
						}
					}
				}]
			});
	    }
	
		//--------------------------------------------------------------------------------------------------------------------------//
		// form에 데이터 추가
		function formInsertion(thisObj){
			var tr = $(thisObj).closest("tr");
			var td = tr.children();
			
			$(td.eq(0).children().children()).prop('checked',true);
			$("#tbody-list").find("tr").css("background-color", "inherit");
	        $(tr).css("background-color", "#ddd");
		
			$("input[name=no]").val(td.eq(0).attr('data-no'));
			
			$("input[name=code]").val(td.eq(1).text()); // 사채코드
			//$("input[name=code]").attr('readonly', true);
			
			$("#onlyHangulAndNumber").val(td.eq(2).text()); // 사채명
			
			var major='';
			switch (td.eq(3).text()){
		    case '국내은행' :
		    	major='001';
		        break;
		    case '저축은행' :
		    	major='002';
			    break;
		    case '신용금고' :
		    	major='003';
		        break;
		    case '새마을금고' :
		    	major='004';
		        break;
		    case '외국계은행' :
		    	major='005';
		    	break;
		    case '증권' :
		    	major='006';
		    	break;
			}
			$('#majorcode-field-select').val(major).trigger('chosen:updated'); // 차입금대분류  
			
			// 차입금액 input 추가 (입력창에 보여지는 부분)
			$("input[name=textDebtAmount]").val(td.eq(4).text()); // 차입금액
			var debtHiddenVal = td.eq(4).text(); // 콤마가 붙지 않은 차입금액
			var debtWithoutComma = removeCommaReturn(td.eq(4).text()); // 콤마가 붙은 차입금액
			
			$("input[name=debtAmount]").val(debtWithoutComma);
			$("input[name=repayBal]").val(td.eq(5).text()); // 상환잔액
			
			var repayWay='';
			switch (td.eq(6).text()){
		    case '연' :
		    	repayWay='Y';
		        break;
		    case '월' :
		    	repayWay='M';
			    break;
		    case '만기' :
		    	repayWay='E';
		        break;
			}
			$('input:radio[name="repayWay"][value="'+repayWay+'"]').prop('checked', true); // 상환방법
			
			// 차입일자 - 만기일자
			$("input[name=debtExpDate]").val(td.eq(7).text() + " - " + td.eq(8).text());
			
			// 이율
			$("input[name=intRate]").val(td.eq(9).text());
			
			// 이자지급방식
			var intPayWay='';
			switch (td.eq(10).text()){
		    case '연' :
		    	intPayWay='Y';
		        break;
		    case '월' :
		    	intPayWay='M';
			    break;
		    case '해당없음' :
		    	intPayWay='E';
		        break;
			}
			$('input:radio[name="intPayWay"][value="'+intPayWay+'"]').prop('checked', true);
			
			$("input[name=mgr]").val(td.eq(11).text()); // 담당자
			$("input[name=mgrCall]").val(td.eq(12).text()); // 담당자전화번호
			
			$("input[name=bankCode]").val(td.eq(13).text()); // 은행코드
			$("input[name=bankName]").val(td.eq(13).attr('data-bankname')); // 은행명
			
			$("input[name=depositNo]").val(td.eq(14).text()); // 계좌
			$("input[name=depositHost]").val(td.eq(14).attr('data-deposithost')); // 예금주
			
			// 위험등급 분류
			var dangerCode='';
			switch (td.eq(15).text()){
		    case '초고위험' :
		    	dangerCode='RED1-초고위험';
		        break;
		    case '고위험' :
		    	dangerCode='ORANGE2-고위험';
			    break;
		    case '중위험' :
		    	dangerCode='YELLOW3-중위험';
		        break;
		    case '저위험' :
		    	dangerCode='GREEN4-저위험';
		        break;
		    case '초저위험' :
		    	dangerCode='BLUE5-초저위험';
		        break;
			}
			$('#dangercode-field-select').val(dangerCode).trigger('chosen:updated');  
			//$("#duplicatecode-checkbtn").hide(); // '중복확인' 버튼
		}
		
		function formDeletion(thisObj){
			var tr = $(thisObj).closest("tr");
			var td = tr.children();
			var repayWay = '';
			var intPayWay = '';
			
			$('input').not('input:radio[name="repayWay"]').not('input:radio[name="intPayWay"]').val('');
			$('#onlyHangulAndNumber').val('');
			$('#majorcode-field-select').val('').trigger('chosen:updated'); // major code select 선택
			$('#dangercode-field-select').val('').trigger('chosen:updated'); // danger code select 선택
			$('#code').attr('readonly', false); // 사채코드 입력 readonly 해제
			$('#financialyearId').val(2019);  // 회계연도 2019 설정
			$('#duplicatecode-checkbtn').val('중복확인'); // 중복확인 check
			$("#tbody-list").find("tr").css("background-color", "inherit");
			$(tr).css("background-color", "");
			$(td.eq(0).children().children()).prop('checked', false);
			$('input:radio[name="repayWay"][value="'+repayWay+'"]').prop('checked', false);
			$('input:radio[name="intPayWay"][value="'+intPayWay+'"]').prop('checked', false);				
			
			$('input[name=intPayWay]').each(function(index,	item){
				if($(item).prop('checked') == true){
					$(item).prop('checked',false);
				}	
			});
			$('input[name=repayWay]').each(function(index,	item){
				if($(item).prop('checked') == true){
					$(item).prop('checked',false);
				}	
			});
				
			$("#duplicatecode-checkbtn").show(); // '중복확인' 버튼
		}
		//--------------------------------------------------------------------------------------------------------------------------//

</script>
</body>
</html>