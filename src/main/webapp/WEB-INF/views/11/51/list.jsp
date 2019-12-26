<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

<style>
.form-horizontal .control-label {text-align: left;}

.radio {
	float: left;
	width: 10%;
}

.prod-list-opts {
	padding: 10px 15px 9px 20px;
	position: relative;
}

.checkbox {
	float: left;
}

form {
	margin-bottom: 0px;
}

/* table columns  */
.first-column {width:170px; padding-left:20px;}
.second-column {width:400px;}
.third-column {width:120px;}
.fourth-column {width:70px;}
.fifth-column {width:200px;}
.sixth-column {padding-left:10px;}

/* second row */
.span2 {padding-left:40px; padding-top:20px;}

</style>
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">사채현황조회</h1>
			</div><!-- /.page-header -->
				
					<!-- PAGE CONTENT BEGINS -->
					<div>
						<div>
						<form class="form-horizontal" method="get" action="">
							<table style="width:100%;">
								<tbody>
								<tr>
									<td class="first-column">
										<label class="control-label">차입일자</label>
									</td>
									<td class="second-column">
				                        <div class="row-fluid input-prepend">
				                           <input class="date-picker" type="text" name="debtDate" id="id-date-picker-1"  data-date-format="yyyy-mm-dd"  />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                         </div>
									</td>
									<td class="third-column">
										<label class="control-label">이자지급방식</label>
									</td>
									<td>
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
												<span class="lbl">만기</span>
											</label>
										</div>
									</td>
									<td class="fourth-column">
										<label class="control-label">은행명</label>
									</td>
									<td class="fifth-column">
										<input type="text" name="bankName"/>
									</td>
									<td class="sixth-column">
										<button type="submit" class="btn btn-primary btn-small" style="width: 50px;" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
									</td>
								</tr>
								<tr>
								<td class="first-column">
									<label class="control-label">만기일자</label>
								</td>
									<td class="second-column">
				                        <div class="row-fluid input-prepend">
				                           <input class="date-picker" type="text" name="expDate" id="id-date-picker-1" data-date-format="yyyy-mm-dd"  />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                         </div>
									</td>
								</tr>
								</tbody>
							</table>	
							<div class="row-fluid">
								<div class="span9">
									<div class="prod-list-opts">
										<label class="control-label" style="padding-right: 12px;">차입금 선택정렬</label>
										<select class="chosen-select form-control" id="majorcode-field-select" data-placeholder="정렬하기 위해 선택해주세요." name="sort" >
											<option value=""></option>
											<option value="d">차입일자</option>
											<option value="e">만기일자</option>
											<option value="i">등록일자</option>
											<option value="m">차입금액</option>
										</select>
									</div>
								</div>
								<div class="span2">
									<div class="checkbox">
										<label>
											<input name="form-field-checkbox" type="checkbox" class="ace" />
											<span class="lbl">삭제포함</span>
										</label>
									</div>
									<div class="checkbox">
										<label>
											<input name="form-field-checkbox" type="checkbox" class="ace" />
											<span class="lbl">상환완료포함</span>
										</label>
									</div>
								</div>
							</div>
							</form>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
			
				<!-- list -->
				<p>총 ${contentsCount }건</p>
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
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
							<th class="center">계좌</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
						<tr>
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
							<td class="center"><fmt:formatNumber value="${vo.debtAmount}" pattern="#,###" /></td>
							<c:choose>
										<c:when test="${vo.repayWay eq 'Y'}"><td class="center">연</td></c:when>
										<c:when test="${vo.repayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>		
							<td class="center">${vo.debtExpDate}</td>
							<td class="center">${vo.intRate}%</td>
							<c:choose>
										<c:when test="${vo.intPayWay eq 'Y'}"><td class="center">연</td></c:when>
										<c:when test="${vo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>	
							<td class="center">${vo.mgr}</td>
							<td class="center">${vo.mgrCall}</td>
							<td class="center">${vo.bankCode}</td>
							<td class="center">${vo.depositNo}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				<!-- 페이징 처리 코드 start -->
				<div class="pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${dataResult.pagination.startPage - 1 }">
								<i class="icon-double-angle-left"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
							<c:choose>
								<c:when test="${pg eq dataResult.pagination.page }">
									<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${pg }">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${pg}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- 페이징 처리 코드 end -->
				
			</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
  <script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
  <script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<script>
	$(function() {
		$(".chosen-select").chosen();
		$('.date-picker').datepicker().next().on(ace.click_event, function() {
			$(this).prev().focus();
		});
	});
</script>
</body>
</html>