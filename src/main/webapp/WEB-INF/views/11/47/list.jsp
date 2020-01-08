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
	*{margin:0; padding:0}
	label, h4{display: inline-block}
	
	#filter-area{
		display: grid;
		grid-template-rows: 50px 70px 25px;
	}
	
	.filter-top{
		display: grid;
		grid-template-columns: repeat(3, auto);
	}
	
	.input-area-wrapper{
		display: grid;
		grid-template-columns: repeat(4, 24.6%);
		gap: 10px;
		
		align-content: center;
		margin: auto 0;
	}
	
	.input-area{
		display: grid;
		grid-template-columns: 200px auto;
	}
	.input-area:not(:first-child):not(:last-child){
		margin: 0 auto;
	}
	.input-area>*{
		margin: auto 0;
		display: inline-block;
	}

	.input-area>*, .input-area>div>*{
		margin: auto 0;
	}
	.input-area-radio{
		display: grid;
		grid-template-columns: 150px 50px 50px 80px;
	}
	.filter-left{
		grid-row: 3;
	}
	
	.filter-left>*{
		margin: auto 0;
	}	
	.filter-right{
		grid-row: 3;
	}
	
	.filter-bottom{
		display: grid;
		grid-template-columns: repeat(2, auto);
	}
	
	.filter-bottom>div:last-child{}
	
	.chkbox-list-area{
		margin: auto 0;		/** **/
		float:right;
	}
	
	.chkbox-list-area>*{
		display: inline;
		margin-left: 10px;
	}
	
	.selectbox-wrapper>select{ width:60px; height: 25px;}

.checkbox {
	float: left;
}

.pagination{
 	display:grid;
 	grid-template-columns: repeat(3,auto);
 }
 
 .page-info{
 	display: grid;
 	grid-template-columns: repeat(2, auto);
 }
 
 .page-info>div:last-child>div{
 	float: right;
 }
 .pg-list{grid-column: 2;}
 .pg-total-row>h5{float:left; margin:0}


.add-on {
    display: inline-block;
    width: auto;
    height: 20px;
    min-width: 16px;
    padding: 4px 5px;
    font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    text-align: center;
    text-shadow: 0 1px 0 #fff;
    background-color: #eee;
    border: 1px solid #ccc;
    vertical-align: top;
}

div > span.add-on{margin-left:-5px}


.div-float-right{
	float: right;
}

.div-float-right>*{
	margin: auto 0;
	display: inline-block;
}

div > .label-radio{margin-right: 10px;}

</style>
</head>
<body class="skin-3">
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }">
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode}">
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }">
<input type="hidden" id="order-column">		<!-- 정렬값을 저장 -->
<input type="hidden" id="search-condition" value="">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">단기차입금현황조회</h1>
			</div><!-- /.page-header -->
			<!-- PAGE CONTENT BEGINS -->
			<form id="filter-area" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search">
				<section class="filter-top">
						<div class="input-area">
							<label class="label-name" >차입일자</label>
							<div>
								<input type="text" name="debtDate" class="cl-date-picker" id="id-date-picker-1" readOnly>
								<span class="add-on">
	                              <i class="icon-calendar"></i>	
	                           	</span>	
							</div>
						</div>
						<div class="input-area">
							<label class="label-name">이자지급방식</label>
							<div class="radio-area">
								<input type="radio" name="intPayWay" value="Y"><label class="label-radio">연</label>
								<input type="radio" name="intPayWay" value="M"><label class="label-radio">월</label>
								<input type="radio" name="intPayWay" value="E"><label class="label-radio">해당없음</label>
							</div>
						</div>
						<div>
							<div class="div-float-right input-area">
								<label for="bankName" class="label-name">은행명</label>
								<div>
									<input type="text" name="bankName" id="bankName">
								</div>
							</div>
						</div>
				</section> <!-- filter-top end -->
				<section class="filter-mid">
					<div class="input-area">
						<label class="label-name">만기일자</label>
						<div>
							<input type="text" name="expDate" class="cl-date-picker" id="id-date-picker-1" readOnly>
							<span class="add-on">
                              <i class="icon-calendar"></i>	
                           	</span>	
						</div>
					</div>
				</section>
				<section class="filter-bottom">
					<div class="input-area">
						<label class="label-name">차입금 선택정렬</label>
						<select class="order-list chosen-select form-control" id="majorcode" data-placeholder="정렬하기 위해 선택해주세요." onchange="order(this)" >	<!-- id를 통해서 정렬 컬럼을 파악한다. -->
							<option value=""></option>
							<option value="debt_date">차입일자</option>
							<option value="exp_date">만기일자</option>
							<option value="insert_date">등록일자</option>
							<option value="debt_amount">차입금액</option>
						</select>
					</div>
					<div>
						<div class="div-float-right">
							<div class="chkbox-list">
								<label>삭제포함</label>
								<input type="checkbox" name="deleteFlag" value="Y">
							</div>
							<div class="chkbox-list">
								<label>상환완료포함</label>
								<input type="checkbox" name="repayCompleFlag" value="Y">
							</div>
						</div>	
					</div>	
				</section> 
				<hr/>
				<section class="filter-reset">
					<input type="button" class="btn btn-primary btn-small mybtn" value="조회" onclick="search()">
					<input type="button" class="btn btn-default btn-small mybtn" value="초기화" onclick="resetForm()">	
				</section>
			</form>
			<hr/>
			<section id="page-info" class="page-info">
				<div id="pg-total-row" class="pg-total-row">
					<p>총  ${pagination.totalCnt }건</p>
				</div>
				<!-- <div>
					<div class="selectbox-wrapper">
						<label for="pageSize">페이지내 건수</label>
						<select id="pageSize" name="pageSize">
							<option value="5" selected="selected">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
						</select>
					</div>
				</div> -->
			</section>
			<!-- PAGE CONTENT ENDS -->
			<!-- list -->
				<div style="overflow: auto;">
				<table id="simple-table" class="table  table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
					<thead>
						<tr>
							<th class="center">단기차입금코드</th>
							<th class="center">단기차입금명</th>
							<th class="center">차입금대분류</th>
							<th class="center">차입금액</th>
							<th class="center">상환방법</th>
							<th class="center">차입일자</th>
							<th class="center">만기일자</th>
							<th class="center">이율</th>
							<th class="center">이자지급방식</th>
							<th class="center">담당자</th>
							<th class="center">담당자전화번호</th>
							<th class="center">은행명</th>
							<th class="center">계좌</th>
						</tr>
					</thead>

					<tbody id="tbody-list">
						<c:forEach items="${list }" var="vo" varStatus="status">
							<tr id="${vo.no }">
								<td class="center">${vo.code }</td>
								<td class="center">${vo.name }</td>
								<td class="center">${vo.majorCode }</td>
								<td class="center">${vo.debtAmount }</td>
								<td class="center">${vo.repayWay }</td>
								<td class="center">${vo.debtDate }</td>
								<td class="center">${vo.expDate }</td>
								<td class="center">${vo.intRate }</td>
								<td class="center">${vo.intPayWay }</td>
								<td class="center">${vo.mgr }</td>
								<td class="center">${vo.mgrCall }</td>
								<td class="center">${vo.bankName }</td>
								<td class="center">${vo.depositNo }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
				<section class="pagination" id="pagination">
					<ul id="pg-list" class="pg-list">
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
						<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="pg">
							<c:choose>
								<c:when test="${pg eq pagination.page }">
									<li class="active" onclick='paging(this)' id="${pg }"><a>${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li onclick='paging(this)' id="${pg }"><a>${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pagination.next }">
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
				</section>
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<script>
$(function() {
	$(".chosen-select").chosen();
	
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
</script>
<script>
$(document).ready(getList());
function convertMajorCode(majorCode){
	var MajorName = "";
	if(majorCode == "008001")
		MajorName = "국내은행";
	else if(majorCode == "008002")
		MajorName = "저축은행";
	else if(majorCode == "008003")
		MajorName = "신용금고";
	else if(majorCode == "008004")
		MajorName = "새마을금고";
	else
		MajorName = "외국계은행";
	return MajorName;
}
function convertRepayWay(repayWay){
	var repayWayName = "";
	
	if(repayWay == "Y")
		repayWayName="연";
	else if(repayWay == "M")
		repayWayName="월";
	else if(repayWay =="E")
		repayWayName="만기";
	
	return repayWayName;
}
function convertIntPayWay(intPayWay){
	var intPayWayName = "";
	
	if(intPayWay == "Y")
		intPayWayName = "연";
	else if(intPayWay == "M")
		intPayWayName = "월";
	else if(intPayWay == "E")
		intPayWayName = "해당없음";
	
	return intPayWayName;
}
function convertIntRate(intRate){
	return intRate + "%";
}
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
//리스트를 받아서 Rendering 하는 함수
function renderingList(list){
	$("#tbody-list > *").remove();
	for(var i=0; i < list.length; ++i){
		$("#tbody-list").append("<tr>" +
				 "<td class='center'>" + list[i].code + "</td>" +
				 "<td class='center'>" + list[i].name + "</td>" +
				 "<td class='center'>" + convertMajorCode(list[i].majorCode) + "</td>" +
				 "<td class='center'>" + comma(list[i].debtAmount) + "</td>" +
				 "<td class='center'>" + convertRepayWay(list[i].repayWay) + "</td>" +
				 "<td class='center'>" + list[i].debtDate + "</td>" + 
				 "<td class='center'>" + list[i].expDate + "</td>" +
				 "<td class='center'>" + convertIntRate(list[i].intRate) + "</td>" +
				 "<td class='center'>" + convertIntPayWay(list[i].intPayWay) + "</td>" +
				 "<td class='center'>" + list[i].mgr + "</td>" +
				 "<td class='center'>" + list[i].mgrCall + "</td>" +
				 "<td class='center'>" + list[i].bankName + "</td>" +
				 "<td class='center'>" + list[i].depositNo + "</td>");
	}
}


//page 번호 Rendering 함수
function renderingPage(pagination){
	console.log("------------------------------------renderingPage() Called ----------------------------------------");
	console.log("startPage : " + pagination.startPage + " endPage : " + pagination.endPage);
	//페이징 리스트 삭제
	$("#pg-list li").remove();
	
	//이전버튼 Rendering
	if(pagination.prev){
		$("#pg-list").append("<li onclick='paging(this)'> id='" + (pagination.endPage + 1) + "'" + 
									"<a><i class='icon-double-angle-left'></i>" +
									"</a>"+
								"</li>");
	}else{
		$("#pg-list").append("<li class='disabled'><a href='#'><i class='icon-double-angle-left'></i></a></li>");
	}
	//페이지 Rendering
	for(var i=pagination.startPage; i<=pagination.endPage ; ++i){
		if(i == pagination.page)
			$("#pg-list").append("<li class='active' onclick='paging(this)' id='" + i + "'><a>" + i + "</a></li>");
		else
			$("#pg-list").append("<li onclick='paging(this)' id='" + i + "'><a>" + i + "</a></li>");
	}
	//다음 버튼 Rendering
	if(pagination.prev){
		$("#pg-list").append("<li onclick='paging(this)'> id='" + (pagination.endPage + 1) + "'" +
										"<a><i class='icon-double-angle-right'></i></a>"+
									"</li>");
	}else{
		$("#pg-list").append("<li class='disabled'><a href='#'><i class='icon-double-angle-right'></i></a></li>");
	}
	
	$("#pg-total-row>*").remove();
	$("#pg-total-row").append("<p>총  " + pagination.totalCnt +"건</p>");
	console.log("------------------------------------renderingPage() End ----------------------------------------");
}
 
 function getList(){
	 search();
 }
 
 //조회 버튼 Click Event Method, 조회 데이터들을 넘겨준다.
 function search(){
	 console.log("---------------------search() Called-------------------------");
	 var searchCondition = $("#filter-area").serialize()
	 console.log("filter-area : " + $("#filter-area").serialize());
	 
	 if($("#filter-area")[0].repayCompleFlag.checked == false)
		 searchCondition += "&repayCompleFlag=N";
	 if($("#filter-area")[0].deleteFlag.checked == false)
		 searchCondition += "&deleteFlag=N";
	 
	 $("#search-condition").val(searchCondition);
	 getListAjax(1);
 }
 
 //정렬 버튼 Click Event Method, 정렬 컬럼을 넘겨준다. 기본페이지 1
 function order(thisObj){
	 console.log("---------------------order() Called-------------------------");
	 $("#order-column").val($(thisObj).val());
	 getListAjax(1);
 }
 
 //page click Event Method, 검색조건에 따른 페이지를 보여준다.
 function paging(thisObj){
	 console.log("---------------------paging() Called-------------------------");
	 getListAjax($(thisObj).attr('id'));
 }
 
 function getListAjax(page) {
	 console.log("---------------------getListAjax() Called-------------------------");
	 var sendData = $("#search-condition").val();
	 
	 console.log("order-column" + $("#order-column").val());
	 sendData += "&orderColumn=" + $("#order-column").val() + "&page=" + page;
	 
	
	 console.log("sendData : " + sendData);
	 $.ajax({
			url : $("#context-path").val() + "/api/" + $("#main-menu-code").val() + "/"  + $("#sub-menu-code").val() + "/getList",
			type : "POST",
			dataType : "json",
			data : sendData,
			success: function(response){
				renderingList(response.data.list);
				renderingPage(response.data.pagination);
			},
			error: function(xhr, error){
				
			}
		 });
	 
	 console.log("---------------------getListAjax() End-------------------------");
 }
 
 //------------------------------------초기화---------------------------------------//
 function resetForm(){
	 var form = $("#filter-area")[0];
	 $("#majorcode").val('').trigger('chosen:updated');
	 form.reset();
 }
</script>
</html>