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

.p-debt-code-input {
	width:300px;
}

.p-debt-name-input {
	width:300px;
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

/* button 정렬 */
.mybtn {
	float:right;
	margin-right:20px;
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
				<form class="form-horizontal" method="post" action="">
				<div class="container-fluid">
					<!-- Example row of columns -->
					<div class="row">
						<div class="span8">
							<table>
								<tr>
									<td><h4>사채코드</h4></td>
									<td>
										<input type="text" class="p-debt-code-input" name="code" placeholder="ex) P191128001 (P+년+월+일+번호)"/>
									</td>
								</tr>
								<tr >
									<td><h4>사채명</h4></td>
									<td colspan="2">
										<input type="text" class="p-debt-name-input" name="name"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금액</h4></td>
									<td><input type="text" name="debtAmount" /></td>
								</tr>
								<tr>
									<td><h4>차입일자 ~ 만기일자</h4></td>
									<td colspan="2">
				                        <div class="row-fluid input-prepend">
				                           <input type="text" name="debtExpDate" id="id-date-range-picker-1" />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                           </div>
									</td>
								</tr>
								<tr>
									<td><h4>이자지급방식</h4></td>
									<td colspan="2">
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="Y" />
												<span class="lbl">년</span>
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
												<input name="intPayWay" type="radio" class="ace"  value="E"/>
												<span class="lbl">해당없음</span>
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
								<tr>
									<td><h4>위험등급</h4></td>
									<td colspan="2">
										<select class="chosen-select form-control" name="dangerCode" id="form-field-select-3" data-placeholder="위험등급">
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
									<td><h4>회계연도</h4></td>
									<td>
										<input type="number" min="1900" max="2099" step="1" value="2019" id="form-field-1" name="financialYear" placeholder="회계연도"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금대분류</h4></td>
									<td colspan="2">
										<select class="chosen-select form-control" name="deptClassification" id="form-field-select-3" data-placeholder="차입금대분류">
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
													<input name="repayWay" type="radio" class="ace" value="Y" />
													<span class="lbl">년</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace" value="M" />
													<span class="lbl">월</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace" value="E" />
													<span class="lbl">만기</span>
												</label>
											</div>
									</td>
									</tr>
								<tr>
									<td><h4>이율</h4></td>
									<td colspan="2">
										<input type="text" name="intRate" placeholder="(%) 정수로 입력하세요."/>
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
										<input type="text" class="search-input-width-first" name="accountNo"/>
										<span class="btn btn-small btn-info">
											<i class="icon-search nav-search-icon"></i>
										</span>
										<input type="text" class="search-input-width-second" name="bankName"/>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<hr>
				<div class="row-fluid">
					<button type="submit" class="btn btn-success btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/initialize">초기화</button>
	               &nbsp;
	               <button type="submit" class="btn btn-pink btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/repayInsert">상환</button>
	               &nbsp;
	               <button type="submit" class="btn btn-info btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/select">조회</button>
	               &nbsp;
	               <button type="submit" class="btn btn-danger btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
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
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</th>
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
						</tr>
					</thead>
					<c:forEach items="${list}" var="vo" varStatus="status">
					<tbody>
						<tr>
							<td class="center">
							<label class="pos-rel">
								<input type="checkbox" class="ace" /> <span class="lbl"></span>
							</label></td>
							<td class="center">${vo.code }</td>
							<td>${vo.name }</td>
							<td class="center">${vo.name }</td>
							<td class="center">${vo.debtAmount }</td>
							<td class="center">${vo.repayWay }</td>
							<td class="center"><fmt:formatDate value="${vo.debtDate }" pattern="yyyy-MM-dd"/></td>
							<td class="center"><fmt:formatDate value="${vo.expDate }" pattern="yyyy-MM-dd"/></td>
							<td class="center">${vo.intRate }</td>
							<td class="center">${vo.intPayWay }</td>
							<td class="center">${vo.mgr }</td>
							<td class="center">${vo.mgrCall }</td>
							<td class="center">${vo.bankCode }</td>
							<td class="center">${vo.depositNo }</td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
				
				
				<div class="pagination">
					<ul>
						<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
					</ul>
				</div>
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
	$(".chosen-select").chosen();
	$('#id-date-range-picker-1').daterangepicker({
			format : 'YYYY-MM-DD'
		}).next().on(ace.click_event, function() {
			$(this).next().focus();
		});

		$('.icon-calendar').daterangepicker({
			format : 'YYYY-MM-DD'
		}).next().on(ace.click_event, function() {
			$(this).next().focus();
		});
	});
</script>
</body>
</html>