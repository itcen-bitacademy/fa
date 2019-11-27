<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<%-- Page Header BEGIN --%>
			<div class="page-header position-relative">
				<h1 class="pull-left">손익계산서조회[64]</h1>
			</div>
			<%-- Page Header END --%>
			
			<%-- Page Content Header BEGIN--%>
			<div class="row-fluid">
				<div class="span12">
					<h1 class="center">손익계산서</h1>
				</div>
			</div>
			
			<%-- 손익계산서 선택 --%>
			<div class="row-fluid">
				<div class="span6">
					<form class="form-horizontal">
						<%-- 년 월 select --%>
						<div class="control-group">
							<label class="control-label" for="year-month" style="text-align:left;width:60px;">년 월:</label>
							<div class="controls" style="margin-left:60px;">
								<select class="chosen-select" id="year-month" name="yearMonth" data-placeholder="년 월 선택">
									<option value="2019-12">2019-12</option>
									<option value="2019-12">2019-11</option>
									<option value="2019-12">2019-10</option>
									<option value="2019-12">2019-9</option>
									<option value="2019-12">2019-8</option>
									<option value="2019-12">2019-7</option>
									<option value="2019-12">2019-6</option>
									<option value="2019-12">2019-5</option>
									<option value="2019-12">2019-4</option>
									<option value="2019-12">2019-3</option>
								</select>

								<%-- 조회버튼 --%>
								<button class="btn btn-small btn-info">조회</button>
							</div>
						</div>
					</form>
				</div><!-- /.span -->
				<%-- 단위 표시 --%>
				<div class="span6">
					<form class="form-horizontal">
						<div class="control-group">
							<label class="control-label" for="year-month" style="float:right;">(단위: 원)</label>
						</div>
					</form>
				</div>
			</div><!-- /.row-fluid -->
			<%-- Page Content Header END --%>
			
			
			<%-- 손익계산서 데이터 테이블 BEGINS --%>
			<div class="row-fluid">
				<div class="span12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center" width="44%">계정</th>
								<th class="center" width="28%">당월</th>
								<th class="center" width="28%">합계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align:left;">매출액</td>
								<td class="center">26,634,911,217</td>
								<td class="center">51,522,788,094</td>
							</tr>
							<tr>
								<td style="text-align:left;">매출원가</td>
								<td class="center">22,399,521,291</td>
								<td class="center">45,691,296,840</td>
							</tr>
							<tr>
								<td style="text-align:left;">매출총이익</td>
								<td class="center">4,235,389,926</td>
								<td class="center">5,831,491,254</td>
							</tr>
							<tr>
								<td style="text-align:left;">판매비와관리비</td>
								<td class="center">3,163,541,154</td>
								<td class="center">6,579,761,288</td>
							</tr>
							<tr>
								<td style="text-align:left;">영업이익(손실)</td>
								<td class="center">1,071,848,772</td>
								<td class="center">(748,270,034)</td>
							</tr>
							<tr>
								<td style="text-align:left;">기타수익</td>
								<td class="center">4,723,553</td>
								<td class="center">11,179,869</td>
							</tr>
							<tr>
								<td style="text-align:left;">기타비용</td>
								<td class="center">17,625,345</td>
								<td class="center">63,752,263</td>
							</tr>
							<tr>
								<td style="text-align:left;">금융수익</td>
								<td class="center">200,114,089</td>
								<td class="center">487,402,407</td>
							</tr>
							<tr>
								<td style="text-align:left;">금융비용</td>
								<td class="center">884,048,596</td>
								<td class="center">1,941,462,354</td>
							</tr>
							<tr>
								<td style="text-align:left;">법인세비용차감전순이익(손실)</td>
								<td class="center">375,012,473</td>
								<td class="center">(2,254,902,375)</td>
							</tr>
							<tr>
								<td style="text-align:left;">법인세비용</td>
								<td class="center">82,951,101</td>
								<td class="center">(449,527,290)</td>
							</tr>
							<tr>
								<td style="text-align:left;">당기순이익(손실)</td>
								<td class="center">292,061,372</td>
								<td class="center">(1,805,375,085)</td>
							</tr>
							<tr>
								<td style="text-align:left;">총포괄손익</td>
								<td class="center">292,061,372</td>
								<td class="center">(1,805,375,085)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<%-- 손익계산서 데이터 테이블 ENDS --%>
			
			
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