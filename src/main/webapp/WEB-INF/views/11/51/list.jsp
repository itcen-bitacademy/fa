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
html,body{height:100%;}
.main-container{height:calc(100% - 45px); overflow-x: hidden;}
.main-content{overflow:auto;}
.page-content{min-width:1280px;}
@media screen and (max-width: 920px) {.main-container{height:calc(100% - 84px);}}

.form-horizontal .control-label {text-align: left;}

.radio {
	float: left;
	width: 13%;
}

.prod-list-opts {
	padding: 10px 15px 9px 20px;
	position: relative;
}

.checkbox {
	float: left;
}

form {
	margin-bottom: 0px;
}

/* table columns  */
.first-column {width:170px; padding-left:20px;}
.second-column {width:400px;}
.third-column {width:120px;}
.fourth-column {width:70px;}
.fifth-column {width:200px;}
.sixth-column {padding-left:10px;}

/* second row */
.span3 {padding-left:150px; padding-top:10px;}

</style>
</head>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">사채현황조회</h1>
			</div><!-- /.page-header -->
				
					<!-- PAGE CONTENT BEGINS -->
					<div>
						<div>
						<form class="form-horizontal" id="myform" method="get" action="">
							<table style="width:100%;">
								<tbody>
								<tr>
									<td class="first-column">
										<label class="control-label">차입일자</label>
									</td>
									<td class="second-column">
				                        <div class="row-fluid input-prepend">
				                           <input class="cl-date-picker" type="text" name="debtDate" id="id-date-picker-1"  data-date-format="yyyy-mm-dd" value="${vo.debtDate }" readonly="readonly" />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                         </div>
									</td>
									<td class="third-column">
										<label class="control-label">이자지급방식</label>
									</td>
									<td>
										<div class="radio">
											<label>
											<c:choose>
											<c:when test='${vo.intPayWay eq "Y"}'>
												<input name="intPayWay" type="radio" class="ace" value="Y" checked="checked"/>
											</c:when>
											<c:otherwise>
												<input name="intPayWay" type="radio" class="ace" value="Y"/>
											</c:otherwise>
											</c:choose>
												<span class="lbl">연</span>
											</label>
										</div>
										<div class="radio">
											<label>
											<c:choose>
											<c:when test='${vo.intPayWay eq "M"}'>
												<input name="intPayWay" type="radio" class="ace" value="M" checked="checked"/>
											</c:when>
											<c:otherwise>
												<input name="intPayWay" type="radio" class="ace" value="M"/>
											</c:otherwise>
											</c:choose>
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio">
											<label>
											<c:choose>
											<c:when test='${vo.intPayWay eq "E"}'>
												<input name="intPayWay" type="radio" class="ace" value="E" checked="checked"/>
											</c:when>
											<c:otherwise>
												<input name="intPayWay" type="radio" class="ace" value="E"/>
											</c:otherwise>
											</c:choose>
												<span class="lbl">만기</span>
											</label>
										</div>
									</td>
									<td class="fourth-column">
										<label class="control-label">은행명</label>
									</td>
									<td class="fifth-column">
										<input type="text" name="bankName" value="${vo.bankName }"/>
									</td>
									<td class="sixth-column">
									</td>
								</tr>
								<tr>
								<td class="first-column">
									<label class="control-label">만기일자</label>
								</td>
									<td class="second-column">
				                        <div class="row-fluid input-prepend">
				                           <input class="cl-date-picker" type="text" name="expDate" id="id-date-picker-1" data-date-format="yyyy-mm-dd" value="${vo.expDate }" readonly="readonly" />
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                         </div>
									</td>
								</tr>
								</tbody>
							</table>	
							<div class="row-fluid">
								<div class="span9">
									<div class="prod-list-opts">
										<label class="control-label" style="padding-right: 12px;">차입금 선택정렬</label>
										<select class="chosen-select form-control" id="majorcode-field-select" data-placeholder="정렬하기 위해 선택해주세요." name="sort" >
											<option value=""></option>
											<option value="d" <c:if test="${sort eq 'd'}"> selected </c:if>>차입일자</option>
											<option value="e" <c:if test="${sort eq 'e'}">selected</c:if>>만기일자</option>
											<option value="i" <c:if test="${sort eq 'i'}">selected</c:if>>등록일자</option>
											<option value="m" <c:if test="${sort eq 'm'}">selected</c:if>>차입금액</option>
										</select>
									</div>
								</div>
								<div class="span3">
									<div class="checkbox">
										<label >
												<c:choose>
												<c:when test='${vo.deleteFlag eq ""}'>
													<input name="deleteFlag" type="checkbox" class="ace" value="" checked="checked"/>
												</c:when>
												<c:otherwise>
													<input name="deleteFlag" type="checkbox" class="ace" value="" />
												</c:otherwise>
												</c:choose>
													<span class="lbl">삭제포함</span>
										</label>
									</div>
									<div class="checkbox">
										<label>	
												<c:choose>
												<c:when test='${vo.repayCompleFlag eq ""}'>
													<input name="repayCompleFlag" type="checkbox" class="ace" value="" checked="checked"/>
												</c:when>
												<c:otherwise>
													<input name="repayCompleFlag" type="checkbox" class="ace" value=""/>
												</c:otherwise>
												</c:choose>
													<span class="lbl">상환완료포함</span>
											</label>
									</div>
								</div>
							</div>
							<hr>
						<div class="row-fluid">
							<button type="button" id="searchbtn" class="btn btn-primary btn-small mybtn">조회</button>
							<button type="button" id="clearbtn" class="btn btn-default btn-small mybtn">초기화</button>
						</div>
					<hr>
							</form>
						</div><!-- /span -->
					</div><!-- /row -->
					<!-- PAGE CONTENT ENDS -->
			
				<!-- list -->
				<p>총 ${contentsCount }건</p>
				<div style="overflow: auto;">
				<table id="simple-table" class="table  table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
					<thead>
						<tr>
							<th class="center">사채코드</th>
							<th class="center">사채명</th>
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
					<tbody>
					<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
						<tr>
							<td class="center">${vo.code}</td>
							<td>${vo.name}</td>
							 <c:choose>
										<c:when test="${vo.majorCode eq '001'}"><td class="center">국내은행</td></c:when>
										<c:when test="${vo.majorCode eq '002'}"><td class="center">저축은행</td></c:when>
										<c:when test="${vo.majorCode eq '003'}"><td class="center">신용금고</td></c:when>
										<c:when test="${vo.majorCode eq '004'}"><td class="center">새마을금고</td></c:when>
										<c:when test="${vo.majorCode eq '005'}"><td class="center">외국계은행</td></c:when>
										<c:otherwise><td class="center">증권</td></c:otherwise>
							</c:choose>	
							<td class="center"><fmt:formatNumber value="${vo.debtAmount}" pattern="#,###" /></td>
							<c:choose>
										<c:when test="${vo.repayWay eq 'Y'}"><td class="center">연</td></c:when>
										<c:when test="${vo.repayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>		
							<td class="center">${vo.debtDate}</td>
							<td class="center">${vo.expDate}</td>
							<td class="center">${vo.intRate}%</td>
							<c:choose>
										<c:when test="${vo.intPayWay eq 'Y'}"><td class="center">연</td></c:when>
										<c:when test="${vo.intPayWay eq 'M'}"><td class="center">월</td></c:when>
										<c:otherwise><td class="center">만기</td></c:otherwise>
							</c:choose>	
							<td class="center">${vo.mgr}</td>
							<td class="center">${vo.mgrCall}</td>
							<td class="center">${vo.bankCode}</td>
							<td class="center">${vo.depositNo}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>

				<!-- 페이징 처리 코드 start -->
				<div class="pagination">
					<ul>
						<c:choose>
							<c:when test="${dataResult.pagination.prev }">
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${dataResult.pagination.startPage - 1 }">
								<i class="icon-double-angle-left"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
							<c:choose>
								<c:when test="${pg eq dataResult.pagination.page }">
									<li class="active"><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${pg }">${pg }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${pg}">${pg }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${dataResult.pagination.next }">
								<li><a href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }${uri}&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- 페이징 처리 코드 end -->
				
			</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
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
		
		$('#searchbtn').click(function(){
			var isIntPayWayCheck=false;
			$('input[name=intPayWay]').each(function(index,	item){
				if($(item).prop('checked') == true){
					isIntPayWayCheck = true;
				}
			});
			if(!isIntPayWayCheck){
				$('input[name=intPayWay]').val('');
			}
			
			$('#myform').attr('action', '${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }');
			$('#myform').attr('method', 'GET');
			$('#myform').submit();
			return;
		});
		
		// 초기화버튼 이벤트 연결
		$('#clearbtn').click(function(){
			$('input[name=debtDate]').val('');
			$('input[name=expDate]').val('');
			
			$('input').not('input[name=intPayWay]').not('input[name=repayWay]').val('');
			    
		    $('input[name=intPayWay]').each(function(index, item){
		    	if($(item).prop('checked') == true){
		    		$(item).prop('checked', false);
		    	}
		    });
		    
		    $('input[name=bankName]').val('');
		    $('#majorcode-field-select').val('').trigger('chosen:updated');
		    
		    $('input[name=deleteFlag]').each(function(index, item){
		    	if($(item).prop('checked') == true){
		    		$(item).prop('checked', false);
		    	}
		    });
		    
		    $('input[name=repayCompleFlag]').each(function(index, item){
		    	if($(item).prop('checked') == true){
		    		$(item).prop('checked', false);
		    	}
		    });
		});
	});
</script>
</body>
</html>