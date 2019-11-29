<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
	<style>
		.chosen-search {
			display: none;
			}
	</style>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
	<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/ace-elements.min.js"></script>
	<script src="${pageContext.request.contextPath }/ace/assets/js/ace.min.js"></script>
	<script	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

	<script type="text/javascript">
		$(function() {
			$(".chosen-select").chosen();
		})
	</script>

	<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$.fn.datepicker.dates['ko'] = {
			days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
			daysShort: ["일", "월", "화", "수", "목", "금", "토"],
			daysMin: ["일", "월", "화", "수", "목", "금", "토"],
			months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			today: "Today",
			clear: "Clear",
			format: "yyyy-mm-dd",
			titleFormat: "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart: 0
			};
	
			$('#cl-ym-date-picker').datepicker({
				maxViewMode: 4,
				minViewMode: 1,
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
	
			$('.cl-date-picker').datepicker({
				language: 'ko'
			}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
		})
	</script>
	
	<c:import url="/WEB-INF/views/common/head.jsp" />
</head>

<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">계정거래처원장조회[32]</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			
			<div class="row-fluid"> <!-- 검색조건 -->
				<form class="form-horizontal; center">
					&nbsp; &nbsp;&nbsp; &nbsp;계정코드/계정명 :&nbsp; 
					<input type="text" id="form-field-1" placeholder="계정코드" size=4 style="width:150px"/>
					<input type="text" id="form-field-1" placeholder="계정명" size=4 style="width:150px" readonly/> <!-- 계정명 자동입력 -->
						
					&nbsp; &nbsp;&nbsp; &nbsp;사업자등록번호 :&nbsp; 
					<input type="text" id="form-field-1" placeholder="사업자등록번호" size=4 style="width:150px"/>
						
					&nbsp; &nbsp;&nbsp;&nbsp;조회 기간 :&nbsp;
					<div class="input-append">
						<input type="text" id="datepicker" class="cl-date-picker"  style="width:100px"/>
						<span class="add-on">
							<i class="icon-calendar">
							</i>
						</span>
					</div>
					
					&nbsp; &nbsp; ~ &nbsp; &nbsp;
					<div class="input-append">
						<input type="text" id="datepicker2" class="cl-date-picker"  style="width:100px"/> 
						<span class="add-on"> 
							<i class="icon-calendar">
							</i>
						</span>
					</div>
						
					&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-small btn-info">조회</button>
				</form>
				<div class="hr hr-18 dotted">
				</div>
			</div><!-- 검색조건 END -->
			
			<div class="row-fluid">
				<div class="span12">
				
					<!-- PAGE CONTENT BEGINS -->
					<div class="row-fluid">
						<div class="span12">
						<div style="width:100%; overflow-x:auto"> <!-- scroll auto -->
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">
											<label class="pos-rel">
											<input type="checkbox" class="ace" />
											<span class="lbl"></span>
											</label>
										</th>
										<th class="center">계정명</th>
										<th class="center">거래처명</th>
										<th class="center">일자</th>
										<th class="center">전표번호</th>
										<th class="center">전표순번</th>
										<th class="center">사용팀/성명</th>
										<th class="center">적요</th>
										<th class="center">카드번호/종류</th>
										<th class="center">은행명/계좌번호/예금주</th>
										<th class="center">차대구분</th>
										<th class="center">금액</th>
										<th class="center">부가세</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td class="center">
												<label class="pos-rel">
													<input type="checkbox" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td class="center">카드미수금</td>
											<td class="center">비트컴퓨터</td>
											<td class="center">20191128</td>
											<td class="center">0001</td>
											<td class="center">02</td>
											<td class="center">5팀/김현곤</td>
											<td class="center">비트컴퓨터에 네트워크장비 10대 판매</td>
											<td class="center">1111-1111-1111/???</td>
											<td class="center"></td>
											<td class="center">차변</td>
											<td class="center">100,000,000</td>
											<td class="center">10,000,000</td>
										</tr>
										
										<tr>
											<td class="center">
												<label class="pos-rel">
													<input type="checkbox" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td class="center">카드미수금</td>
											<td class="center">비트컴퓨터</td>
											<td class="center">20191129</td>
											<td class="center">0001</td>
											<td class="center">01</td>
											<td class="center">5팀/김현곤</td>
											<td class="center">김승곤매니져한테 네트워크장비 10대 덤탱이 씌워서 판매</td>
											<td class="center">1111-1111-1111/???</td>
											<td class="center"></td>
											<td class="center">차변</td>
											<td class="center">100,000,000,000</td>
											<td class="center">10,000,000,000</td>
										</tr>
								</tbody>
							</table>
						</div>
							
							
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
					
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			<div class="pagination"><!-- 페이징 공통 -->
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
</body>
</html>