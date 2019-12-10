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
					<div class="form-group"style="float: left">
					&nbsp; &nbsp;&nbsp; &nbsp;계정코드/계정명 :&nbsp; 
					<input type="text" id="form-field-1" placeholder="계정코드" size=4 style="width:150px"/>
					<input type="text" id="form-field-1" placeholder="계정명" size=4 style="width:150px" readonly/> <!-- 계정명 자동입력 -->
					</div>
					<div class="form-group" style="float: left">
							&nbsp; &nbsp;&nbsp; &nbsp;상호명/사업자등록번호:&nbsp;
						<div class="input-append">
						<span class="btn btn-small btn-info">
						<a href="#" id="a-customerinfo-dialog">
						<i class="icon-search nav-search-icon"></i>
						<input type="text" class="search-input-width-first" name="name" id="name" placeholder="상호명" readonly/>
										<script type="text/javascript">
											var name = "${param.name}";
											$("#name").val(name);
										</script>
										</a>
										</span>
									</div>
									<input type="text" id="no" name="no" placeholder="자동입력" class="col-xs-10 col-sm-5" readonly />
										<script type="text/javascript">
											var no = "${param.no}";
											$("#no").val(no);
										</script>
								</div>

			
								<!-- 거래처 Modal pop-up : start -->
								<div id="dialog-message" title="계좌" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>사업자등록번호</label> <input type="text"
												id="input-dialog-customerno" style="width: 100px;" /> <a
												href="#" id="a-dialog-customerno"> <span
													class="btn btn-small btn-info" style="margin-bottom: 10px;">
														<i class="icon-search nav-search-icon"></i>
												</span>
											</a></td>
										<td><label>상호명</label> <input type="text"
											id="input-dialog-customername" style="width: 100px;" /> <a
											href="#" id="a-dialog-customername"> <span
												class="btn btn-small btn-info" style="margin-bottom: 10px;">
													<i class="icon-search nav-search-icon"></i>
											</span>
										</a></td>
										</tr>
									</table>
									<!-- 거래처 데이터 리스트 -->
									<table id="modal-customer-table"
										class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">구분</th>
												<th class="center">사업자등록번호</th>
												<th class="center">상호명</th>
											</tr>
										</thead>
										<tbody id="tbody-customerList">
										</tbody>
									</table>
								</div>
								<!-- 거래처Modal pop-up : end -->
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
		});
		
		// 사업자번호 검색
		$("#a-dialog-customerno").click(function(event){
			event.preventDefault();
			$("#tbody-customerList").find("tr").remove();
		
			var customerNoVal = $("#input-dialog-customerno").val();
			console.log(customerNoVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/getcustomerNo?customerNoVal=" + customerNoVal,
				contentType : "application/json; charset=utf-8",
				type: "get",
				dataType: "json",
				data: "",
				statusCode: {
				    404: function() {
				      alert("page not found");
				    }
				},
				success: function(response){
					$("#input-dialog-customerno").val('');
					$.each(response.data,function(index, item){
						$("#tbody-customerList").append("<tr>" +
						        "<td class='center'>" + item.customerDiv + "</td>" +
						        "<td class='center'>" + item.no + "</td>" +
						        "<td class='center'>" + item.name + "</td>" +
						        "</tr>");
		        	 });
				
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
		
		//거래처명 검색 :거래처목록 리스트로 가져오기
		$("#a-dialog-customername").click(function(event){
			event.preventDefault();
			$("#tbody-customerList").find("tr").remove();
			
			var customerNameVal = $("#input-dialog-customername").val();
			console.log(customerNameVal);
			// ajax 통신
			$.ajax({
				url: "${pageContext.request.contextPath }/api/customer/getcustomerName?customerNameVal=" + customerNameVal,
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
					$("#input-dialog-customername").val('');
					 $.each(response.data,function(index, item){
			                $("#tbody-customerList").append("<tr>" +
			                		"<td class='center'>" + item.customerDiv + "</td>" +
							        "<td class='center'>" + item.no + "</td>" +
							        "<td class='center'>" + item.name + "</td>" +
							        "</tr>");
			         })
				},
				error: function(xhr, error){
					console.error("error : " + error);
				}
			});
		});
	</script>
<script>
	$(function() {
		$("#dialog-message").dialog({
			autoOpen : false
		});

		$("#a-customerinfo-dialog").click(function() {
			$("#dialog-message").dialog('open');
			$("#dialog-message").dialog({
				title: "거래처정보",
				title_html: true,
			   	resizable: false,
			    height: 500,
			    width: 400,
			    modal: true,
			    close: function() {
			    	$('#tbody-customerList tr').remove();
			    },
			    buttons: {
			    "닫기" : function() {
			          	$(this).dialog('close');
			          	$('#tbody-customerList tr').remove();
			        }
			    }
			});
		});

		//거래처리스트(customerList)의 row의 해당 데이터 form에 추가
		$(document.body).delegate('#tbody-customerList tr', 'click', function() {
			var tr = $(this);
			var td = tr.children();
			$("input[name=no]").val(td.eq(1).text());
			$("input[name=name]").val(td.eq(2).text());
			$("#dialog-message").dialog('close');
		});

	});
</script>
</body>
</html>