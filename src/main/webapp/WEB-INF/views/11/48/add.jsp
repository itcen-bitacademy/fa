<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
tr td:first-child {
	padding-right: 10px;
}

.radio {
	float: left;
	width: 10%;
}

.search-input-width-first {
	width: 130px;
}

.search-input-width-second {
	width: 235px;
}

.debt-name-input {
	width: 420px;
}

.mgr-input {
	width: 90px;
	display: inline;
}

.mgr-number-input-h4 {
	display: inline;
	margin-left: 30px;
	margin-right: 20px;
}

.mgr-call-input {
	width: 150px;
	display: inline;
}
.number-input{
	text-align:right;
}
.mybtn{float:left;margin-right:20px;}
#staticBackdrop {
	z-index: -1;
}
</style>
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		

			<div class="page-header position-relative">
				<h1 class="pull-left">장기차입금관리</h1>
			</div>
			
			<!-- PAGE CONTENT BEGINS -->
				<form id="myform" class="form-horizontal">
				<div class="container-fluid">
					<!-- Example row of columns -->
					<div class="row">
						<div class="span8">
							<table>
								<tr>
									<td><h4>장기차입금코드</h4></td>
									<td>
										<input type="hidden" name="no" id = "no" />
										<input type="text" name="code" id ="code" />
										<input id="btn-check-code" type="button" value="중복확인">
										<img id="img-checkcode" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
									</td>
								</tr>
								<tr >
									<td><h4>장기차입금명</h4></td>
									<td colspan="2">
										<input type="text" name="name" id="name"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금액</h4></td>
									<td><input type="text" id ="debtAmount" name="debtAmount" class="number-input numberformat" /></td>
								</tr>
								<tr>
									<td><h4>차입일자 ~ 만기일자</h4></td>
									<td colspan="2">
									<div class="control-group">
				                        <div class="row-fluid input-prepend">			                        	
				                           <input type="text" name="debtExpDate" id ="id-date-range-picker-1" readonly />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                          </div>
				                      </div>
									</td>
								</tr>
								<tr>
									<td><h4>이자지급방식</h4></td>
									<td colspan="2">
										<div class="radio" >
											<label>
												<input name="intPayWay" type="radio" class="ace" value="Y" />
												<span class="lbl">연</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="M" />
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="E" />
												<span class="lbl">해당없음</span>
											</label>
										</div>
									</td>
								</tr>
								<tr>
						                              	
									<td><h4>은행코드</h4></td>
									<td colspan="2">
									<div class="input-append">
										<input type="text" class="search-input-width-first" id ="bank_code" name="bankCode" readonly />
												<span class="add-on">
				                                    <a href="#" id="a-bankinfo-dialog" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i>
				                                    </a>
				                                 </span>
									</div>
									
									<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
												<div id="dialog-message" title="은행코드" hidden="hidden">
															<table id ="dialog-message-table" align="center">
																<tr>
																	<td>
																	<label>은행코드</label>
																	<div class="input-append">

																	<input type="text"  id="input-dialog-bankcode" style="width:100px;"/>
																		<span class="add-on">
										                                    <a href="#" id="a-dialog-bankcode" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i>
										                                    </a>
										                                 </span>
																		</div>
																	</td>
																	<td>
																	<label>은행명</label>
																	<div class="input-append">
																	<input type="text"  id="input-dialog-bankname" style="width:100px;"/>
																		<span class="add-on">
										                                    <a href="#" id="a-dialog-bankname" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i>
										                                    </a>
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
								<input type="text" class="search-input-width-second" name="bankName" readonly />
								</td>
								</tr>
							</table>
						</div>
						<div class="span8">
							<table>
								<tr>
									<td><h4>회계연도</h4></td>
									<td>
										<input type="number" min="1900" max="2099" step="1" value="2019" id="form-field-1" name="financialYear" placeholder="회계연도" />
									</td>
								</tr>
								<tr>
									<td><h4>차입금대분류</h4></td>
									<td colspan="2">
										<select class="chosen-select form-control" id="form-field-select-3" data-placeholder="차입금대분류" name="majorCode" >
										<option value=""></option>
										<c:forEach items="${sectionlist}" var="sectionvo">
											<option value="${sectionvo.code}">${sectionvo.classification }</option>
										</c:forEach>
										</select>
									</td>	
								</tr>
								<tr>
								<td><h4>상환방법</h4></td>
									<td colspan="2">
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace" value="Y" />
													<span class="lbl">연</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace"  value="M" />
													<span class="lbl">월</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace"  value="E" />
													<span class="lbl">만기</span>
												</label>
											</div>
									</td>
									</tr>
								<tr>
									<td><h4>이율</h4></td>
									<td colspan="2">
										<input type="text" id="int_rate" name="intRate" placeholder="(%)" class="number-input" />
									</td>
								</tr>
								<tr>
									<td><h4>담당자</h4></td>
									<td>
										<input type="text" class="mgr-input" name="mgr" id="mgr"/>
										<h4 class="mgr-number-input-h4">담당자전화번호</h4>
										<input type="text" class="mgr-call-input" name="mgrCall" id="mgrCall" />
									</td>
								</tr>
								<tr>
									<td><h4>계좌</h4></td>
									<td colspan="2">
									<div class="input-append">
										<input type="text" class="search-input-width-first" id="depositNo" name="depositNo" class="number-input" readonly />
												<span class="add-on">
				                                    <a href="#" id="a-bankaccountinfo-dialog" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i>
				                                    </a>
				                                 </span>
									</div>
												<!-- 계좌정보 Modal pop-up : start -->
												<div id="dialog-account-message" title="계좌" hidden="hidden">
													<table id="dialog-account-message-table">
														<tr>
															<td>
															<div class="input-append">
																<label>계좌번호</label>
																<input type="text" id="input-dialog-depositNo" style="width: 100px;" />
																<a href="#" id="a-dialog-depositNo">
																<span class="btn btn-small btn-info" style="margin-bottom: 10px;">조회</span>
															</a>
															</div>
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
												<!-- 계좌정보 Modal pop-up : end -->
								
											<input type="text" class="search-input-width-second" name="depositHost" placeholder="예금주" readonly/>
									</td>
								</tr>
							</table>
						</div>

					</div>
				</div>
				<hr>
				<div class="row-fluid">
					<button  class="btn btn-primary btn-small mybtn" id="inputbtn" >입력</button>
					
					<button class="btn btn-danger btn-small mybtn" id="updatebtn">수정</button>
					<button class="btn btn-warning btn-small mybtn" onclick="deleteChecked()"  id='delete' >삭제</button>
					
					<button class="btn btn-primary btn-small mybtn" id= "search">조회</button>
				
					<button class="btn btn-pink btn-small mybtn" id="dialog-repayment-button" type="button" class="btn">상환</button>
				
					
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
					
					<!-- 차입금코드,납입원금,납입이자,납입일자,부채유형 Modal pop-up : start -->
					<div id="dialog-repayment" title="상환정보등록" hidden="hidden">
						<table id ="dialog-repayment-table" align="center">
							<tr>
								<td>
									<label>차입금코드</label>
									<input type="text" id="repaycode" readonly= "readonly" />
								</td>
							</tr>
							<tr>
								<td>
								<label>납입일자</label>
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
									<label>납입원금</label>
									<input type="text" name="payPrinc" id= "payPrinc"/>
								</td>
							</tr>
							<tr>
								<td>
									<label>이자금액</label>
									<input type="text" id= "amount" readOnly/>
								</td>
							</tr>
							<tr>
								<td>
									<label>총액</label>
									<input type="text" id= "totalAmount" readOnly/>
									
								</td>
							</tr>
							</table>
							
					</div>
					<!-- 상환 Modal pop-up : end -->
					
					<button class="btn btn-success btn-small mybtn" id="clear">초기화</button>
							
				</div>
				<hr>
			</form>					
			<!-- PAGE CONTENT ENDS -->
				
			<!-- list -->
			<p>총 ${dataResult.pagination.totalCnt }건</p>
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="checkall"/>
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">장기차입금코드</th>
							<th class="center">장기차입금명</th>
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
						</tr>
					</thead>

					<tbody id= "tbody-list">
						<c:forEach items="${dataResult.datas }" var="ltermvo">
						<tr>
							<td class="center" lterm-no ="${ltermvo.no}" ><label class="pos-rel" > <input
								type="checkbox" class="ace" lterm-no ="${ltermvo.no}" /> <span class="lbl"></span>
							</label></td>
							<td class="center">${ltermvo.code}</td>
							<td>${ltermvo.name}</td>
							
					        <c:choose>
										<c:when test="${ltermvo.majorCode eq '001'}"><td class="center">국내은행</td></c:when>
										<c:when test="${ltermvo.majorCode eq '002'}"><td class="center">저축은행</td></c:when>
										<c:when test="${ltermvo.majorCode eq '003'}"><td class="center">신용금고</td></c:when>
										<c:when test="${ltermvo.majorCode eq '004'}"><td class="center">새마을금고</td></c:when>
										<c:when test="${ltermvo.majorCode eq '005'}"><td class="center">외국계은행</td></c:when>
										<c:otherwise><td class="center">증권</td></c:otherwise>
							</c:choose>	
							<td style="text-align:right;"><fmt:formatNumber value="${ltermvo.debtAmount}" pattern="#,###" /></td>
							<td class="center"><fmt:formatNumber value="${ltermvo.repayBal}" pattern="#,###" /></td>
							<c:choose>
										<c:when test="${ltermvo.repayWay eq 'Y'}"><td class="center">연</td></c:when>
										<c:when test="${ltermvo.repayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>		
							<td class="center" debtExpDate="${ltermvo.debtExpDate}">${ltermvo.debtDate} </td>
							<td class="center" >${ltermvo.expDate}</td>
							<td class="center">${ltermvo.intRate}%</td>
							<c:choose>
										<c:when test="${ltermvo.intPayWay eq 'Y'}"><td class="center">연</td></c:when>
										<c:when test="${ltermvo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">해당없음</td></c:otherwise>
							</c:choose>	
							<td class="center">${ltermvo.mgr}</td>
							<td class="center" >${ltermvo.mgrCall}</td>
							<td class="center" bank-name="${ltermvo.bankName}">${ltermvo.bankCode}</td>
							<td class="center" deposit-host="${ltermvo.depositHost}">${ltermvo.depositNo}</td>			
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div><!-- /.page-content -->
			<div class="pagination">
				<ul>
				<c:choose>
					<c:when test="${dataResult.pagination.prev }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${dataResult.pagination.startPage - 1 }">
						<i class="icon-double-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
					<c:choose>
						<c:when test="${pg eq dataResult.pagination.page }">
						<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${pg }">${pg }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${pg}">${pg }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${dataResult.pagination.next }">
									<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?year=${year }&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
				</ul>
			</div>
			
			<!-- error Modal pop-up : start -->
			<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="margin-top: 180px;">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel"></h5>
						</div>
						<div class="modal-body" id="staticBackdropBody"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-small" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			<!-- error Modal pop-up : end -->
			
			
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>

<script>
	var ischecked = false; //중복체크 하지 않을 경우를 확인하기 위한 변수
	var validationMessage ='';
	//에러 모달 띄우기
	function openErrorModal(title, message) { //validation 체크 후 에러 메시지 모달을 띄우기 위한 함수
		$('#staticBackdropLabel').text('Error');//에러
		$('#staticBackdropBody').text(message);//에러내용
		
		
		$("#staticBackdrop").dialog('open');//모델창 띄운다
		$("#staticBackdrop").dialog({
			title: "Eroor-Message",
			title_html: true,
		   	resizable: false,
		    modal: true,
		    close: function() {
		    	$('#staticBackdropLabel').text('');//에러
				$('#staticBackdropBody').text('');//에러내용
		    },
		    buttons: {
		    "확인" : function() {
		          	$(this).dialog('close');
		          	$('#staticBackdropLabel').text('');//에러
					$('#staticBackdropBody').text('');//에러내용
		        }
		    }
		});
	}
	//insert Validation
	function insertValidation(){
		let code =$('code').val();//코드
		let name =$('name').val();//차입이유
		let debtAmount =$('debtAmount').val();//차입금
		let debtExpDate =$('id-date-range-picker-1').val();//차입일,만기일
		let intPayWay =$('input[name=intPayWay]').val();//이자지급방식
		let bankCode =$('bank_code').val();//은행코드
		let majorCode=$('form-field-select-3').val();//차입금대분류
		let repayWay=$('input[name=repayWay]').val();//상환방법
		let intRate=$('int_rate').val();//이율
		let mgr=$('mgr').val();//담당자
		let mgrCall=$('mgrCall').val();//담당자 번호
		let depositNo=$('depositNo').val();//계좌번호
		if('' === code){
			validationMessage = '장기차입금 코드는 반드시 입력하셔야 합니다(10자)';
			return false;
		}
		if('H' !== code.charAt(0)){
			validationMessage = '장기차입금 코드는 반드시 H로 시작하여야 합니다';
			return false;
		}
		if(code.length === 10){
			validationMessage = '장기차입금 코드는 10자리를 입력하셔야 합니다';
			return false;
		}
		return true;
	}
	
	function deleteChecked(){
		var sendData = [];
		var checkedList = $("#tbody-list input[type=checkbox]:checked");
		checkedList.each(function(i, e){
			sendData.push($(this).attr('lterm-no'));
		
		});
		
		$("input[name=no]").val(sendData);
		console.log(sendData);
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	$("#tbody-list tr").click(function(){ 
		var tr = $(this);
		var td = tr.children();
		
		$("input[name=code]").val(td.eq(1).text());
		$("input[name=name]").val(td.eq(2).text());
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
	
		$('#form-field-select-3').val(major).trigger('chosen:updated');  
		
	
		$("input[name=debtAmount]").val(td.eq(4).text().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("input[name=debtExpDate]").val(td.eq(7).attr('debtExpDate'));
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
		
		$('input:radio[name="repayWay"][value="'+repayWay+'"]').prop('checked', true);
		
		
		var rate = td.eq(9).text().split('%');
		
		
		$("input[name=intRate]").val(rate[0]);
	
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
		$("input[name=mgr]").val(td.eq(11).text());
		$("input[name=mgrCall]").val(td.eq(12).text());
		$("input[name=bankCode]").val(td.eq(13).text());
		$("input[name=depositNo]").val(td.eq(14).text());
		$("input[name=no]").val(td.eq(0).attr('lterm-no'));
		
		$("input[name=bankName]").val(td.eq(13).attr('bank-name'));
		$("input[name=depositHost]").val(td.eq(14).attr('deposit-host'));
		
		
	});
	$("#clear").click(function(){ 
		 $('input').val('');
		 $('#form-field-select-3').val('초기값').trigger('chosen:updated');
		 $('#btn-check-code').val('중복확인');
		 
	});
	
	$("#checkall").click(function(){
		if ($(this).hasClass('allChecked')) {
			$('input[type="checkbox"]', '#simple-table').prop('checked', false);
		} else {
			$('input[type="checkbox"]', '#simple-table').prop('checked', true);
		}
		$(this).toggleClass('allChecked');
	});
	
	
	// 은행코드 검색
	$("#a-dialog-bankcode").click(function(event){
		alert("click dialog bankcode");
		event.preventDefault();
		$("#tbody-bankList").find("tr").remove();
		
		var bankcodeVal = $("#input-dialog-bankcode").val();
		console.log(bankcodeVal);
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
				alert(response);
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
	});
	
	// 은행명 검색 : 은행목록 리스트로 가져오기
	$("#a-dialog-bankname").click(function(event){
		alert("click dialog bankname");
		event.preventDefault();
		$("#tbody-bankList").find("tr").remove();
		
		var banknameVal = $("#input-dialog-bankname").val();
		console.log(banknameVal);
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
				alert(response.data);
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
	
	});
	$(document.body).delegate('#tbody-bankList tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		$("input[name=bankCode]").val(td.eq(0).text());
		$("input[name=bankName]").val(td.eq(1).text());
		$("#dialog-message").dialog('close');
	});
	$("#a-bankinfo-dialog").click(function() {
		$("#dialog-message").dialog('open');
		$("#dialog-message").dialog({
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
	});
	$("#dialog-repayment-button").click(function() {
		$("#repaycode").val($("#code").val());
	
    	$("#tbody-list tr").each(function(i){
			var td = $(this).children();
			var n = td.eq(0).attr('lterm-no');
			if(n == $("#no").val()){
				
				var k = parseInt(td.eq(5).text().replace(/,/g, ''));
				
				var intPayWay = td.eq(10).text();
				console.log("이자지급방식"+intPayWay);
				if(intPayWay === "월"){
					var intAmount= parseInt(
							(
									(k*
									parseFloat(td.eq(9).text().replace('%', ''))
									)
									/12
							)
							/100
							);
				}else if(intPayWay === "연"){
					var intAmount= parseInt(
							(		k*
									parseFloat(td.eq(9).text().replace('%', '')))
									/100
							);
				}else{
					intAmount=0;
				}
				$("#amount").val(intAmount);
				$("#totalAmount").val(intAmount);
				
			}
		});
    	$("#payPrinc").on("change",function(){
    		var intAmount=$("#amount").val();
    		var totalAmount = parseInt($("#payPrinc").val())+parseInt(intAmount);
    		$("#totalAmount").val(totalAmount);
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
		    	$('#payPrinc').val('');
		    	$('input[name=payDate]').val('');
		    	
		    },
		    buttons: {
		    	//상환버튼 클릭시
		    "상환": function(){
		    	event.preventDefault();
		    	var k;
		    	$("#tbody-list tr").each(function(i){
					var td = $(this).children();
					var n = td.eq(0).attr('lterm-no');
					if(n == $("#no").val()){
						k = parseInt(td.eq(5).text().replace(/,/g, ''));//상환잔액
						
					}
				});
		    	
		    	var vo = {
						"debtNo":$("#no").val(),//테이블 번호
						"payPrinc":$("#payPrinc").val(),//낼돈 - 이자금
						"payDate":$('input[name=payDate]').val(),//상환일
						"intAmount": $("#amount").val(),
						"code":$('#repaycode').val()
				}
				
				if( k < vo.payPrinc){
					alert("납입원금이 상환 잔액보다 큽니다. 상환잔액("+k+")보다 작게 입력해주세요");
					return;
				}
				// ajax 통신
				$.ajax({
					url: "${pageContext.request.contextPath }/11/48/repay",
					contentType : "application/json; charset=utf-8",
					type: "post",
					dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
					data:JSON.stringify(vo),
					success: function(response){
						console.log(response);
						if(response.result =="fail"){
							console.error(response.message);
							return;
						}
						if(response.data==null){
							alert("마감일이 지났습니다.");
							return;
						}
						$("#tbody-list tr").each(function(i){
							var td = $(this).children();
							var n = td.eq(0).attr('lterm-no');
							if(n == response.data.no){
								var m = response.data.repayBal
								td.eq(5).html(m.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							}
						});
						
					},
					error: function(xhr, error){
						console.error("error : " + error);
					}
				});
				$(this).dialog('close');
				//상환내역 반영
				
				
		    },
		    "닫기" : function() {
		          	$(this).dialog('close');
		        }
		    }
		});
	});
	
	
	$("#code").change(function(){//코드 중복체크 표시
		$("#btn-check-code").show();
		$("#img-checkcode").hide();
	});	
	
	$("#btn-check-code").click(function(){//코드 중복체크 ajax
		
		var code = $("#code").val();
		if(code == ""){
			return;
		}
	
	// ajax 통신
	$.ajax({
		url: "${pageContext.servletContext.contextPath }/11/48/checkcode?code=" + code,
		contentType : "application/json; charset=utf-8",
		type: "get",
		dataType: "json",
		data: "",
		success: function(response){
			console.log(response);
			if(response.result == "fail"){
				console.error(response.message);
				return;
			}
			
			if(response.data == null){
				ischecked=true;
				$("#btn-check-code").hide();
				$("#img-checkcode").show();
				return;
			}else if(response.data.deleteFlag == "Y"){
				alert("삭제된 코드입니다.");
			
				$("#code").val("");
				//$("#inputbtn").hide();
				$("#code").focus();
			}else{
				alert("이미 존재하는 코드입니다.");

				$("#code").val("");
				//$("#inputbtn").hide();
				$("#code").focus();
			}
			
			},
			error:function(xhr,error) {
				console.err("error" + error);
			}
		});
	});
	//계좌 은행으로 검색
	$("#a-bankaccountinfo-dialog").click(function() {
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
    });
	//
	$('#dialog-account-message-table').on('click', '#a-dialog-depositNo', function(event) {
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
     });
	//은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 form에 추가
	$(document.body).delegate('#tbody-bankaccountList tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		$("input[name=depositNo]").val(td.eq(0).text());
		$("input[name=depositHost]").val(td.eq(1).text());
		$("#dialog-account-message").dialog('close');
	});
	$("#a-bankinfo-dialog").click(function() {
		$("#dialog-message").dialog('open');
		$("#dialog-message").dialog({
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
	});
	//상환내역이 있을경우 수정 안되게 하는 코드
	 $("#updatebtn").click(function(){
		 var no = $('#no').val();
		 $.ajax({
				url: "${pageContext.servletContext.contextPath }/11/48/checkrepay?no=" + no,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json",
				data: "",
				success: function(response){
					console.log(response);
					
					
					if(response.result == "fail"){
						console.error(response.message);
						return;
					}
					
					if(response.data.length === 0){
						$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update');

						$('#myform').attr('method', 'POST');
						$('#myform').submit();
						
						return;
					}else{
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
					error:function(xhr,error) {
						console.err("error" + error);
					}
				});
	
	});
	 jQuery(function(){
			
		    // 숫자 제외하고 모든 문자 삭제.
		    $.fn.removeText = function(_v){
		        //console.log("removeText: 숫자 제거 합니다.");
		        if (typeof(_v)==="undefined")
		        {
		            $(this).each(function(){
		                this.value = this.value.replace(/[^0-9]/g,'');
		            });
		        }
		        else
		        {
		            return _v.replace(/[^0-9]/g,'');
		        }
		    };
		    // php의 number_format과 같은 효과.
		    $.fn.numberFormat = function(_v){
		        this.proc = function(_v){
		            var tmp = '',
		                number = '',
		                cutlen = 3,
		                comma = ','
		                i = 0,
		                len = _v.length,
		                mod = (len % cutlen),
		                k = cutlen - mod;    
		            for (i; i < len; i++)
		            {
		                number = number + _v.charAt(i);

		                if (i < len - 1)
		                {
		                    k++;
		                    if ((k % cutlen) == 0)
		                    {
		                        number = number + comma;
		                        k = 0;
		                    }
		                }
		            }
		            return number;
		        };
		         
		        var proc = this.proc;
		        if (typeof(_v)==="undefined")
		        {
		            $(this).each(function(){
		                this.value = proc($(this).removeText(this.value));
		            });
		        }
		        else
		        {
		            return proc(_v);
		        }
		    };
		    $.fn.onlyNumber = function (p) {
		        $(this).each(function(i) {
		            $(this).attr({'style':'text-align:right'});
		            this.value = $(this).removeText(this.value);
		            this.value = $(this).numberFormat(this.value);             
		            $(this).bind('keypress keyup',function(e){
		                this.value = $(this).removeText(this.value);
		                this.value = $(this).numberFormat(this.value);
		            });
		        });
		    };
		    $('.numberformat').onlyNumber();
		});
		$("form").on("submit", function() {
			$('.numberformat').removeText(); 
		 });
		 
		 $("#search").click(function(){
			 $('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode}');
			 $('#myform').attr('method', 'POST');
			 $("input").attr('disabled',true);
			 console.log($("input[name=code]").val());
			 $("input[name=code]").attr('disabled',false);
			 $("input[name=financialYear]").attr('disabled',false);
			 $('#myform').submit();
			 
			 
		 });
		 $("#delete").click(function(){
			
			 $("input").attr('disabled',true);
			 $("input[name=no]").attr('disabled',false);
			 var no = $('#no').val();
			 
			 $.ajax({
					url: "${pageContext.servletContext.contextPath }/11/48/checkrepaylist?no=" + no,
					contentType : "application/json; charset=utf-8",
					type: "get",
					dataType: "json",
					data: "",
					success: function(response){
						console.log(response);
						
						
						if(response.result == "fail"){
							console.error(response.message);
							return;
						}
						
						if(response.data.length === 0){
							$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete');
							$('#myform').attr('method', 'POST');
							$('#myform').submit();
							
							return;
						}else{
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
				         	  				
				         	  				
				         	  				"<tbody>"+
				         	  			   "<tr>" +
				                           "<td class='center'>" + repayList[a].payPrinc + "</td>" +
				                           "<td class='center'>" + repayList[a].intAmount + "</td>" +
				                           "<td class='center'>" + repayList[a].payDate + "</td>" +
				                           "</tr>" +
				                           "</tbody>"+
				                          "</table>");
				         	  		
				         	  		code=repayList[a].code;
			         	  		}else{
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
			         	  	}
			         	  	
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
						error:function(xhr,error) {
							console.err("error" + error);
						}
					});
			 
			 
		 });
	 $("#inputbtn").click(function(){
			$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add');
			$('#myform').attr('method', 'POST');
			if(ischecked == false){
				alert("중복체크 하고오세요~~");
				return;
			}
			else{
				
				console.log("1111");
				//validation
				if(!insertValidation()){
					console.log("111");
					openModal('Error',validationMessage);
					return;
				}
				console.log("11111");
				
				$('#myform').submit();
			}
		 });	 
	
	$(function(){
		$('button').on('click', function(e) {
			e.preventDefault();
		})
		$('#id-date-range-picker-1').daterangepicker({
		    format: 'YYYY-MM-DD',
		    separator: '~'
		  }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$('.date-picker').datepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(".chosen-select").chosen();
		//은행 다이얼 로그 
		$("#dialog-message").dialog({
			autoOpen : false
		});
		//상환 다이얼 로그
		$("#dialog-repayment").dialog({
			autoOpen : false
		});
		//계좌목록
		$("#dialog-account-message").dialog({
		       autoOpen : false
	    });
		$("#dialog-repayment-ischeck").dialog({
	       autoOpen : false
	    });
		$("#dialog-message").dialog({
			autoOpen : false
		});
		 $("#dialog-repayment-ischeck").dialog({
	       autoOpen : false
	    });
		 $("#dialog-repayment-delete").dialog({
		       autoOpen : false
		  });
		 $("#staticBackdrop").dialog({
		       autoOpen : false
		  });
	});
 
 
 

 
 
</script>

</body>
</html>