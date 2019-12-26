<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
	label, h4{display: inline-block}
	
	#filter-area{
		display: grid;
		grid-template-columns: 50% 50%;
		grid-template-rows: 70px 35px;
	}
	
	.filter-top{
		grid-column: 1 / 3;
		grid-row: 1;
		
		display: grid;
	}
	
	.input-area-wrapper{
		display: grid;
		grid-template-columns: repeat(4, 24.6%);
		gap: 10px;
		
		align-content: center;
		margin: auto 0;
	}
	
	.input-area{grid-column: auto;}
	.input-area:not(:first-child):not(:last-child){
		margin: 0 auto;
	}
	
	.input-area-last{ float: right; }
	.input-area>*, .input-area>input, .input-area-last>*, .input-area-last>input { margin: auto 0;}
	
	.input-area-radio{
		display: grid;
		grid-template-columns: 100px 50px 50px 80px;
	}
	.radio-label{
		margin-right: 5px;
	}
	.filter-left{
		grid-column: 1;
		grid-row: 2;
	}
	
	.filter-left>*{
		margin: auto 0;
	}	
	.filter-right{
		grid-column: 2;
		grid-row: 2;
		
	}
	
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
 .pg-list{grid-column: 2;}
 .pg-total-row{grid-column: 3}
 .pg-total-row>h5{float:right; margin:0}

.label-name{
	font-size: 14px;
	margin-right: 3px;
}
</style>
</head>
<body class="skin-3">
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }">
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode}">
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }">
<input type="hidden" id="order-column">		<!-- page값을 저장 -->
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">단기차입금현황조회</h1>
				<a class="btn btn-link pull-right" href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list"><i class="icon-plus-sign bigger-120 green"></i> 팀 추가</a>
			</div><!-- /.page-header -->
			<!-- PAGE CONTENT BEGINS -->
			<form id="filter-area" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search">
				<section class="filter-top">
					<div class="input-area-wrapper">
						<div class="input-area">
							<label for="debtDate"><label class="label-name">차입일자</label></label> 
							<input type="date" id="debtDate" name="debtDate">
						</div>
						<div class="input-area">
							<label for="expDate"><label class="label-name">만기일자</label></label> 
							<input type="date" id="expDate" name="expDate">
						</div>
						<div class="input-area input-area-radio">
							<label class="label-name">이자지급방식</label>
							<div class="radio-input"><label class="radio-label label-name">년</label><input type="radio" name="intPayWay" value="Y"></div>
							<div class="radio-input"><label class="radio-label label-name">월</label><input type="radio" name="intPayWay" value="M"></div>
							<div class="radio-input"><label class="radio-label label-name">해당없음</label><input type="radio" name="intPayWay" value="E"></div>
						</div>
						<div class="input-area">
							<div class="input-area-last">
								<label for="bankName"><label class="label-name">은행명</label></label> 
								<input type="text" name="bankName" id="bankName">
								<input type="button" value="조회" onclick="search()">
							</div>
						</div>
					</div> <!-- input-area-wrapper end -->	</section> <!-- filter-top end -->
				<section class="filter-left">
					<label class="label-name">정렬</label>
					<select name="orderColumn" class="order-list" onchange="order(this)">	<!-- id를 통해서 정렬 컬럼을 파악한다. -->
						<option value="debt_date">차입일자</option>
						<option value="exp_date">만기일자</option>
						<option value="insert_date">등록일자</option>
						<option value="debt_amount">차입금액</option>
					</select>
				</section> <!-- filter-left end -->
				<section class="filter-right">
					<div class="chkbox-list-area">
						<div class="chkbox-list">
							<label>삭제포함</label>
							<input type="checkbox" name="deleteFlag" value="Y">
						</div>
						<div class="chkbox-list">
							<label>상환완료포함</label>
							<input type="checkbox" name="repayCompleFlag" value="Y">
						</div>
						<div class="selectbox-wrapper">
							<label for="pageSize">페이지내 건수</label>
							<select id="pageSize" name="pageSize">
								<option value="5" selected="selected">5</option>
								<option value="10">10</option>
								<option value="15">15</option>
							</select>
						</div>
					</div>
				</section> <!-- filter-right end -->
			</form>
			<!-- PAGE CONTENT ENDS -->
			<!-- list -->
				<table id="simple-table" class="table  table-bordered table-hover">
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
							<th class="center">은행코드</th>
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
								<td class="center">${vo.bankCode }</td>
								<td class="center">${vo.depositNo }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
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
					<section id="pg-total-row" class="pg-total-row">
						<h5>총  ${pagination.totalCnt }건</h5>
					</section>
				</section>
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
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
//리스트를 받아서 Rendering 하는 함수
function renderingList(list){
	$("#tbody-list > *").remove();
	for(var i=0; i < list.length; ++i){
		$("#tbody-list").append("<tr>" +
				 "<td class='center'>" + list[i].code + "</td>" +
				 "<td class='center'>" + list[i].name + "</td>" +
				 "<td class='center'>" + convertMajorCode(list[i].majorCode) + "</td>" +
				 "<td class='center'>" + list[i].debtAmount + "</td>" +
				 "<td class='center'>" + convertRepayWay(list[i].repayWay) + "</td>" +
				 "<td class='center'>" + list[i].debtDate + "</td>" + 
				 "<td class='center'>" + list[i].expDate + "</td>" +
				 "<td class='center'>" + convertIntRate(list[i].intRate) + "</td>" +
				 "<td class='center'>" + convertIntPayWay(list[i].intPayWay) + "</td>" +
				 "<td class='center'>" + list[i].mgr + "</td>" +
				 "<td class='center'>" + list[i].mgrCall + "</td>" +
				 "<td class='center'>" + list[i].bankCode + "</td>" +
				 "<td class='center'>" + list[i].depositNo + "</td>");
	}
}


//page 번호 Rendering 함수
function renderingPage(pagination){
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
	$("#pg-total-row").append("<h5>총  " + pagination.totalCnt +"건</h5>")
}
 
 //조회 버튼 Click Event Method, 조회 데이터들을 넘겨준다.
 function search(){
	 console.log("search call");
	 ajaxProcessing(1);
 }
 
 //정렬 버튼 Click Event Method, 정렬 컬럼을 넘겨준다. 기본페이지 1
 function order(thisObj){
	 console.log("order call");
	 $("#order-column").val($(thisObj).val());
	 ajaxProcessing(1);
 }
 
 //page click Event Method, 검색조건에 따른 페이지를 보여준다.
 function paging(thisObj){
	 ajaxProcessing($(thisObj).attr('id'));
 }
 
 function ajaxProcessing(page) {
	 var sendData = $("#filter-area").serialize();
	 
	 var orderColumn = $("#order-column").val();	
	 sendData += "&orderColumn=" + orderColumn + "&page=" + page;
	
	 if($("#filter-area")[0].repayCompleFlag.checked == false)
		 sendData += "&repayCompleFlag=N";
	 if($("#filter-area")[0].deleteFlag.checked == false)
		 sendData += "&deleteFlag=N";
	 
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
 }
</script>
</html>