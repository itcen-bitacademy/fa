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
.p-debt-code-input {
	width: 270px;
}

.p-debt-name-input {
	width: 420px;
}

tr td:first-child {
	padding-right: 10px;
}

.radio {
	float: left;
	width: 17%;
}

.search-input-width-first {
	width: 130px;
}

.search-input-width-second {
	width: 225px;
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
	width: 140px;
	display: inline;
}

/* button 정렬 */
.mybtn {
	float: right;
	margin-right: 20px;
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
					<h1 class="pull-left">사채관리</h1>
				</div>

				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" method="post" action="" id="input-form">
					<div class="container-fluid">
						<!-- Example row of columns -->
						<div class="row">
							<div class="span8">
								<table>
									<tr>
										<td><h4>사채코드</h4></td>
										<td colspan="2">
										<input type="text" class="p-debt-code-input" name="code" placeholder="ex) P191128001 (P+년+월+일+번호)" />
										<button type="button" class="btn btn-info btn-small" id="selectone">조회</button>
										</td>
									</tr>
									<tr>
										<td><h4>사채명</h4></td>
										<td colspan="2"><input type="text" class="p-debt-name-input" name="name" placeholder="육하원칙으로 입력해주세요." /></td>
									</tr>
									<tr>
										<td><h4>차입금액</h4></td>
										<td><input type="text" name="debtAmount" /></td>
									</tr>
									<tr>
										<td><h4>차입일자 ~ 만기일자</h4></td>
										<td colspan="2">
											<div class="row-fluid input-prepend">
												<input type="text" name="debtExpDate"
													name="date-range-picker" id="id-date-range-picker-1" /> <span
													class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<td><h4>이자지급방식</h4></td>
										<td colspan="2">
											<div class="radio">
												<label> <input name="intPayWay" type="radio"
													class="ace" value="Y" /> <span class="lbl">년</span>
												</label>
											</div>
											<div class="radio">
												<label> <input name="intPayWay" type="radio"
													class="ace" value="M" /> <span class="lbl">월</span>
												</label>
											</div>
											<div class="radio">
												<label> <input name="intPayWay" type="radio"
													class="ace" value="E" /> <span class="lbl">해당없음</span>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<td><h4>은행코드</h4></td>
										<td colspan="2">
											<input type="text" class="search-input-width-first" name="bankCode" />
												<a href="#" id="id-btn-dialog1">
													<span class="btn btn-small btn-info">
														<i class="icon-search nav-search-icon"></i>
													</span>
												</a>
												
												
												
												
												
												<div id="dialog-message" title="은행코드" hidden="hidden">
														<div class="row">
															<table id ="dialog-message-table">
																<tr>
																	<td><label>은행코드</label><input type="text"  id="input-dialog-bankcode"/></td>
																	<td>
																		<a href="#" id="btn-dialog-bankcode">
																			<span class="btn btn-small btn-info">
																				<i class="icon-search nav-search-icon"></i>
																			</span>
																		</a>
																	</td>
																	<td><label>은행명</label><input type="text"  id="input-dialog-bankname"/></td>
																	<td>
																		<a href="#" id="btn-dialog-bankname">
																			<span class="btn btn-small btn-info">
																				<i class="icon-search nav-search-icon"></i>
																			</span>
																		</a>
																	</td>
																</tr>
															</table>
															<!-- <div class="span6">
																<div class="span2">
																	<input type="text"  />
																	<a href="#" id="id-btn-dialog1">
																		<span class="btn btn-small btn-info">
																			<i class="icon-search nav-search-icon"></i>
																		</span>
																	</a>					
																</div>
																<div class="span2">
																	<input type="text"  />
																	<a href="#" id="id-btn-dialog1">
																		<span class="btn btn-small btn-info">
																			<i class="icon-search nav-search-icon"></i>
																		</span>
																	</a>	
																</div>
															</div> -->
														</div>
														<table id="bank-table" class="table  table-bordered table-hover">
															<thead>
																<tr>
																	<th class="center">은행코드</th>
																	<th class="center">은행명</th>
																	<th class="center">지점명</th>
																</tr>
															</thead>
																<tbody id="tbody-list">
																<c:forEach items="${bankList}" var="bank" varStatus="status">
																	<tr>
																		<td class="center">${bank.code}</td>
																		<td class="center">${bank.name}</td>
																		<td class="center">${bank.store}</td>
																	</tr>
																</c:forEach>
																</tbody>
														</table>
												</div>
												
												
												
												
												
											<input type="text" class="search-input-width-second" name="bankName" />
										</td>
									</tr>
									<tr>
										<td><h4>위험등급</h4></td>
										<td colspan="2">
										<select class="chosen-select form-control" name="dangerCode" id="dangercode-field-select" >
												<option value="초기값">선택해주세요.</option>
												<option value="RED1-초고위험">초고위험</option>
												<option value="ORANGE2-고위험">고위험</option>
												<option value="YELLOW3-중위험">중위험</option>
												<option value="GREEN4-저위험">저위험</option>
												<option value="BLUE5-초저위험">초저위험</option>
										</select></td>
									</tr>
								</table>
							</div>
							<div class="span8">
								<table>
									<tr>
										<td><h4>회계연도</h4></td>
										<td><input type="number" min="1900" max="2099" step="1" value="2019" id="p-debt-financialyear-input" name="financialYear" placeholder="회계연도" /></td>
									</tr>
									<tr>
										<td><h4>차입금대분류</h4></td>
										<td colspan="2">
										<select class="chosen-select form-control" name="majorCode" id="majorcode-field-select">
												<option value="초기값">선택해주세요.</option>
												<option value="008001">국내은행</option>
												<option value="008002">저축은행</option>
												<option value="008003">신용금고</option>
												<option value="008004">새마을금고</option>
												<option value="008005">외국계은행</option>
												<option value="008006">증권</option>
										</select></td>
									</tr>
									<tr>
										<td><h4>상환방법</h4></td>
										<td colspan="2">
											<div class="radio">
												<label> <input name="repayWay" type="radio"
													class="ace" value="Y" /> <span class="lbl">년</span>
												</label>
											</div>
											<div class="radio">
												<label> <input name="repayWay" type="radio"
													class="ace" value="M" /> <span class="lbl">월</span>
												</label>
											</div>
											<div class="radio">
												<label> <input name="repayWay" type="radio"
													class="ace" value="E" /> <span class="lbl">만기</span>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<td><h4>이율</h4></td>
										<td colspan="2">
											<input type="text" name="intRate" placeholder="(%) 정수로 입력하세요." />
										</td>
									</tr>
									<tr>
										<td><h4>담당자</h4></td>
										<td><input type="text" class="mgr-input" name="mgr" />
											<h4 class="mgr-number-input-h4">담당자전화번호</h4>
											<input type="text" class="mgr-call-input" name="mgrCall" /></td>
									</tr>
									<tr>
										<td><h4>계좌</h4></td>
										<td colspan="2">
											<input type="text" class="search-input-width-first" name="depositNo" />
											<span class="btn btn-small btn-info">
											<i class="icon-search nav-search-icon"></i>
											</span>
											<input type="text" class="search-input-width-second" name="bankName" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<hr>
					<div class="row-fluid">
						<button type="button" class="btn btn-success btn-small mybtn" id="formReset">초기화</button>
						&nbsp;
						<button type="submit" class="btn btn-pink btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/repayInsert">상환</button>
						&nbsp;
						<button type="button" class="btn btn-info btn-small mybtn" id="selectFinancialYearList">조회</button>
						&nbsp;
						<button type="button" class="btn btn-danger btn-small mybtn" onclick="deleteChecked()">삭제</button>
						&nbsp;
						<button type="submit" class="btn btn-warning btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
						&nbsp;
						<button type="submit" class="btn btn-primary btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">입력</button>
					</div>
					<hr>
				</form>
				<!-- PAGE CONTENT ENDS -->

				<!-- list -->
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" ><label class="pos-rel">
							<input type="checkbox" class="ace" id="selectAll" /> <span class="lbl"></span>
							</label></th>
							<th class="center">사채코드</th>
							<th class="center">사채명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
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
						</tr>
					</thead>
						<tbody id="tbody-list">
						<c:forEach items="${list}" var="vo" varStatus="status">
							<tr id="${vo.no }">
								<td id="select-checkbox" class="center">
									<label class="pos-rel"></label>
									<input type="checkbox" class="ace" name="no"  value="${vo.no }"/><span class="lbl"></span>
									
								</td>
								<td class="center">${vo.code}</td>
								<td>${vo.name}</td>
						        <c:choose>
											<c:when test="${vo.majorCode eq '008001'}"><td class="center">국내은행</td></c:when>
											<c:when test="${vo.majorCode eq '008002'}"><td class="center">저축은행</td></c:when>
											<c:when test="${vo.majorCode eq '008003'}"><td class="center">신용금고</td></c:when>
											<c:when test="${vo.majorCode eq '008004'}"><td class="center">새마을금고</td></c:when>
											<c:when test="${vo.majorCode eq '008005'}"><td class="center">외국계은행</td></c:when>
											<c:otherwise><td class="center">증권</td></c:otherwise>
								</c:choose>	
								<td class="center">${vo.debtAmount}</td>
								<td class="center">${vo.repayBal}</td>
								<c:choose>
											<c:when test="${vo.repayWay eq 'Y'}"><td class="center">년</td></c:when>
											<c:when test="${vo.repayWay eq 'M'}"><td class="center">월</td></c:when>
											<c:otherwise><td class="center">만기</td></c:otherwise>
								</c:choose>		
								<td class="center">${vo.debtExpDate}</td>
								<td class="center">${vo.intRate}</td>
								<c:choose>
											<c:when test="${vo.intPayWay eq 'Y'}"><td class="center">년</td></c:when>
											<c:when test="${vo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
											<c:otherwise><td class="center">만기</td></c:otherwise>
								</c:choose>	
								<td class="center">${vo.mgr}</td>
								<td class="center">${vo.mgrCall}</td>
								<td class="center">${vo.bankCode}</td>
								<td class="center">${vo.depositNo}</td>
								<td class="center">${vo.dangerName}</td>
							</tr>
							</c:forEach>
						</tbody>
				</table>

				<div class="pagination">
					<%--Page 이전 페이지 구현 --%>
					<ul>
						<c:choose>
							<%-- all data list pagination --%>
							<c:when test="${pageInfo.totalRows != 0}">
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq 1}">
										<li class="disabled"><a><i class="icon-double-angle-left"></i></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock}"><i
												class="icon-double-angle-left"></i></a></li>
									</c:otherwise>
								</c:choose>
								<%--Page  페이지 구현 --%>
								<c:choose>
									<%-- 첫 페이지 출력 ex) 1 2 3 4 5
									currentBlock : 현재 전체 블럭 --%>
									<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
										<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
											varStatus="num">
											<c:choose>
												<c:when test="${num.count == pageInfo.currentPage}">
													<li class="active"><a
														href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count}">${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count}</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count}">${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<%-- 첫 페이지 이후의 모든 페이지 출력 ex) 6 7 8 9 10 
																									  11 12 13 14 15 
																									  16 17 18 19 20  totalBlocks : 모두 출력되어야 하는 블럭의 수 --%>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num" var="i">
											<c:choose>
												<c:when test="${i == pageInfo.currentPage}">
													<li class="active"><a
														href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count}">${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count}</a></li>
												</c:when>
												<c:otherwise>
													<li><a
														href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count}">${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<%--Page 다음 페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
										<li class="disabled"><a><i class="icon-double-angle-right"></i></a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }"><i
												class="icon-double-angle-right"></i></a></li>
									</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
					</ul>
				</div>


			</div>
			<!-- /.page-content -->
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
	<script>
	$(function() {
		$(document).ready(function(){
            $(".chosen-select").chosen()
        });
		//$(".chosen-select").chosen();

		$('#id-date-range-picker-1').daterangepicker({
			format : 'YYYY-MM-DD'
		}).next().on(ace.click_event, function() {
			$(this).next().focus();
		});
		
		// 리스트에서 row를 선택하면 row의 해당 데이터 form에 추가
		$("#simple-table tr").click(function(){ 
		
			var tr = $(this);
			var td = tr.children();
			
// 			$("input[name=no]").val(td.eq(0).attr('data-no'));
			$("input[name=code]").val(td.eq(1).text());
			$("input[name=name]").val(td.eq(2).text());
			var major='';
			switch (td.eq(3).text()){
		    case '국내은행' :
		    	major='008001';
		        break;
		    case '저축은행' :
		    	major='008002';
			    break;
		    case '신용금고' :
		    	major='008003';
		        break;
		    case '새마을금고' :
		    	major='008004';
		        break;
		    case '외국계은행' :
		    	major='008005';
		    	break;
		    case '증권' :
		    	major='008006';
		    	break;
			}
	
			$('#majorcode-field-select').val(major).trigger('chosen:updated');  
			
			// 차입금액
			$("input[name=debtAmount]").val(td.eq(4).text());
			
			// 상환방법
			var repayWay='';
			switch (td.eq(6).text()){
		    case '년' :
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
			
			// 차입일자 - 만기일자
			$("input[name=debtExpDate]").val(td.eq(7).text());
			
			// 이율
			var rate = td.eq(8).text().split('%');
			$("input[name=intRate]").val(rate[0]);
			
			// 이자지급방식
			var intPayWay='';
			switch (td.eq(9).text()){
		    case '년' :
		    	intPayWay='Y';
		        break;
		    case '월' :
		    	intPayWay='M';
			    break;
		    case '만기' :
		    	intPayWay='E';
		        break;
			}
			$('input:radio[name="intPayWay"][value="'+intPayWay+'"]').prop('checked', true);
			
			// 담당자, 담당자전화번호, 은행코드, 계좌번호
			$("input[name=mgr]").val(td.eq(10).text());
			$("input[name=mgrCall]").val(td.eq(11).text());
			$("input[name=bankCode]").val(td.eq(12).text());
			$("input[name=depositNo]").val(td.eq(13).text());
			
			// 위험등급 분류
			var dangerCode='';
			switch (td.eq(14).text()){
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
			
		});
		
		
		
		// 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 form에 추가
		$("#bank-table tr").click(function(){ 
			var tr = $(this);
			var td = tr.children();
			$("input[name=bankCode]").val(td.eq(0).text());
			$("input[name=bankName]").val(td.eq(1).text());
		});
		
		
		
		// Button으로 사채코드를 받아서 해당 사채 데이터 조회하기
		$("#selectone").click(function(){
			var debtcodeVal = $(".p-debt-code-input").val();
			console.log(debtcodeVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/selectone/getpdebtInfo?debtcodeVal=" + debtcodeVal,
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
					// 부채코드
					$("input[name=code]").val(response.code);
					
					// 차입금명
					$("input[name=name]").val(response.name);
					
					// 차입금액
					$("input[name=debtAmount]").val(response.debtAmount);
					
					// 차입일자 - 만기일자
					$("input[name=debtExpDate]").val(response.debtExpDate);
					
					// 이자지급방식
					var intPayWay='';
					switch (response.intPayWay){
				    case 'Y' :
				    	intPayWay='Y';
				        break;
				    case 'M' :
				    	intPayWay='M';
					    break;
				    case 'E' :
				    	intPayWay='E';
				        break;
					}
					$('input:radio[name="intPayWay"][value="'+intPayWay+'"]').prop('checked', true);
					
					// 은행코드
					$("input[name=bankCode]").val(response.bankCode);
					
					// 위험등급 분류
					var dangerName='';
					switch (response.dangerName){
				    case '초고위험' :
				    	dangerName='RED1-초고위험';
				        break;
				    case '고위험' :
				    	dangerName='ORANGE2-고위험';
					    break;
				    case '중위험' :
				    	dangerName='YELLOW3-중위험';
				        break;
				    case '저위험' :
				    	dangerName='GREEN4-저위험';
				        break;
				    case '초저위험' :
				    	dangerName='BLUE5-초저위험';
				        break;
					}
					$('#dangercode-field-select').val(dangerName).trigger('chosen:updated');
					
					// 회계연도
					$("input[name=financialYear]").val(response.financialYear);
					
					// 차입금대분류
					var major='';
					switch (response.majorCode){
				    case '008001' :
				    	major='008001';
				        break;
				    case '008002' :
				    	major='008002';
					    break;
				    case '008003' :
				    	major='008003';
				        break;
				    case '008004' :
				    	major='008004';
				        break;
				    case '008005' :
				    	major='008005';
				    	break;
				    case '008006' :
				    	major='008006';
				    	break;
					}
					$('#majorcode-field-select').val(major).trigger('chosen:updated'); 
					
					// 상환방법
					var repayWay='';
					switch (response.repayWay){
				    case 'Y' :
				    	repayWay='Y';
				        break;
				    case 'M' :
				    	repayWay='M';
					    break;
				    case 'E' :
				    	repayWay='E';
				        break;
					}
					$('input:radio[name="repayWay"][value="'+repayWay+'"]').prop('checked', true);
					
					// 이율
					$("input[name=intRate]").val(response.intRate);
					
					// 담당자
					$("input[name=mgr]").val(response.mgr);
					// 담당자전화번호
					$("input[name=mgrCall]").val(response.mgrCall);
					// 계좌번호
					$("input[name=depositNo]").val(response.depositNo);
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		
		// Button으로 사채코드를 받아서 해당 사채 데이터 조회하기
		$("#selectFinancialYearList").click(function(){
			var debtcodeVal = $(".p-debt-code-input").val();
			console.log(debtcodeVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/selectone/getpdebtInfo?debtcodeVal=" + debtcodeVal,
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
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		// form에 입력한 모든 데이터 초기화
		// 출처 : https://stackoverflow.com/questions/11365212/how-do-i-reset-a-jquery-chosen-select-option-with-jquery
		$("#formReset").bind("click", function () {
			// form의 모든 데이터 초기화
			$('#input-form')[0].reset();
			
			// value 값으로 선택
			$('#majorcode-field-select').val('초기값').trigger('chosen:updated');
			$('#dangercode-field-select').val('초기값').trigger('chosen:updated');
        });
		
		// 은행코드 및 은행명 검색
		$("#btn-dialog-bankcode").click(function(){
			var bankcodeVal = $("#input-dialog-bankcode").val();
			console.log(bankcodeVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/selectone/getbankcode?bankcodeVal=" + bankcodeVal,
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
					console.log(response.code);
					console.log(response.name);
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		$("#btn-dialog-bankname").click(function(){
			var banknameVal = $("#input-dialog-bankname").val();
			console.log(banknameVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/selectone/getbankname?banknameVal=" + banknameVal,
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
					console.log(response.code);
					console.log(response.name);
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		
		
		
		
		
	});

	$(function(){
		// checkbox로 데이터 모든 데이터 선택하거나 낱개로 선택
		$(document).ready(function() {
			$('body').on('click', '#selectAll', function() {
				if ($(this).hasClass('allChecked')) {
					$('input[type="checkbox"]', '#simple-table').prop('checked', false);
				} else {
					$('input[type="checkbox"]', '#simple-table').prop('checked', true);
				}
				$(this).toggleClass('allChecked');
			})
		});
	});

	// 데이터 삭제
	function deleteChecked(){
		var sendData = [];
		var checkedList = $("#tbody-list input[type=checkbox]:checked");
		checkedList.each(function(i, e){
			sendData.push($(this).val())
		});
		console.log(sendData);
		$.ajax({
			url : "${pageContext.request.contextPath }/api/selectone/deleteChecked",
			type : "POST",
			dataType : "json",
			data : {"sendData" : sendData},
			success: function(response){
				console.log("success");
				checkedList.each(function(i, e){
					console.log($("#" + $(this).val()));
					$("#" + $(this).val()).remove();
				})
			},
			error : function(xhr, error){
				console.error("error : " + error);
			}
		})
	}
</script>
<script>
	$(function() {
		$("#dialog-message").dialog({
			autoOpen : false
		});

		$("#id-btn-dialog1").click(function() {
			$("#dialog-message").dialog('open');
			$("#dialog-message").dialog({
			      resizable: false,
			      height: 400,
			      width: 400,
			      modal: true,
			      buttons: {
			        "Delete all items": function() {
			          $( this ).dialog( "close" );
			        },
			        Cancel: function() {
			          $( this ).dialog( "close" );
			        }
			      }
			    });
		});

	});
</script>
</body>
</html>