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
<!-- For Dialog -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
input[type="text"], input[type="date"], select {
	width: 300px;
}

.input-area{
	display: grid;
	grid-template-columns: repeat(2, auto);
	margin-left: 8px;
}

.input-area>*{
	grid-column: auto;
	display: grid;
	grid-template-rows: repeat(6, auto);
	grid-template-columns: 150px auto;
	gap: 10px 0;
}

.ia-left{grid-column:1;}
.ia-right{grid-column:2;}

.above-table{
	display: grid;
	grid-template-columns: repeat(2, 50%);
	height: 30px;
}
.above-table>*{grid-column: auto;}
.above-table-left>*{float: left; margin:0;}

.btn-list{float: left; }
.btn-list>button{ 
	margin-right: 10px;
	float:none;
}
.btn-list>button:last-child{
	margin-right: 0;}
.btn-list>button:not(:first-child):not(:last_child){margin: 0 auto}

</style>
</head>
<body class="skin-3">
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode }"/>
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }"/>
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">

			<div class="page-header position-relative">
				<h1 class="pull-left">상환내역관리</h1>
			</div>
			
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="input-form" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
				<input type="hidden" name="no"/>
				<div class="input-area">
					<section>
						<div class="ia-left"><h4>차입금코드</h4></div>
						<div class="ia-right"><input type="text" id="debtNo" name="debtNo" placeholder="ex) P191128001 (P+년+월+일+번호)" required></div>
						<div class="ia-left"><h4>상환금액</h4></div>
						<div class="ia-right"><input type="text" id="payPrinc" name="payPrinc" required></div>
						<div class="ia-left"><h4>이자금액</h4></div>
						<div class="ia-right"><input type="text" id="intAmount" name="intAmount" required></div>
					</section>
					
					<section>
						<div class="ia-left"><h4>상환일자</h4></div>
						<div class="ia-right">
							<input type="date" id="payDate" name="payDate">
						</div>
						<div class="ia-left"><h4>부채유형</h4></div>
						<div class="ia-right">
							<select class="chosen-select form-control" name="debtType" id="debtType" data-placeholder="부채유형을 선택해주세요." required>
								<option value=""></option>
								<option value="008001">단기차입금</option>
								<option value="008002">장기차입금</option>
								<option value="008003">사채</option>
							</select>
						</div>
					</section>
				</div>	<!--  input area -->
				
				<hr>
				<section class="above-table">
					<section class="above-table-left">
						<div class="btn-list">
							<button type="submit" class="btn btn-primary btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">입력</button>
							<button type="submit" class="btn btn-warning btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
							<button type="button" class="btn btn-danger btn-small mybtn" onclick="deleteChecked()">삭제</button>
							<button type="button" class="btn btn-info btn-small mybtn" onclick="search()">조회</button>
							<button type="submit" class="btn btn-pink btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/repayInsert">상환</button>
							<button type="reset" class="btn btn-success btn-small mybtn">초기화</button>
						</div>
					</section>
				</section>
				<hr>
			</form>
			<div>
				<h5>총  ${contentsCount }건</h5>
			</div>
			<br>				
			<!-- PAGE CONTENT ENDS -->
			
			<!-- list -->
			<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center" >
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="chkbox-select-all" />
									<span class="lbl"></span>
								</label>
							</th>
							<th class="center">차입금코드</th>
							<th class="center">상환금액</th>
							<th class="center">이자금액</th>
							<th class="center">상환일자</th>
							<th class="center">부채유형</th>
							<th class="center">전표번호</th>
							<th class="center">계좌번호</th>
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
								<td class="center">${vo.debtNo}</td>
								<td class="center">${vo.payPrinc}</td>
								<td class="center">${vo.intAmount}</td>
								<td class="center">${vo.payDate}</td>
								<td class="center">${vo.debtType}</td>
								<td class="center">${vo.voucherNo}</td>
								<td class="center">${vo.depositNo}</td>
								<td class="center">${vo.insertDate}</td>
							</tr>
							</c:forEach>
						</tbody>
				</table>
				
				<div class="pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li>
									<a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }">
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
									<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li>
									<a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }">
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
			</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<!-- For Dialog -->

<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<script>
$(function() {
	$(".chosen-select").chosen();
});
</script>
</body>
</html>