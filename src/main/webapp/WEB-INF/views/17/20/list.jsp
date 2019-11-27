<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
.chosen-search {
	display: none;
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
				<h1 class="pull-left">마감현황관리[20] list</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">

					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal">
						<%-- 년 월 select --%>
						<div class="control-group">
							<label class="control-label" for="year-month" style="text-align:left;width:60px;">년도:</label>
							<div class="controls" style="margin-left:60px;">
								<select class="chosen-select" id="year-month" name="yearMonth" data-placeholder="년 월 선택">
									<option value="2019-12">2020</option>
									<option value="2019-12">2019</option>
									<option value="2019-12">2018</option>
									<option value="2019-12">2017</option>
									<option value="2019-12">2016</option>
									<option value="2019-12">2015</option>
									<option value="2019-12">2014</option>
									<option value="2019-12">2013</option>
								</select>

								<%-- 조회버튼 --%>
								<button class="btn btn-small btn-info">조회</button>
							</div>
						</div>
					</form>
					<!-- /row -->

					<%-- 테이블 영역 --%>
					<div class="row-fluid">
						<div class="span12">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>년 월</th>
										<th>전체마감일</th>
										<th>전표마감일</th>
										<th>자산마감일</th>
										<th>부채마감일</th>
										<th>매입마감일</th>
										<th>매출마감일</th>
										<th>결산마감일</th>
										<%-- <th>결산여부</th>
										<th>결산일</th>
										<th>작업자</th>
										<th>결산</th> --%>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2019-12</td>
										<td>2020-01-03</td>
										<td>2020-01-02</td>
										<td>2019-12-30</td>
										<td>2019-12-31</td>
										<td>2019-12-30</td>
										<td>2019-12-31</td>
										<td>2020-01-03</td>
										<%-- <td>미결산</td>
										<td>-</td>
										<td>-</td>
										<td> --%>
											<%-- <button class="btn btn-info btn-small">결산</button>
										</td> --%>
									</tr>
									<tr>
										<td>2019-11</td>
										<td>2019-12-03</td>
										<td>2019-12-02</td>
										<td>2019-11-29</td>
										<td>2019-11-30</td>
										<td>2019-11-29</td>
										<td>2019-11-30</td>
										<td>2019-12-03</td>
										<%-- <td>완료</td>
										<td>2019-12-03</td>
										<td>최웅</td>
										<td></td> --%>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->

					<%-- 페이징 --%>
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

				</div><!-- /.span -->
			</div><!-- /.row-fluid -->



		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen();
});
</script>
</body>
</html>
