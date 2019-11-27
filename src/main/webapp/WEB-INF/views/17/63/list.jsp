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
				<h1 class="pull-left">대차대조표조회[63]</h1>
			</div>
			<%-- Page Header END --%>
			
			<%-- Page Content Header BEGIN--%>
			<div class="row-fluid">
				<div class="span12">
					<h1 class="center">대차대조표</h1>
				</div>
			</div>
			
			<%-- 대차대조표 선택 --%>
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
			
			
			<%-- 대차대조표 데이터 테이블 BEGINS --%>
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
								<td style="padding-left:1%;">자산</td>
								<td class="center"></td>
								<td class="center"></td>
							</tr>
							<tr>
								<td style="padding-left:3%;">유동자산</td>
								<td class="center">3,000,000,000</td>
								<td class="center">14,232,193,418</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">현금및현금성자산</td>
								<td class="center">135,000,000</td>
								<td class="center">402,002,550</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">단기금융상품</td>
								<td class="center">3,000,000</td>
								<td class="center">10,000,000</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">매출채권</td>
								<td class="center">500,000,000</td>
								<td class="center">2,627,932,201</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">기타수취채권</td>
								<td class="center">6,000,000,000</td>
								<td class="center">10,411,727,832</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">재고자산</td>
								<td class="center">11,000,000</td>
								<td class="center">547,533,028</td>
							</tr>
							<tr>
								<td style="padding-left:3%;">비유동자산</td>
								<td class="center">12,000,000,000</td>
								<td class="center">95,503,595,920</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">장기금융상품</td>
								<td class="center">4,000,000</td>
								<td class="center">802,171,090</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">당기손익_공정가치측정금융자산</td>
								<td class="center">60,000,000</td>
								<td class="center">2,364,053,368</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">유형자산</td>
								<td class="center">3,000,000,000</td>
								<td class="center">18,028,674,331</td>
							</tr>
							<tr>
								<td style="padding-left:3%;">자산총계</td>
								<td class="center">83,000,000,000</td>
								<td class="center">109,735,789,338</td>
							</tr>
							<tr>
								<td style="padding-left:1%;">부채</td>
								<td class="center"></td>
								<td class="center"></td>
							</tr>
							<tr>
								<td style="padding-left:3%;">유동부채</td>
								<td class="center">3,000,000,000</td>
								<td class="center">55,932,715,044</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">매입채무</td>
								<td class="center">600,000,000</td>
								<td class="center">5,040,061,614</td>
							</tr>
							<tr>
								<td style="padding-left:3%;">비유동부채</td>
								<td class="center">8,000,000,000</td>
								<td class="center">17,315,383,822</td>
							</tr>
							<tr>
								<td style="padding-left:6%;">차입금</td>
								<td class="center">20,000,000</td>
								<td class="center">8,518,159,012</td>
							</tr>
							<tr>
								<td style="padding-left:3%;">부채총계</td>
								<td class="center">12,000,000,000</td>
								<td class="center">73,248,098,866</td>
							</tr>
							<tr>
								<td style="padding-left:1%;">자본</td>
								<td class="center"></td>
								<td class="center"></td>
							</tr>
							<tr>
								<td style="padding-left:3%;">자본금</td>
								<td class="center">500,000,000</td>
								<td class="center">8,095,462,500</td>
							</tr>
							<tr>
								<td style="padding-left:3%;">주식발행초과금</td>
								<td class="center">7,000,000,000</td>
								<td class="center">23,618,508,786</td>
							</tr>
							<tr>
								<td style="padding-left:3%;">자본총계</td>
								<td class="center">11,000,000,000</td>
								<td class="center">36,487,690,472</td>
							</tr>
							<tr>
								<td style="padding-left:1%;">자본과부채총계</td>
								<td class="center">40,000,000,000</td>
								<td class="center">109,735,789,338</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<%-- 대차대조표 데이터 테이블 ENDS --%>
			
			
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