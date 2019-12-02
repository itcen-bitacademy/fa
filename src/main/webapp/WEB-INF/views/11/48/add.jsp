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
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
				<div class="container-fluid">
					<!-- Example row of columns -->
					<div class="row">
						<div class="span8">
							<table>
								<tr>
									<td><h4>장기차입금코드</h4></td>
									<td>
										<input type="hidden" name="no" />
										<input type="text" name="code" />
									</td>
								</tr>
								<tr >
									<td><h4>장기차입금명</h4></td>
									<td colspan="2">
										<input type="text" name="name"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금액</h4></td>
									<td><input type="text" name="debtAmount" /></td>
								</tr>
								<tr>
									<td><h4>차입일자 ~ 만기일자</h4></td>
									<td colspan="2">
									<div class="control-group">
				                        <div class="row-fluid input-prepend">			                        	
				                           <input type="text" name="debtExpDate" id ="id-date-range-picker-1" />
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
												<span class="lbl">만기</span>
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td><h4>은행코드</h4></td>
									<td colspan="2">
										<input type="text" class="search-input-width-first" name="bankCode"/>
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
										<input type="text" class="search-input-width-second" name="bankName"/>
									</td>
								</tr>
							</table>
						</div>
						<div class="span8">
							<table>
								<tr>
									<td><h4>회계연도</h4></td>
									<td>
										<input type="number" min="1900" max="2099" step="1" value="2019" id="form-field-1" name="financialYear" placeholder="회계연도"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금대분류</h4></td>
									<td colspan="2">
										<select class="chosen-select form-control" id="form-field-select-3" data-placeholder="차입금대분류" name="form-field-select-3" >
											<option value=""></option>
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
								<td><h4>상환방법</h4></td>
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
									<td><h4>이율</h4></td>
									<td colspan="2">
										<input type="text" name="intRate" placeholder="(%)"/>
									</td>
								</tr>
								<tr>
									<td><h4>담당자</h4></td>
									<td>
										<input type="text" class="mgr-input" name="mgr" />
										<h4 class="mgr-number-input-h4">담당자전화번호</h4>
										<input type="text" class="mgr-call-input" name="mgrCall" />
									</td>
								</tr>
								<tr>
									<td><h4>계좌</h4></td>
									<td colspan="2">
										<input type="text" class="search-input-width-first" name="depositNo"/>
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
										<input type="text" class="search-input-width-second" name="cardAccountBankName"/>
									</td>
								</tr>
							</table>
						</div>

					</div>
				</div>
				<hr>
				<div>
					<button class="btn btn-info btn-small" style="float:right;margin-right:20px;" type="submit">입력</button>
					&nbsp;
					<button class="btn btn-danger btn-small" style="float:right;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update" type="submit">수정</button>
					&nbsp;
					<button class="btn btn-warning btn-small" style="float:right;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete" type="submit" >삭제</button>
					&nbsp;
					<button class="btn btn-primary btn-small" style="float:right;margin-right:20px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
					&nbsp;
					<button type="button" class="btn">상환</button>
					&nbsp;
					<button type="button" class="btn ">초기화</button>
				</div>
				<hr>
			</form>					
			<!-- PAGE CONTENT ENDS -->
				
			<!-- list -->
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">장기차입금코드</th>
							<th class="center">장기차입금명</th>
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
							<th class="center">계좌</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list }" var="ltermvo">
						<tr>
							<td class="center" lterm-no ="${ltermvo.no}"><label class="pos-rel"> <input
									type="checkbox" class="ace" /> <span class="lbl"></span>
							</label></td>
							<td class="center">${ltermvo.code}</td>
							<td>${ltermvo.name}</td>
					        <c:choose>
										<c:when test="${ltermvo.majorCode eq '008001'}"><td class="center">국내은행</td></c:when>
										<c:when test="${ltermvo.majorCode eq '008002'}"><td class="center">저축은행</td></c:when>
										<c:when test="${ltermvo.majorCode eq '008003'}"><td class="center">신용금고</td></c:when>
										<c:when test="${ltermvo.majorCode eq '008004'}"><td class="center">새마을금고</td></c:when>
										<c:when test="${ltermvo.majorCode eq '008005'}"><td class="center">외국계은행</td></c:when>
										<c:otherwise><td class="center">증권</td></c:otherwise>
							</c:choose>	
							<td class="center">${ltermvo.debtAmount}</td>
							<td class="center">${ltermvo.repayBal}</td>
							<c:choose>
										<c:when test="${ltermvo.repayWay eq 'Y'}"><td class="center">년</td></c:when>
										<c:when test="${ltermvo.repayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>		
							<td class="center">${ltermvo.debtExpDate}</td>
							<td class="center">${ltermvo.intRate}%</td>
							<c:choose>
										<c:when test="${ltermvo.intPayWay eq 'Y'}"><td class="center">년</td></c:when>
										<c:when test="${ltermvo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>	
							<td class="center">${ltermvo.mgr}</td>
							<td class="center">${ltermvo.mgrCall}</td>
							<td class="center">${ltermvo.bankCode}</td>
							<td class="center">${ltermvo.depositNo}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div><!-- /.page-content -->
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
$(function(){
	
	$('#id-date-range-picker-1').daterangepicker({
	    format: 'YYYY/MM/DD'
	  }).next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	
	$(".chosen-select").chosen();
	$("#simple-table tr").click(function(){ 
		
		
		var tr = $(this);
		var td = tr.children();
		
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

		$('#form-field-select-3').val(major).trigger('chosen:updated');  
		
		$("input[name=debtAmount]").val(td.eq(4).text());
		$("input[name=debtExpDate]").val(td.eq(7).text());
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
		
		
		var rate = td.eq(8).text().split('%');
		
		
		$("input[name=intRate]").val(rate[0]);
		
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
		$("input[name=mgr]").val(td.eq(10).text());
		$("input[name=mgrCall]").val(td.eq(11).text());
		$("input[name=bankCode]").val(td.eq(12).text());
		$("input[name=depositNo]").val(td.eq(13).text());
		$("input[name=no]").val(td.eq(0).attr('lterm-no'));
	});
});
</script>
</body>
</html>