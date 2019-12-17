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
<!-- plugin 참조-->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/ace/js/jquery.validate.min.js"></script>

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
								<table class="input-form-left">
									<tr>
										<td class="first-span-first-padding-right"><h4>사채코드</h4></td>
										<td class="second-td" colspan="2">
										<input type="hidden" name="no" id = "no" />
										<input type="text" id="pdebtcode-id" class="p-debt-code-input" name="code" />
										<input class="btn btn-primary btn-small" id="btn-check-code" type="button" value="중복확인">
										<img id="img-checkcode" style="display: none; width: 20px;" src="${pageContext.request.contextPath}/assets/images/check.png">
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>사채명</h4></td>
										<td class="second-td" colspan="2"><input type="text" id="onlyHangulAndNumber" class="p-debt-name-input" name="name" placeholder="육하원칙으로 입력해주세요."  /></td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>차입금액</h4></td>
										<td class="second-td" style="display: inline-block;"><input type="text" id="inputPrice" name="textDebtAmount" style="text-align:right;"/> <h5 style="display: inline-block;">(원)</h5><input type="hidden" id="hidden-dept-amount" name="debtAmount" /></td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>차입일자 ~ 만기일자</h4></td>
										<td class="second-td" colspan="2">
											<div class="row-fluid input-prepend">
												<input type="text" name="debtExpDate" name="date-range-picker" id="id-date-range-picker-1" readonly/> <span class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>이자지급방식</h4></td>
										<td class="second-td" colspan="2">
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="Y"/>
												<span class="lbl">연</span>
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
										<td class="second-td" colspan="2">
												<div class="input-append">
													<input type="text" class="search-input-width-first" name="bankCode" placeholder="은행코드" readonly/>
														<span class="add-on">
							                                    <a href="#" id="a-bankinfo-dialog" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i></a>
							                        	</span>
												</div>
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
												<input type="text" class="search-input-width-second" name="bankName" placeholder="은행명" readonly/>
										</td>
									</tr>
									<tr>
										<td class="first-span-first-padding-right"><h4>위험등급</h4></td>
										<td class="second-td" colspan="2">
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
										<select class="chosen-select form-control" id="form-field-select-3" data-placeholder="차입금대분류" name="majorCode" >
											<option value="초기값">선택해주세요.</option>
											<c:forEach items="${sectionlist}" var="sectionvo">
												<option value="${sectionvo.code}">${sectionvo.classification }</option>
											</c:forEach>
										</select>
										</td>
									</tr>
									<tr>
										<td class="second-span-first-padding-right"><h4>상환방법</h4></td>
										<td colspan="2">
												<div class="radio">
													<label>
														<input name="repayWay" type="radio" class="ace" value="Y"/>
														<span class="lbl">연</span>
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
										<td colspan="2"><input type="text" name="intRate" placeholder="(%) 정수로 입력하세요." style="text-align:right;"/> <h5 style="display: inline-block;">(%)</h5></td>
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
											<div class="input-append">
												<input type="text" class="search-input-width-first" id="input-id-depositNo" name="depositNo" placeholder="계좌번호" readonly/>
													<span class="add-on">
						                            	<a href="#" id="a-bankaccountinfo-dialog" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i></a>
						                            </span>
											</div>
												
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
												<input type="text" class="search-input-width-second" name="depositHost" placeholder="예금주" readonly/>
										</td>
									</tr>
								</table>
								
								<!-- 차입금코드,납입원금,납입이자,납입일자,부채유형 Modal pop-up : start -->
								<div id="dialog-repayment" title="상환정보등록" hidden="hidden">
									<table id ="dialog-repayment-table" align="center">
										<tr>
											<td>
												<label>차입금코드</label>
												<input type="text" id="code" name="debtcode" readonly= "readonly"/>
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
												<label>납입금</label>
												<input type="text" name="payPrinc" id= "payPrinc"/>
											</td>
										</tr>
										<tr>
											<td>
												<label>이자금액</label>
												<input type="text" name="intAmount" id= "intAmount" readonly="readonly"/>
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
						<button type="submit" class="btn btn-primary btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">입력</button>
						&nbsp;
						<button type="submit" class="btn btn-danger btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
						&nbsp;
						<button class="btn btn-danger btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete" onclick="deleteChecked()" type="submit">삭제</button>
						&nbsp;
						<button class="btn btn-primary btn-small" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
						&nbsp;
						<button id="dialog-repayment-button" type="button" class="btn btn-pink btn-small" >상환</button>
						&nbsp;
						<button type="button" class="btn btn-success btn-small" id="formReset">초기화</button>
						&nbsp;
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
									<input type="checkbox" class="ace" id="chkbox-select-all" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">사채코드</th>
							<th class="center">사채명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환잔액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자 - 만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>
							<th class="center">은행코드</th>
							<th class="center">은행명</th>
							<th class="center">계좌</th>
							<th class="center">위험등급</th>
							<th class="center">등록일</th>
						</tr>
					</thead>
						<tbody id="tbody-list">
						<c:forEach items="${dataResult.datas}" var="vo" varStatus="status">
							<tr>
								<td class="center" data-no="${vo.no }">
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
								<td class="center"><fmt:formatNumber value="${vo.debtAmount}" pattern="#,###" /><input type="hidden" name="tbody-hidden-debtAmount" value="${vo.debtAmount}" /></td>				
								<td class="center"><fmt:formatNumber value="${vo.repayBal}" pattern="#,###" /></td>
								<c:choose>
											<c:when test="${vo.repayWay eq 'Y'}"><td class="center">연</td></c:when>
											<c:when test="${vo.repayWay eq 'M'}"><td class="center">월</td></c:when>
											<c:otherwise><td class="center">만기</td></c:otherwise>
								</c:choose>		
								<td class="center">${vo.debtExpDate}</td>
								<td class="center">${vo.intRate}</td>
								<c:choose>
											<c:when test="${vo.intPayWay eq 'Y'}"><td class="center">연</td></c:when>
											<c:when test="${vo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
											<c:otherwise><td class="center">해당없음</td></c:otherwise>
								</c:choose>	
								<td class="center">${vo.mgr}</td>
								<td class="center">${vo.mgrCall}</td>
								<td class="center">${vo.bankCode}</td>
								<td class="center">${vo.bankName}</td>
								<td class="center">${vo.depositNo}</td>
								<td class="center">${vo.dangerName}</td>
								<td class="center">${vo.insertDate}</td>
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
		$(".chosen-select").chosen();

		// daterangepicker 호출
		$('#id-date-range-picker-1').daterangepicker({
		    format: 'YYYY-MM-DD'
		  }).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		// datepicker 호출
		$('.date-picker').datepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		// 리스트에서 row를 선택하면 row의 해당 데이터 form에 추가
		$("#tbody-list tr").click(function(){ 
			var tr = $(this);
			var td = tr.children();
			
			$("input[name=no]").val(td.eq(0).attr('data-no'));
			$("input[name=code]").val(td.eq(1).text()); // 사채코드
			$("input[name=name]").val(td.eq(2).text()); // 사채명
			
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
			$('#majorcode-field-select').val(major).trigger('chosen:updated'); // 차입금대분류  
			
			// 차입금액 input 추가 (입력창에 보여지는 부분)
			$("input[name=textDebtAmount]").val(td.eq(4).text()); // 차입금액
			var debtHiddenVal = td.eq(4).text(); // 콤마가 붙지 않은 차입금액
			var debtWithoutComma = removeCommaReturn(td.eq(4).text()); // 콤마가 붙은 차입금액
			
			// 콤마 제거 (제거값리턴)
			function removeCommaReturn(val){
			   if(val != ""){
			    	val = val.replace(/,/g, "");
			   }
			   return val;
			}
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
			$("input[name=debtExpDate]").val(td.eq(7).text());
			
			// 이율
			//var rate = td.eq(8).text().split('%');
			$("input[name=intRate]").val(td.eq(8).text());
			
			// 이자지급방식
			var intPayWay='';
			switch (td.eq(9).text()){
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
			
			$("input[name=mgr]").val(td.eq(10).text()); // 담당자
			$("input[name=mgrCall]").val(td.eq(11).text()); // 담당자전화번호
			$("input[name=bankCode]").val(td.eq(12).text()); // 은행코드
			$("input[name=bankName]").val(td.eq(13).text()); // 은행명
			$("input[name=depositNo]").val(td.eq(14).text()); // 계좌
			
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
			
		});
		
		// form에 입력한 모든 데이터 초기화
		$("#formReset").bind("click", function () {
			// form의 모든 데이터 초기화
			$('#input-form')[0].reset();
			
			// value 값으로 선택
			$('#majorcode-field-select').val('초기값').trigger('chosen:updated');
			$('#dangercode-field-select').val('초기값').trigger('chosen:updated');
        });
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// 은행코드로 검색
		$("#a-dialog-bankcode").click(function(event){
			event.preventDefault();
			$("#tbody-bankList").find("tr").remove();
			
			var bankcodeVal = $("#input-dialog-bankcode").val();
			console.log(bankcodeVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/selectone/getbankcode?bankcode=" + bankcodeVal,
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
					        "<td class='center'>" + response.data.code + "</td>" +
					        "<td class='center'>" + response.data.name + "</td>" +
					        "<td class='center'>" + response.data.store + "</td>" +
					        "</tr>");
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		//--------------------------------------------------------------------------------------------------------------------------//
		
		//--------------------------------------------------------------------------------------------------------------------------//
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
		//--------------------------------------------------------------------------------------------------------------------------//
		
		// 은행리스트(bankList)에서 row를 선택하면 row의 해당 데이터 input form에 추가
		$(document.body).delegate('#tbody-bankList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=bankCode]").val(td.eq(0).text());
			$("input[name=bankName]").val(td.eq(1).text());
			$("#dialog-message").dialog('close');
		});
		
		//--------------------------------------------------------------------------------------------------------------------------//
		//Checkbox All Check
		$("#chkbox-select-all").click(function(){
			console.log('abc')
			$('input[type=checkbox]').prop('checked', this.checked);	//All Checkbox 버튼의 check여부에 따라 바뀐다.
		});
		//--------------------------------------------------------------------------------------------------------------------------//
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// 은행정보 테이블 Modal(dialog 생성)
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
		//--------------------------------------------------------------------------------------------------------------------------//
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// 1. 계좌정보 테이블 Modal(dialog 생성)
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
		
		// 2. 돋보기버튼을 눌렀을 때, 계좌정보 테이블 Modal(dialog) 창이 열림
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
		
		// 3. 계좌정보 테이블에서 row를 선택하면, row의 해당 데이터 form input에 추가
		$(document.body).delegate('#tbody-bankaccountList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=depositNo]").val(td.eq(0).text());
			$("input[name=depositHost]").val(td.eq(1).text());
			$("#dialog-account-message").dialog('close');
		});
		//--------------------------------------------------------------------------------------------------------------------------//
		
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// <상환입력 테이블 Modal(dialog 생성)>
		$("#dialog-repayment").dialog({
			autoOpen : false
		});
		
		$("#dialog-repayment-button").click(function() {
			$("#code").val($("#pdebtcode-id").val());
			$("#tbody-list tr").each(function(i){
				var td = $(this).children();
				var n = td.eq(0).attr('data-no');
				var repayAmount; // 상환잔액
				var yearIntAmount = 0; // 연이자금액
				var monthIntAmount = 0; // 월이자금액
				var intRate = td.eq(8).text().replace('%', ''); // 연이율
				var intRate12 = td.eq(8).text().replace('%', '') / 12; // 월이율
				
				if (n == $("#no").val() && "연" === (td.eq(9).text())) {
					// 연이자 지급방식
					repayAmount = parseInt(td.eq(5).text().replace(/,/g, ''));
					yearIntAmount = parseInt((repayAmount * intRate) / 100);
					$('input[name=intAmount]').val(yearIntAmount);
				} else if (n == $("#no").val() && "월" === (td.eq(9).text())) {
					// 월이자 지급방식
					repayAmount = parseInt(td.eq(5).text().replace(/,/g, '')); 
					monthIntAmount = parseInt((repayAmount * intRate12) / 100);
					$('input[name=intAmount]').val(monthIntAmount);
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
					$('#code').val('');
				    $('input[name=payDate]').val('');
				    $('#payPrinc').val('');
				    $('#intAmount').val('');
				},
				buttons: {
					// 상환버튼 클릭시
					"상환": function() {
						event.preventDefault();
						var intAmount = $('input[name=intAmount]').val();
				    	var repayBal; // 상환잔액
						var remainmoney; // 남은돈
				    	
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
								"payPrinc" : $('input[name=payPrinc]').val(), //납입금
								"payDate" : $('input[name=payDate]').val(), // 상환일
								"intAmount" : $('input[name=intAmount]').val() // 이자금액
						}
						
						if (intAmount > parseInt($('input[name=payPrinc]').val())) {
							alert("이자 금액보다 납입금이 작습니다 납입금("+ intAmount+")보다 크게 입력해주세요");
							return;
						}
				    	
						if (remainmoney < parseInt($('input[name=payPrinc]').val())) {
							alert("납입금이 상환 잔액보다 큽니다 납입금(" + repayBal +") "+"이자("+ intAmount+")보다 작게 입력해주세요");
							return;
						}
						
						console.log("intAmount : " + $('input[name=intAmount]').val());
						
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
									alert("값을 정확히 입력하지 않았습니다.");
									return;
								}
								
								$("#tbody-list tr").each(function(i) {
									var td = $(this).children();
									var n = td.eq(0).attr('data-no');
									if(n == response.data.no){
										var m = response.data.repayBal;
										td.eq(5).html(m).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
									}
								});
								alert("상환데이터가 성공적으로 입력되었습니다.")
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
					}
				}
			});
		});
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// 사채코드 중복체크
		$("#pdebtcode-id").change(function(){
			$("#btn-check-code").show();
			$("#img-checkcode").hide();
		});	
		
		$('#inputbtn').hide();	// 초기 입력버튼이 보이지 않도록 하는 코드
		$("#btn-check-code").click(function(){
			var code = $("#pdebtcode-id").val();
			if(code == ""){
				return;
			}
		
		// ajax 통신
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/11/50/checkcode?code=" + code,
			type: "get",
			dataType: "json",
			data: "",
			success: function(response) {
				if (response.result == "fail") {
					console.error(response.message);
					return;
				}
				console.log(response);
				
				if (response.data == null) {
					$("#inputbtn").show();
					
					$("#btn-check-code").hide();
					$("#img-checkcode").show();
					return;
				} else if (response.data.deleteFlag == "Y"){
					alert("삭제된 코드입니다.");
				} else {
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
		//--------------------------------------------------------------------------------------------------------------------------//
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// 숫자에 콤마 적용해서 데이터 처리
	    var rgx3 = /,/gi;
	    $("#inputPrice").bind('keyup keydown', function(){
	        inputNumberFormat(this);
	        var amount = $('input[name=textDebtAmount]').val();
	        var coverAmount = amount.replace(/,/g, '');
	        // hidden값에..콤마를 뺀 값을 넣어둔다.
	        $('input[name="debtAmount"]').val(coverAmount);
	    });
		//--------------------------------------------------------------------------------------------------------------------------//
		
		//--------------------------------------------------------------------------------------------------------------------------//
		// 유효성 검사 코드 - (jQuery Validation) : validate the comment form when it is submitted
		$("#input-form").validate({
			// 테스트를 위하여 유효성 검사가 완료되어도 submit을 처리하지 않음.
			debug : true,
			//검사할 필드와 검사 항목의 나열
			rules : {
				code : {
					required : true,
					maxlength : 10
				},
		    	name : "required",
		    	textDebtAmount : "required",
		    	debtExpDate : "required",
		    	intPayWay : {
		    		required : true
		    	},
		    	bankCode : "required",
		    	bankName : "required",
		    	dangerCode : "required",
		    	financialYear : "required",
		    	majorCode : "required",
		    	repayWay : "required",
		    	intRate : "required",
		    	mgr : "required",
		    	mgrCall : "required",
		    	depositNo : "required",
		    	depositHost : "required",
		    },
		    //검사를 충족하지 못할 경우 표시될 메시지의 나열
		    messages : {
		    	code : {
		    		required : "사채코드를 입력해주세요.",
		    		maxlength : "사채코드를 10자 이내로 입력해주세요."
		    	},
		    	name : {
		    		required : "사채명을 입력해주세요."
		    	}
		    },
		    invalidHandler: function(event, validator) {
		    	var errors = validator.numberOfInvalids();
		    	
		    	if (errors) {
		    		var message = errors == 1
		    		? 'You missed 1 field. It has been highlighted'
		    				: 'You missed ' + errors + ' fields. They have been highlighted';
		    		$("div.error span").html(message);
		    	    $("div.error").show();
		    	    } else {
		    	    	$("div.error").hide();
		    	    }
		   	},
		   	submitHandler: function(form) {
		    	alert("submitHandler");
		    	return false;  // block the default submit action
		    }
		});
		//--------------------------------------------------------------------------------------------------------------------------//
		
	});
	
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
//--------------------------------------------------------------------------------------------------------------------------//

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
//--------------------------------------------------------------------------------------------------------------------------//
</script>
</body>
</html>