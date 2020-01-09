<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />

<c:import url="/WEB-INF/views/common/head.jsp" />

<style>
.chosen-search {
	display: none;
}

input, textarea, .uneditable-input {
	width: 100px;
}

html, body {
	height: 100%;
	overflow-x: hidden;
}

.main-container {
	height: calc(100% - 45px);
	overflow-x: hidden;
}

.main-content {
	overflow: auto;
}

.page-content {
	min-width: 1280px;
}

@media screen and (max-width: 920px) {
	.main-container {
		height: calc(100% - 84px);
	}
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
					<h1 class="pull-left">카드 현황조회</h1>
				</div>


				<div class="row-fluid">
					<form id="input-form" class="form-horizontal" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list" method="post">
						입력 기간 : 

						<div class="input-append">
							<input type="text" id="datepicker" class="cl-date-picker" name="inputperiodStart" value="${param.inputperiodStart }" readonly/> <span
								class="add-on" > <i class="icon-calendar"></i>
							</span>
						</div>
						&nbsp; ~ &nbsp;
						
						<div class="input-append">
							<input type="text" id="datepicker2" class="cl-date-picker" name="inputperiodEnd" value="${param.inputperiodEnd }" readonly/> <span
								class="add-on" > <i class="icon-calendar"></i>
							</span>
						</div>

							&nbsp; &nbsp; &nbsp;
						카드시작번호 : <input type="text" id="cardStartNo" placeholder="시작번호" name = "cardStartNo" value="${param.cardStartNo }" maxlength=4 onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"/>
						&nbsp; &nbsp; &nbsp; 
						카드종료번호 : <input type="text" id="cardEndNo" placeholder="종료번호" name = "cardEndNo" value="${param.cardEndNo }"  maxlength=4 onkeypress="return isNumberKey(event)" onkeyup="return delHangle(event)"/> 
						
						
							&nbsp; &nbsp; &nbsp;
						삭제여부 : 
						<select class="chosen-select" id="deleteFlag" name="deleteFlag" data-placeholder="상위메뉴 선택" style="width:80px">
							<option value="N">N</option>					
							<option value="Y">Y</option>
						</select>
						
						<button type="submit" id="btn-submit" class="btn btn-small btn-info" >조회</button>
						&nbsp;
						<button class="btn btn-default btn-small" id="btn-reset">초기화</button>
					</form>
					<div class="hr hr-18 dotted"></div>
					<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 카드 ${dataResult.pagination.totalCnt } 건</p>
				</div>



				<div class="row-fluid">
					<div class="span12" style="overflow: auto;">
						<table id="sample-table-1"
							class="table table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
							<thead>
								<tr>
									<th>카드번호</th>
									<th>유효기간</th>
									<th>CVC</th>
									<th>사용자</th>
									<th>카드발급자</th>
									<th>계좌번호</th>
									<th>예금주</th>
									<th>비밀번호</th>
									<th>은행코드</th>
									<th>은행명</th>
									<th>카드사</th>
									<th>카드한도(만원)</th>
									<th>교통카드 유무</th>
									<th>해외사용 여부</th>
									<th>입력일자</th>
									<th>입력담당자</th>
									<th>수정일자</th>
									<th>수정담당자</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items='${dataResult.datas }' var='vo' varStatus='status'>
									<tr>
										<td>${vo.cardNo }</td>
										<td>${vo.validity }</td>
										<td>${vo.cvc}</td>
										<td>${vo.user}</td>
										<td>${vo.issuer}</td>
										<td>${vo.depositNo }</td>
										<td>${vo.depositHost}</td>
										<td>${vo.password }</td>
										<td>${vo.bankCode }</td>
										<td>${vo.bankName }</td>
										<td>${vo.company }</td>
										<td style="text-align: right;"><fmt:formatNumber value="${vo.limitation}" pattern="#,###" /></td>
										<td>${vo.transportation }</td>
										<td>${vo.abroad }</td>
										<td>${vo.insertDay }</td>
										<td>${vo.insertUserId }</td>
										<td>${vo.updateDay }</td>
										<td>${vo.updateUserId }</td>

									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<!-- /span -->
				</div>

				<div class="pagination" id = "pagination">
					<c:if test="${dataResult.pagination != null && dataResult.pagination.totalCnt != 0 }">
						<ul>
							<c:choose>
								<c:when test="${dataResult.pagination.prev }">
									<li><a
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.startPage - 1 }
										&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
										&deleteFlag=${param.deleteFlag}">
											<i class="icon-double-angle-left"></i>
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a><i
											class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${dataResult.pagination.startPage }"
								end="${dataResult.pagination.endPage }" var="pg">
								<c:choose>
									<c:when test="${pg eq dataResult.pagination.page }">
										<li class="active"><a
											href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg }
											&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
										&deleteFlag=${param.deleteFlag}">${pg }</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${pg}
											&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
										&deleteFlag=${param.deleteFlag}">${pg }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
	
							<c:choose>
								<c:when test="${dataResult.pagination.next }">
									<li><a
										href="${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }?page=${dataResult.pagination.endPage + 1 }
										&inputperiodStart=${param.inputperiodStart}&inputperiodEnd=${param.inputperiodEnd}&cardStartNo=${param.cardStartNo}&cardEndNo=${param.cardEndNo}
										&deleteFlag=${param.deleteFlag}"><i
											class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a><i
											class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:if>
				</div>



			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />

	<!-- Validation Modal Start -->
	<div id="staticBackdrop" class="hide">
		<br>
		<pre id="staticBackdropBody" class="bolder grey"
			style="text-align: center; background-color: white; border-color: white">
		</pre>
	</div>
	<!-- Validation Modal End -->


</body>
<link
	href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script
	src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>

<script
	src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>



<script>

var deleteFlag = "${param.deleteFlag}";
if(deleteFlag!=''){
	$('#deleteFlag').val(deleteFlag).trigger('chosen:updated'); 
}

//숫자와 delete 키만 동작하도록한다.
function isNumberKey(evt){
  var charCode = (evt.which) ? evt.which : event.keyCode;
  var _value = event.srcElement.value;

  if((event.keyCode < 48) || (event.keyCode > 57)){//1~0
      if(event.keyCode != 46){//delete
           return false;
      } 
   }
  return true;
  
}

//한글입력 방지
function delHangle(evt){
  var objTarger = evt.srcElement || evt.target;
  var val = event.srcElement.value;
  if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(val)){
      objTarger.value = null;
  	}
  }
  
	$(function() {
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
		
		
		$(".chosen-select").chosen();
		  
		
		var validationMessage ='';
		var errortitle='';
		var errorfield ='';
		var nochecked = false;
		
		function openErrorModal(title, message,errorfield) {
			$('#staticBackdropLabel').html(title);
			$('#staticBackdropBody').text(message);
			
			console.log($('#staticBackdropLabel').text());
			console.log($('#staticBackdropBody').text());
		
			$( "#staticBackdrop" ).dialog({
				resizable: false,
				modal: true,
				title: title,
				buttons: [
					{
						text: "OK",
						"class" : "btn btn-danger btn-mini",
						click: function() {
							$(this).dialog('close');
				          	$('#staticBackdropBody').text('');
							$(errorfield).focus();
						}
					}
				]
			});
		
			$("#staticBackdrop").dialog('open');//모달을 띄운다
		}
		
		function SearchValidation(){
			let datepicker1 =$('#datepicker').val();//시작날짜
			let datepicker2 =$('#datepicker2').val();//종료날짜
			
			
			//datepicker 관련 Valid
			if(datepicker1 > datepicker2 && datepicker2!=''){
				errortitle = 'DATE_RANGE_ERROR';
				validationMessage = '조회기간 범위 오류입니다.\r\n 종료일을 시작일 이후로 설정해주세요';
				errorfield='#datepicker2';
				return false;
				
			}
		
			return true;
		}
		
		$("#btn-submit").click(function(){
			if(!SearchValidation()){
				openErrorModal(errortitle,validationMessage,errorfield);
				return false;
			}
			return true;
		});
		
		$("#btn-reset").click(function(){
			event.preventDefault();
			$("input[id=datepicker]").val("");
			$("input[id=datepicker2]").val("");
			$("input[id=cardStartNo]").val("");
			$("input[id=cardEndNo]").val("");
			$('#deleteFlag').val("N").trigger('chosen:updated'); 
		});
		
	})
</script>


</html>