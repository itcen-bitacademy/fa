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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>

<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.p-debt-code-input {
	width: 270px;
}

.p-debt-name-input {
	width: 420px;
}

/* 테이블의 첫 row 모두 padding right */
.first-span-first-padding-right {
	padding-right: 20px;
}

.second-span-first-padding-right {
	padding-left: 20px;
	padding-right: 20px;
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
				<form class="form-horizontal" method="post" action="" id="input-form" name="p-dept-input-form" >
					<div class="container-fluid">
						<!-- Example row of columns -->
						<div class="row">
							<div class="span8">
								<table>
									<tr>
										<td class="first-span-first-padding-right"><h4>사채코드</h4></td>
										<td colspan="2">
										<input type="hidden" name="no" />
										<input type="text" id="engAndNumber" class="p-debt-code-input" name="code" placeholder="ex) P191128001 (P+년+월+일+번호)"  />
										<input class="btn btn-primary btn-small" id="btn-check-code" type="button" value="중복확인">
										<img id="img-checkcode" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>사채명</h4></td>
										<td colspan="2">
										<input type="text" id="onlyHangulAndNumber" class="p-debt-name-input" name="name" placeholder="육하원칙으로 입력해주세요."  />
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>차입금액</h4></td>
										<td>
											<input type="text" id="inputPrice" name="text-debtAmount" value="" />
											<input type="text" id="hidden-dept-amount" name="debtAmount" />
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>차입일자 ~ 만기일자</h4></td>
										<td colspan="2">
											<div class="row-fluid input-prepend">
												<input type="text" name="debtExpDate" name="date-range-picker" id="id-date-range-picker-1" /> <span class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>이자지급방식</h4></td>
										<td colspan="2">
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="Y"/>
												<span class="lbl">년</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="M"/>
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="E"/>
												<span class="lbl">해당없음</span>
											</label>
										</div>
									</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>은행코드</h4></td>
										<td colspan="2">
											<input type="text" class="search-input-width-first" name="bankCode" placeholder="은행코드"/>
											<input type="text" class="search-input-width-second" name="bankName" placeholder="은행명"/>
												<a href="#" id="a-bankinfo-dialog">
													<span class="btn btn-small btn-info">
														<i class="icon-search nav-search-icon"></i>
													</span>
												</a>
												
												<!-- 은행코드, 은행명, 지점명 Modal pop-up : start -->
												<div id="dialog-message" title="은행코드" hidden="hidden">
															<table id ="dialog-message-table" align="center">
																<tr>
																	<td>
																	<label>은행코드</label>
																	<input type="text"  id="input-dialog-bankcode" style="width:100px;"/>
																		<a href="#" id="a-dialog-bankcode">
																			<span class="btn btn-small btn-info" style="margin-bottom: 10px;">조회</span>
																		</a>
																	</td>
																	<td>
																	<label>은행명</label>
																	<input type="text"  id="input-dialog-bankname" style="width:100px;"/>
																		<a href="#" id="a-dialog-bankname">
																			<span class="btn btn-small btn-info" style="margin-bottom: 10px;">조회</span>
																		</a>
																	</td>
																</tr>
															</table>
														<!-- 은행코드 및 은행명 데이터 리스트 -->
														<table id="modal-bank-table" class="table  table-bordered table-hover">
															<thead>
																<tr>
																	<th class="center">은행코드</th>
																	<th class="center">은행명</th>
																	<th class="center">지점명</th>
																</tr>
															</thead>
															<tbody id="tbody-bankList">
															</tbody>
														</table>
												</div>
												<!-- 은행코드, 은행명, 지점명 Modal pop-up : end -->
											
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>위험등급</h4></td>
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
										<td class="second-span-first-padding-right"><h4>회계연도</h4></td>
										<td><input type="number" min="1900" max="2099" step="1" value="2019" id="p-debt-financialyear-input" name="financialYear" placeholder="회계연도" /></td>
									</tr>
									<tr>
										<td class="second-span-first-padding-right"><h4>차입금대분류</h4></td>
										<td colspan="2">
										<select class="chosen-select form-control" name="majorCode" id="majorcode-field-select">
												<option value="초기값">선택해주세요.</option>
												<option value="008001">국내은행</option>
												<option value="008002">저축은행</option>
												<option value="008003">신용금고</option>
												<option value="008004">새마을금고</option>
												<option value="008005">외국계은행</option>
												<option value="008006">증권</option>
										</select>
										</td>
									</tr>
									<tr>
										<td class="second-span-first-padding-right"><h4>상환방법</h4></td>
										<td colspan="2">
												<div class="radio">
													<label>
														<input name="repayWay" type="radio" class="ace" value="Y"/>
														<span class="lbl">년</span>
													</label>
												</div>
												<div class="radio">
													<label>
														<input name="repayWay" type="radio" class="ace"  value="M"/>
														<span class="lbl">월</span>
													</label>
												</div>
												<div class="radio">
													<label>
														<input name="repayWay" type="radio" class="ace"  value="E"/>
														<span class="lbl">만기</span>
													</label>
												</div>
										</td>
									</tr>
									<tr>
										<td class="second-span-first-padding-right"><h4>이율</h4></td>
										<td colspan="2">
											<input type="text" name="intRate" placeholder="(%) 정수로 입력하세요." />
										</td>
									</tr>
									<tr>
										<td class="second-span-first-padding-right"><h4>담당자</h4></td>
										<td><input type="text" class="mgr-input" name="mgr" />
											<h4 class="mgr-number-input-h4">담당자전화번호</h4>
											<input type="text" class="mgr-call-input" name="mgrCall" /></td>
									</tr>
									<tr>
										<td class="second-span-first-padding-right"><h4>계좌</h4></td>
										<td colspan="2">
											<input type="text" class="search-input-width-first" id="depositNo" name="depositNo" placeholder="계좌번호"/>
											<input type="text" class="search-input-width-second" name="depositHost" placeholder="예금주"/>
												<a href="#" id="a-bankaccountinfo-dialog">
													<span class="btn btn-small btn-info">
														<i class="icon-search nav-search-icon"></i>
													</span>
												</a>
												
												<!-- 계좌정보 Modal pop-up : start -->
												<div id="dialog-account-message" title="계좌" hidden="hidden">
													<table id="dialog-account-message-table">
														<tr>
															<td>
																<label>계좌번호</label>
																<input type="text" id="input-dialog-depositNo" style="width: 100px;" />
																<a href="#" id="a-dialog-depositNo">
																<span class="btn btn-small btn-info" style="margin-bottom: 10px;">조회</span>
															</a>
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
								
										</td>
									</tr>
								</table>
								<!-- 차입금코드,납입원금,납입이자,납입일자,부채유형 Modal pop-up : start -->
								<div id="dialog-repayment" title="상환정보등록" hidden="hidden">
									<table id ="dialog-repayment-table" align="center">
										<tr>
											<td>
												<label>차입금코드</label>
												<input type="text" id="code" readonly= "readonly"/>
											</td>
										</tr>
										<tr>
											<td>
												<label>납입금</label>
												<input type="text" name="repay_bal" id= "repay_bal"/>
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
										</table>
								</div>
								<!-- 차입금코드,납입원금,납입이자,납입일자,부채유형 Modal pop-up : end -->
							</div>
						</div>
					</div>
					<hr>
					<div class="row-fluid">
						<button type="button" class="btn btn-success btn-small mybtn" id="formReset">초기화</button>
						&nbsp;
						<button id="dialog-repayment-button" type="button" class="btn btn-pink btn-small mybtn" >상환</button>
						&nbsp;
						<button class="btn btn-primary btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
						&nbsp;
						<button type="submit" class="btn btn-danger btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete" onclick="deleteChecked()">삭제</button>
						&nbsp;
						<button class="btn btn-danger btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update" type="submit">수정</button>
						&nbsp;
						<button type="submit" class="btn btn-primary btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert" onclick="submit()">입력</button>
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
									<input type="checkbox" class="ace" id="selectAll" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">사채코드</th>
							<th class="center">사채명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자 ~ 만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>
							<th class="center">은행코드</th>
							<th class="center">은행명</th>
							<th class="center">계좌</th>
							<th class="center">위험등급</th>
						</tr>
					</thead>
						<tbody id="tbody-list">
						<c:forEach items="${dataResult.datas}" var="vo" varStatus="status">
							<tr id="${vo.no }">
								<td id="select-checkbox" class="center" data-no="${vo.no }">
									<label class="pos-rel"></label>
									<input type="checkbox" class="ace" name="no"  data-no="${vo.no }" /><span class="lbl"></span>
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
								<td class="center">
									<fmt:formatNumber id="debtamount-formatnumber" value="${vo.debtAmount}" pattern="#,###" />
									<input type="hidden" name="tbody-hidden-debtAmount" value="${vo.debtAmount}" />
								</td>				
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
											<c:otherwise><td class="center">해당없음</td></c:otherwise>
								</c:choose>	
								<td class="center">${vo.mgr}</td>
								<td class="center">${vo.mgrCall}</td>
								<td class="center">${vo.bankCode}</td>
								<td class="center">${vo.bankName}</td>
								<td class="center">${vo.depositNo}</td>
								<td class="center">${vo.dangerName}</td>
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
			
			$("input[name=no]").val(td.eq(0).attr('data-no'));
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
			var debt = $("#debtamount-formatnumber").val();
			$("input[name=debtAmount]").val(debt);
			$("input[name=hidden-dept-amount]").val($("input[name=tbody-hidden-debtAmount]").val());
			
			// 상환방법
			var repayWay='';
			switch (td.eq(5).text()){
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
			$("input[name=debtExpDate]").val(td.eq(6).text());
			
			// 이율
			//var rate = td.eq(8).text().split('%');
			$("input[name=intRate]").val(td.eq(7).text());
			
			// 이자지급방식
			var intPayWay='';
			switch (td.eq(8).text()){
		    case '년' :
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
			
			$("input[name=mgr]").val(td.eq(9).text()); // 담당자
			$("input[name=mgrCall]").val(td.eq(10).text()); // 담당자전화번호
			$("input[name=bankCode]").val(td.eq(11).text()); // 은행코드
			$("input[name=bankName]").val(td.eq(12).text()); // 은행명
			$("input[name=depositNo]").val(td.eq(13).text()); // 계좌
			
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
		
		// form에 입력한 모든 데이터 초기화
		$("#formReset").bind("click", function () {
			// form의 모든 데이터 초기화
			$('#input-form')[0].reset();
			
			// value 값으로 선택
			$('#majorcode-field-select').val('초기값').trigger('chosen:updated');
			$('#dangercode-field-select').val('초기값').trigger('chosen:updated');
        });
		
		// 은행코드 검색
		$("#a-dialog-bankcode").click(function(event){
			event.preventDefault();
			$("#tbody-bankList").find("tr").remove();
			
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
					$("#input-dialog-bankcode").val('');
					$("#tbody-bankList").append("<tr>" +
					        "<td class='center'>" + response.code + "</td>" +
					        "<td class='center'>" + response.name + "</td>" +
					        "<td class='center'>" + response.store + "</td>" +
					        "</tr>");
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		// 은행명 검색 : 은행목록 리스트로 가져오기
		$("#a-dialog-bankname").click(function(event){
			event.preventDefault();
			$("#tbody-bankList").find("tr").remove();
			
			var banknameVal = $("#input-dialog-bankname").val();
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
				success: function(data){
					$("#input-dialog-bankname").val('');
					 $.each(data,function(index, item){
			                $("#tbody-bankList").append("<tr>" +
			                		"<td class='center'>" + item.code + "</td>" +
							        "<td class='center'>" + item.name + "</td>" +
							        "<td class='center'>" + item.store + "</td>" +
							        "</tr>");
			         })
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		// 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 input form에 추가
		$(document.body).delegate('#tbody-bankList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=bankCode]").val(td.eq(0).text());
			$("input[name=bankName]").val(td.eq(1).text());
			$("#dialog-message").dialog('close');
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
			sendData.push($(this).attr('data-no'));
		});
		
		$("input[name=no]").val(sendData);
		console.log(sendData);
	}	
</script>
<script>
	$(function() {
		$("#dialog-message").dialog({
			autoOpen : false
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

	});
</script>
<script>
	
$(function() {
    $("#dialog-account-message").dialog({
       autoOpen : false
    });

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
    
});

</script>

<script>
$(function() {
	$("#dialog-repayment").dialog({
		autoOpen : false
	});
	
	$("#dialog-repayment-button").click(function() {
		$("#code").val($("#code2").val());
		$("#dialog-repayment").dialog('open');
		$("#dialog-repayment").dialog({
			title: "상환정보등록",
			title_html: true,
		   	resizable: false,
		    height: 500,
		    width: 400,
		    modal: true,
		    close: function() {
		    	$('#code').val('');
		    	$('#repay_bal').val('');
		    	$('input[name=payDate]').val('');
		    	
		    },
		    buttons: {
		    	//상환버튼 클릭시
		    "상환": function(){
		    	event.preventDefault();
				var vo = {
						"debtNo":$("#no").val(),//테이블 번호
						"payPrinc":$("#repay_bal").val(),//상환액
						"payDate":$('input[name=payDate]').val(),//상환일
						"depositNo":$('input[name=depositNo]').val()//계좌번호
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
							alert("값을 정확히 입력하지 않았습니다.");
							return;
						}
						$("#tbody-list tr").each(function(i){
							var td = $(this).children();
							var n = td.eq(0).attr('lterm-no');
							if(n == response.data.no){
								td.eq(5).html(response.data.repayBal);
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
});
	//코드 중복체크
	$("#code2").change(function(){
		$("#btn-check-code").show();
		$("#img-checkcode").hide();
	});	
	
	$("#inputbtn").hide();	// 초기 입력버튼이 보이지 않도록 하는 코드
	$("#btn-check-code").click(function(){
		
		var code = $("#code2").val();
		if(code == ""){
			return;
		}
	
	// ajax 통신
	$.ajax({
		url: "${pageContext.servletContext.contextPath }/11/50/checkcode?code=" + code,
		type: "get",
		dataType: "json",
		data: "",
		success: function(response){
			if(response.result == "fail"){
				console.error(response.message);
				return;
			}
			console.log(response);
			
			if(response.data == null){
				$("#inputbtn").show();
				
				$("#btn-check-code").hide();
				$("#img-checkcode").show();
				return;
			}else if(response.data.deleteFlag == "Y"){
				alert("삭제된 코드입니다.");
			}else{
				alert("이미 존재하는 코드입니다.");
				$("#code2").val("");
				//$("#inputbtn").hide();
				$("#code2").focus();
			}
			
			},
			error:function(xhr,error) {
				console.err("error" + error);
			}
		});
	});	
</script>
<script>
/* $(function() {
    $.validator.setDefaults({
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        showErrors:function(errorMap, errorList){
            if(this.numberOfInvalids()) {
                alert(errorList[0].message);
            }
        }
    });
    $("form[name=p-dept-input-form]").validate({
        rules: {
            code: { required: true, maxlength: 10 },
            name: { required: true, maxlength: 50 },
            inputPrice: { required: true, maxlength: 50 },
            debtExpDate: 'required',
            bankCode: 'required',
            bankName: 'required',
            dangerCode: 'required',
        },
        messages: {
           	code: {
                required: '사채코드를 입력해 주십시오.',
                minlength: '아이디를 4글자 이상 입력해 주십시오.'
            },
            name: {
                required: '사채명을 입력해 주십시오.',
                minlength: '사채명을 입력해 주십시오.'
            },
            inputPrice: {
            	 required: '차입금액을 입력해 주십시오.'
            },
            debtExpDate: {
                required: '차입일자 및 만기일자를 입력해 주십시오.'
            },
            bankCode: {
                required: '은행코드 및 은행명을 입력해 주십시오.'
            },
            bankName: {
                required: '은행코드 및 은행명을 입력해 주십시오.'
            },
            dangerCode: {
                required: '위험등급을 입력해 주십시오.'
            }
        },
        submitHandler: function(form) {
           	var pattern1 = /(^[a-zA-Z])/;
            var pattern2 = /([^a-zA-Z0-9-_])/;
            var code = $.trim($("input[name=code]").val());
            if(!pattern1.test(code)){
                alert('코드의 첫글자는 영문이어야 합니다.');
                return false;
            }
            if(pattern2.test(code)){
                alert('코드는 영문, 숫자, -, _ 만 사용할 수 있습니다.');
                return false;
            }
            form.submit();
        }
    });
}); */
</script>

<script>
// 숫자에 콤마 적용해서 데이터 처리 code start
$(document).ready(function(){
    //키를 누르거나 떼었을때 이벤트 발생
    var rgx3 = /,/gi;
    $("#inputPrice").bind('keyup keydown', function(){
        inputNumberFormat(this);
        var amount = $('input[name=text-debtAmount]').val();
        var coverAmount = amount.replace(/,/g, '');
        $('input[name="debtAmount"]').val(coverAmount); // hidden값에..콤마를 뺀 값을 넣어든다.
    });

    //입력한 문자열 전달
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
      
    //콤마찍기
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    //콤마풀기
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }
});
//숫자에 콤마 적용해서 데이터 처리 code end

</script>
</body>
</html>