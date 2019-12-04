<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/daterangepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />



<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
tr td:first-child {
	padding-right: 10px;
}

.radio {
	float: left;
	width: 18%;
}

.search-input-width-first {
	width: 130px;
}

.search-input-width-second {
	width: 235px;
}

.debt-name-input {
	width: 420px;
}

.mgr-input {
	width: 90px;
	display: inline;
}

.mgr-number-input-h4 {
	display: inline;
	margin-left: 30px;
	margin-right: 20px;
}

.mgr-call-input {
	width: 150px;
	display: inline;
	}
	
.mybtn{float:right;margin-right:20px;}
</style>
</head>
<body class="skin-3">
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode }"/>
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }"/>
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">

			<div class="page-header position-relative">
				<h1 class="pull-left">단기차입금관리</h1>
			</div>
			
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="input-form" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">
				<input type="hidden" name="no"/>
				<div class="container-fluid">
					<!-- Example row of columns -->
					<div class="row">
						<div class="span8">
							<table>
								<tr>
									<td><h4>단기차입금코드</h4></td>
									<td>
										<input type="text" id="code" name="code" placeholder="ex) P191128001 (P+년+월+일+번호)" />
									</td>
								</tr>
								<tr >
									<td><h4>단기차입금명</h4></td>
									<td>
										<input type="text" id="name" name="name"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금액</h4></td>
									<td><input type="text" id="debtAmount" name="debtAmount" /></td>
								</tr>
								<tr>
									<td style="width:170px;"><h4>차입일자 ~ 만기일자</h4></td>
									<td>
				                        <div class="row-fluid input-prepend">
				                           <input type="text" name="debtExpDate" id="debtExpDate"/>
				                           <span class="add-on">
				                              <i class="icon-calendar"></i>
				                           </span>
				                           </div>
									</td>
								</tr>
								<tr>
									<td><h4>이자지급방식</h4></td>
									<td>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="Y"/>
												<span class="lbl">년</span>
											</label>
										</div>
										<div class="radio">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="M"/>
												<span class="lbl">월</span>
											</label>
										</div>
										<div class="radio" style="width:15%;">
											<label>
												<input name="intPayWay" type="radio" class="ace" value="E"/>
												<span class="lbl">해당없음</span>
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td><h4>은행코드</h4></td>
									<td>
										<input type="text" class="search-input-width-first" name="bankCode" id="bankCode"/>
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
										<input type="text" class="search-input-width-second" name="bankName" disabled="disabled"/>
									</td>
								</tr>
							</table>
						</div>
						<div class="span8">
							<table>
								<tr>
									<td><h4>회계연도</h4></td>
									<td>
										<input type="number" min="1900" max="2099" step="1" value="2019" id="form-field-1" name="financialYear" placeholder="회계연도"/>
									</td>
								</tr>
								<tr>
									<td><h4>차입금대분류</h4></td>
									<td>
										<select class="chosen-select form-control" name="majorCode" id="majorCode" data-placeholder="차입금대분류">
											<option value=""></option>
											<option value="008001">국내은행</option>
											<option value="008002">저축은행</option>
											<option value="008003">신용금고</option>
											<option value="008004">새마을금고</option>
											<option value="008005">외국계은행</option>
											<option value="008006">증권</option>
										</select>
									</td>
								</tr>
								<tr>
								<td><h4>상환방법</h4></td>
									<td>
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace"  value="Y" />
													<span class="lbl">년</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace"  value="M"/>
													<span class="lbl">월</span>
												</label>
											</div>
											<div class="radio">
												<label>
													<input name="repayWay" type="radio" class="ace"  value="E"/>
													<span class="lbl">만기</span>
												</label>
											</div>
									</td>
									</tr>
								<tr>
									<td><h4>이율</h4></td>
									<td>
										<input type="text" name="intRate" id="intRate" placeholder="(%)"/>
									</td>
								</tr>
								<tr>
									<td><h4>담당자</h4></td>
									<td>
										<input type="text" class="mgr-input" name="mgr" id="mgr"/>
										<h4 class="mgr-number-input-h4">담당자전화번호</h4>
										<input type="text" class="mgr-call-input" name="mgrCall" id="mgrCall"/>
									</td>
								</tr>
								<tr>
									<td><h4>계좌</h4></td>
									<td>
										<input type="text" class="search-input-width-first" name="depositNo" id="depositNo"/>
										<span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
										<input type="text" class="search-input-width-second" name="bankName" disabled="disabled"/>
									</td>
								</tr>
							</table>	
						</div>

					</div>
				</div>
				<hr>
				<div>
					<button type="reset" class="btn btn-success btn-small mybtn">초기화</button>
					&nbsp;
					<button type="submit" class="btn btn-pink btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/repayInsert">상환</button>
					&nbsp;
					<button type="submit" class="btn btn-info btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search">조회</button>
					&nbsp;
					<button type="button" class="btn btn-danger btn-small mybtn" onclick="deleteChecked()">삭제</button>
					&nbsp;
					<button type="submit" class="btn btn-warning btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
					&nbsp;
					<button type="submit" class="btn btn-primary btn-small mybtn" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/insert">입력</button>
				</div>
				<hr>
			</form>					
			<!-- PAGE CONTENT ENDS -->
			
			<!-- list -->
				<table  class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" id="chkbox-select-all"/>
									<span class="lbl"></span>
								</label>
							</th>
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
								<tr onclick="selectRow(this)" id="${vo.no }">
									<form id="form${vo.no}">
										<td class="center"><label class="pos-rel"> 
											<input type="checkbox" name="no" value="${vo.no }" class="ace" /> 
											<span class="lbl"></span>
											</label>
										</td>
										<td class="center"><input type="hidden" name="code" value="${vo.code }">${vo.code }</td>
										<td class="center"><input type="hidden" name="name" value="${vo.name }">${vo.name }</td>
										<td class="center"><input type="hidden" name="majorCode" value="${vo.majorCode }">${vo.majorCode }</td>
										<td class="center"><input type="hidden" name="debtAmount" value="${vo.debtAmount }">${vo.debtAmount }</td>
										<td class="center"><input type="hidden" name="repayWay" value="${vo.repayWay }">${vo.repayWay }</td>
										<td class="center"><input type="hidden" name="debtDate" value="${vo.debtDate }">${vo.debtDate }</td> 
										<td class="center"><input type="hidden" name="expDate" value="${vo.expDate }">${vo.expDate }</td>
										<td class="center"><input type="hidden" name="intRate" value="${vo.intRate }">${vo.intRate }</td>
										<td class="center"><input type="hidden" name="intPayWay" value="${vo.intPayWay }">${vo.intPayWay }</td>
										<td class="center"><input type="hidden" name="mgr" value="${vo.mgr }">${vo.mgr }</td>
										<td class="center"><input type="hidden" name="mgrCall" value="${vo.mgrCall }">${vo.mgrCall }</td>
										<td class="center"><input type="hidden" name="bankCode" value="${vo.bankCode }">${vo.bankCode }</td>
										<td class="center"><input type="hidden" name="depositNo" value="${vo.depositNo }">${vo.depositNo }</td>
									</form>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script>
$(function() {
	//1.Range Picker
	$(".chosen-select").chosen();
	//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
	$('input[name=debtExpDate]').daterangepicker({
		'applyClass' : 'btn-sm btn-success',
		'cancelClass' : 'btn-sm btn-default',
		format : 'YYYY-MM-DD',
		locale: {
			applyLabel: 'Apply',
			cancelLabel: 'Cancel',
		}
	})
	.next().on(ace.click_event, function(){
		$(this).next().focus();
	});
	
	//Checkbox All Check
	$("#chkbox-select-all").click(function(){
		$('input[type=checkbox]').prop('checked', this.checked);	//All Checkbox 버튼의 check여부에 따라 바뀐다.
	});
});

</script>
<script>
function selectRow(thisTr){
	var dataForm = $("#form" + $(thisTr).attr('id'))[0];
	var inputForm = $("#input-form")[0];
	
	inputForm.no.value = dataForm.no.value;
	inputForm.code.value = dataForm.code.value;
	inputForm.name.value = dataForm.name.value;
	inputForm.debtAmount.value = dataForm.debtAmount.value;
	inputForm.debtExpDate.value = dataForm.debtDate.value + " ~ " + dataForm.expDate.value;	//없는걸 찾으면 error가 발생함. 밑에줄도 실행이안됨.
	$(inputForm).find("input[name='intPayWay']").each(function(i, e){
		if($(this).val() == dataForm.intPayWay.value){
			$(this).attr("checked", true);
		}
	});	
	inputForm.bankCode.value = dataForm.bankCode.value;		//bank name도 채워야함
	
	var options = inputForm.majorCode.options;					//SelectBox Options
	for(var i=0 ; i < options.length; ++i){
		if(options[i].value == dataForm.majorCode.value){
			options[i].selected = "selected";
			$("#majorCode_chosen").find("span")[0].innerHTML = options[i].innerHTML;
		}
	}
	
	$(inputForm).find("input[name='repayWay']").each(function(i, e){
		if($(this).val() == dataForm.repayWay.value){
			$(this).attr("checked", true);
		}
			
	});		
	inputForm.intRate.value = dataForm.intRate.value;
	inputForm.mgr.value = dataForm.mgr.value;
	inputForm.mgrCall.value = dataForm.mgrCall.value;
	inputForm.depositNo.value = dataForm.depositNo.value;		//bank name도 채워야함
	//$("#bankName").val(dataForm.elements[].value);
}

function deleteChecked(){
	var sendData = [];
	
	//넘어갈 no 배열을 생성한다.
	var checkedList = $("#tbody-list input[type=checkbox]:checked");
	checkedList.each(function(i, e){
		sendData.push($(this).val());
	});
	
	//no 배열을 넘겨준다.
	$.ajax({
		url : $("#context-path").val()  + "/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + "/deleteChecked",
		type : "POST",
		dataType : "json",
		data : {"sendData" : sendData},
		success: function(response){
			checkedList.each(function(i, e){
				$("#" + $(this).val()).remove();
				
			})
		},
		error : function(xhr, error){
		}
	})
}

</script>
</body>
</html>