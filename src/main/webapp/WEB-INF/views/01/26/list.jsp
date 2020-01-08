<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.form-horizontal .control-label {
    text-align: left
}
html,body{
             	height:100%;
      	}
      	
      	.main-container{
         	height:calc(100% - 45px);
         	overflow-x: hidden;
      	}
      
      	.main-content{
         	overflow:auto;
      	}
      	
      	.page-content{
         	min-width:1280px;
      	}

	@media screen and (max-width: 920px) {
	         	.main-container{
            	height:calc(100% - 84px);
         		}
	 }
</style>

<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>

<link href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<script	src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>

<script>
	$(function() {
		
		$(".chosen-select").chosen();
		
		$.fn.datepicker.dates['ko'] = {
			days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
					"10월", "11월", "12월" ],
			monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
					"9월", "10월", "11월", "12월" ],
			today : "Today",
			clear : "Clear",
			format : "yyyy-mm-dd",
			titleFormat : "yyyy MM", /* Leverages same syntax as 'format' */
			weekStart : 0
		};

		$('#cl-ym-date-picker').datepicker({
			maxViewMode : 4,
			minViewMode : 1,
			language : 'ko'
		}).next().on(ace.click_event, function() {
			$(this).prev().focus();
		});

		$('.cl-date-picker').datepicker({
			language : 'ko'
		}).next().on(ace.click_event, function() {
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
					<h1 class="pull-left">계좌 현황조회</h1>
				</div>


		<div class="row-fluid"> <!-- 검색조건 start -->
					<form class="form-horizontal" id="input-form" name="input-form"	method="post">
						조회 기간 :&nbsp;
						<div class="input-append">
							<input type="text" id="datepicker1" name="makeDate" class="cl-date-picker"  style="width:100px"/>
							
							<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>
						
						&nbsp; &nbsp; ~ &nbsp;
						<div class="input-append">
							<input type="text" id="datepicker2" name="enDate" class="cl-date-picker" style="width:100px"/>
								<span class="add-on">
								<i class="icon-calendar"></i>
							</span>
						</div>						
						
						&nbsp; &nbsp;&nbsp; &nbsp;계좌시작번호 :&nbsp; 
						<input type="text" id="no" name="depositNo" placeholder="시작번호" size=4 style="width:150px" style="width:100px;"/>
						
						&nbsp; &nbsp;&nbsp; &nbsp;삭제여부 : &nbsp;
						
						<select class="chosen-select"
							id="deleteFlag" name="deleteFlag" 
							data-placeholder="선택" style="width:70px;">
							<option value="N">N</option>
							<option value="Y">Y</option>
						</select>
						
						&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-small btn-info" type="submit" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }">조회</button>
					</form>
					
					<div class="hr hr-18 dotted"></div>
				
				<div class="row-fluid">
						<div class="span12" style="overflow:auto;">

							<table id="simple-table-1" class="table table-striped table-bordered table-hover" style="min-width:2000px;margin-bottom:0;width:auto">
								<thead>
									<tr>
										<th>계좌번호</th>
										<th>은행번호</th>
										<th>예금주</th>
										<th>개설일자</th>
										<th>만기일자</th>
										<th>잔액</th>
										<th>예금한도(만원)</th>
										<th>이율(%)</th>
										<th>은행</th>
										<th>개설지점</th>
										<th>담당자</th>
										<th>은행전화번호</th>
										<th>입력담당자</th>
										<th>입력일자</th>
										<th>수정담당자</th>
										<th>수정일자</th>
									</tr>
								</thead>
								
								<tbody class="origin-tbody">

									<c:forEach items='${dataResult.datas }' var='vo' varStatus='status'>
										<tr>
											<td>${vo.depositNo }</td>
											<td>${vo.bankCode }</td>
											<td>${vo.depositHost }</td>
											<td>${vo.makeDate}</td>
											<td>${vo.enDate}</td>
											<td>${vo.balance}</td>
											<td>${vo.depositLimit }</td>
											<td>${vo.profit}</td>
											<td>${vo.bankName }</td>
											<td>${vo.bankLocation }</td>
											<td>${vo.banker }</td>
											<td>${vo.bankPhoneCall }</td>
											<td>${vo.insertUserId }</td>
											<td>${vo.insertDay }</td>
											<td>${vo.updateUserId }</td>
											<td>${vo.updateDay }</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
					</div>
			<div class="pagination">
				<ul>
					<c:choose>
					<c:when test="${dataResult.pagination.prev }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
					</c:otherwise>
					</c:choose>
					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
					<c:choose>
					<c:when test="${pg eq dataResult.pagination.page }">
		
						<li class="active"><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }">${pg }</a></li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${dataResult.pagination.next }">
						<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
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
</body>
</html>