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
		grid-template-columns: 845px 845px;
		grid-template-rows: 70px 35px;
	}
	
	.filter-top{
		grid-column: 1 / 3;
		grid-row: 1;
		
		display: grid;
	}
	
	.input-area-wrapper{
		display: grid;
		grid-template-columns: repeat(4, 415px);
		gap: 10px;
		
		align-content: center;
		margin: auto 0;
	}
	
	.input-area{
		grid-column: auto;
	}
	
	.input-area-last{ float: right; }
	.input-area>*, .input-area>input, .input-area-last>*, .input-area-last>input { margin: auto 0;}
	
	.input-area-radio{
		display: grid;
		grid-template-columns: 120px 50px 50px 80px;
	}
	.radio-label{
		margin-right: 5px;
	}
	.filter-left{
		grid-column: 1;
		grid-row: 2;
		
		display: grid;
	}
	
	.filter-right{
		grid-column: 2;
		grid-row: 2;
		
		display: grid;
	}
	
	.order-list{
		height: 80px;
		margin: auto 0;
		
		display: grid;
		grid-template-columns: repeat(4,80px);
		gap: 10px;
	}
	
	.order-list>li{
		display: inline-block;
		float: left;
	}
	
	.chkbox-list-area{
		margin: auto 0;		/** **/
	}
	
	.chkbox-list{
		float: right;
		margin-left: 10px;
	}

.prod-list-opts {
	padding: 10px 15px 9px 11px;
	position: relative;
}

.prod-list-opts .order-list {
    margin: 3px 0 0;
    padding: 0;
    overflow: hidden;
}


.prod-list-opts li {
    list-style: none;
    float: left;
}

.checkbox {
	float: left;
}
</style>
</head>
<body class="skin-3">
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }">
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode}">
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }">
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
							<label for="debtDate"><h4>차입일자</h4></label> 
							<input type="date" id="debtDate" name="debtDate">
						</div>
						<div class="input-area">
							<label for="expDate"><h4>만기일자</h4></label> 
							<input type="date" id="expDate" name="expDate">
						</div>
						<div class="input-area input-area-radio">
							<label><h4>이자지급방식</h4></label> 
							<div class="radio-input"><label class="radio-label">년</label><input type="radio" name="intPayWay" value="Y"></div>
							<div class="radio-input"><label class="radio-label">월</label><input type="radio" name="intPayWay" value="M"></div>
							<div class="radio-input"><label class="radio-label">해당없음</label><input type="radio" name="intPayWay" value="E"></div>
						</div>
						<div class="input-area">
							<div class="input-area-last">
								<label for="bankName"><h4>은행명</h4></label> 
								<input type="text" name="bankName" id="bankName">
								<input type="button" value="조회" onclick="search()">
							</div>
						</div>
					</div> <!-- input-area-wrapper end -->	</section> <!-- filter-top end -->
				<section class="filter-left">
					<ul class="order-list">
						<li><h4 class="list-order" id="debt_date" onclick="order(this)">차입일자</h4></button></li>
						<li><h4 class="list-order" id="exp_date" onclick="order(this)" >만기일자</h4></button></li>
						<li><h4 class="list-order" id="insert_date" onclick="order(this)">등록일자</h4></button></li>
						<li><h4 class="list-order" id="debt_amount" onclick="order(this)">차입금액</h4></button></li>
					</ul>
				</section> <!-- filter-left end -->
				<section class="filter-right">
					<div class="chkbox-list-area">
						<div class="chkbox-list">
							<label>삭제포함</label>
							<input type="checkbox" name="deleteFlag">
						</div>
						<div class="chkbox-list">
							<label>상환완료포함</label>
							<input type="checkbox" name="repayComplFlag">
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
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
 function search(){
	 var sendData = $("#filter-area").serialize();
	 $.ajax({
		url : $("#context-path").val() + "/api/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/search",
		type : "POST",
		dataType : "json",
		data : sendData,
		success: function(response){
			$("#tbody-list > *").remove();
			for(var i=0; i < response.data.length; ++i){
				$("#tbody-list").append("<tr>" +
						"<td class='center'>" + response.data[i].code + "</td>" +
						 "<td class='center'>" + response.data[i].name + "</td>" +
						 "<td class='center'>" + response.data[i].majorCode + "</td>" +
						 "<td class='center'>" + response.data[i].debtAmount + "</td>" +
						 "<td class='center'>" + response.data[i].repayWay + "</td>" +
						 "<td class='center'>" + response.data[i].debtDate + "</td>" + 
						 "<td class='center'>" + response.data[i].expDate + "</td>" +
						 "<td class='center'>" + response.data[i].intRate + "</td>" +
						 "<td class='center'>" + response.data[i].intPayWay + "</td>" +
						 "<td class='center'>" + response.data[i].mgr + "</td>" +
						 "<td class='center'>" + response.data[i].mgrCall + "</td>" +
						 "<td class='center'>" + response.data[i].bankCode + "</td>" +
						 "<td class='center'>" + response.data[i].depositNo + "</td>");
			}
		}
	 });
 }
 
 function order(thisObj){
	 var sendData = $("#filter-area").serialize();
	 var orderColumn = $(thisObj).attr('id'); 
	 console.log("orderColumn : " + orderColumn);
	 $.ajax({
		url : $("#context-path").val() + "/api/" + $("#main-menu-code").val()  + "/" + $("#sub-menu-code").val() + "/order",
		type: "POST",
		dataType : "json",
		data : {"sendData" : sendData, "orderColumn" : orderColumn},
		success : function(response){
			$("#tbody-list > *").remove();
			for(var i=0; i < response.data.length; ++i){
				$("#tbody-list").append("<tr>" +
						"<td class='center'>" + response.data[i].code + "</td>" +
						 "<td class='center'>" + response.data[i].name + "</td>" +
						 "<td class='center'>" + response.data[i].majorCode + "</td>" +
						 "<td class='center'>" + response.data[i].debtAmount + "</td>" +
						 "<td class='center'>" + response.data[i].repayWay + "</td>" +
						 "<td class='center'>" + response.data[i].debtDate + "</td>" + 
						 "<td class='center'>" + response.data[i].expDate + "</td>" +
						 "<td class='center'>" + response.data[i].intRate + "</td>" +
						 "<td class='center'>" + response.data[i].intPayWay + "</td>" +
						 "<td class='center'>" + response.data[i].mgr + "</td>" +
						 "<td class='center'>" + response.data[i].mgrCall + "</td>" +
						 "<td class='center'>" + response.data[i].bankCode + "</td>" +
						 "<td class='center'>" + response.data[i].depositNo + "</td>");
		}},
		error : function(xhr, error){
			
		}
	 });
 }
</script>
</html>