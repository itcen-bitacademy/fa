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
.chosen-search {
	display: none;
}

.search-input-width-first{
	width: .span4;
}

#dialog-message {
	overflow: auto;
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
					<h1 class="pull-left">전표현황조회</h1>
				</div><!-- /.page-header -->
				<form class="form-horizontal" id="input-form"  method="post">
					<div class="row-fluid">
						<div class="span6">
							
								<!-- 전표 조회 영역 -->
								
								<!-- 전표 조회 날짜 -->
								<div class="control-group">
									<label class="control-label" for="form-field-codename" style="text-align:left;width:120px;" >일자</label>
									<div class="controls">
										<div class="row-fluid input-append">
										<input class="span4 date-picker" id="regDate" name="regDate" type="text" data-date-format="yyyy-mm-dd" readonly style="width:168px;" />
											<span class="add-on">
											<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >전표번호</label>
									<div class="controls">
										<input class="span5" type="text" id="no" name="no" placeholder="전표번호" style="width:193px;" />
									</div>
								</div>
								
								<!-- 계정과목  -->
								<div class="control-group">
									<label class="control-label" for="form-field-select-1" style="text-align:left;width:120px;" >계정과목</label>
									<div class="controls">
										<select class="chosen-select" id="accountNo" name="accountNo" data-placeholder="계정과목코드" style="width:193px;">		
											<option value="" data-accountName=""></option>		
											<c:choose>
												<c:when test="${accountNo eq accountNo }">
													<option value="${accountNo}" data-accountName="${accountNo }" selected>${accountNo }</option>
												</c:when>										
											</c:choose>				
											<c:forEach items="${accountList }" var="vo">									
													<option value="${vo.accountNo}" data-accountName="${vo.accountName }" >${vo.accountNo }</option>
											</c:forEach>
										</select> 
										<input type="text" id="accountName" name="accountName" placeholder="계정명칭" value="" style="text-align: center; width: 200px; height: 18px;" disabled />
									</div>
								</div>
								
							</div>
	
						<div class="span6">
							<div class="tabbable">
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >거래처 코드</label>
									<div class="controls">
										
										<div class="input-append">
											
											<a href="#" id="a-customerinfo-dialog"> 
												<input type="text" class="search-input-width-first" id="customerNo" name="customerNo" style="width:153px;"/>
												<span class="add-on">
													<i class="icon-search icon-on-right bigger-110"></i>
												</span>
											</a> 
										
											
										</div> 
										
										<input type="text" id="customerName" name="customerName" placeholder="거래처명" readonly style="width:173px;" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >전표사용목적</label>
									<div class="controls">
										<input class="span8" type="text" id="voucherUse" name="voucherUse" placeholder="전표사용목적" style="width:385px;" />
										<input class="span8" type="hidden" id="insertTeam" name="insertTeam" />
									</div>
								</div>
								
								<!-- 삭제여부  -->
								<div class="control-group">
									<label class="control-label" for="form-field-select-1" style="text-align:left;width:120px;" >삭제여부</label>
									<div class="controls">
										<select class="chosen-select" id="useYn" name="useYn" data-placeholder="삭제여부" style="width:90px;" >		
											<option value="true">N</option>
											<option value="false">Y</option>
										</select> 
									</div>
								</div>
								
								<!-- 거래처 Modal pop-up : start -->
								<div id="dialog-message" title="거래처" hidden="hidden">
									<table id="dialog-message-table">
										<tr>
											<td><label>거래처코드</label> <input type="text"
												id="input-dialog-customerNo" style="width: 100px;" />
												<div class="input-append">
												<a href="#" id="a-dialog-customerNo">
													<span class="add-on">
														<i class="icon-search icon-on-right bigger-110"></i>
													</span>
												</a>
												</div>
											</td>
										</tr>
									</table>
									<!-- 거래처코드 및 거래처명 데이터 리스트 -->
									<table id="modal-customer-table"
										class="table  table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">거래처번호</th>
												<th class="center">거래처명</th>
												<th class="center">은행코드</th>
												<th class="center">은행명</th>
												<th class="center">카드번호</th>
												<th class="center">소유주</th>
												<th class="center">계좌번호</th>
												<th class="center">소유주</th>
											</tr>
										</thead>
										<tbody id="tbody-customerList">
											
										</tbody>
									</table>
								</div>
								<!-- 거래처 Modal pop-up : end -->
							</div>

						</div>

					</div><!-- /.row-fluid -->

			
			<div class="hr hr-18 dotted"></div>
			<!-- buttons -->
			<button class="btn btn-info btn-small" type="submit"   id="btn-read" name="btn-read"
				formaction="${pageContext.request.contextPath}/01/04/read">조회</button>
			<input class="btn btn-default btn btn-small" id="btn-reset" name="btn-reset" type="button" value="취 소" >
			<div class="hr hr-18 dotted"></div>
			</form>
			
			<p class="span6" style="margin:5px 0 0 0;font-size:0.9rem">조회된 전표 ${dataResult.pagination.totalCnt } 건</p>
			
			<!--조회 테이블 영역 -->
			<div class="row-fluid">
				<div class="span12" style="overflow: auto;">
					<table id="simple-table-1"
                     	class="table  table-bordered table-hover" style=" min-width: 2000px; margin-bottom: 0; width: auto;">
						<thead>
							<tr>
								<th class="center">일자</th>
								<th class="center">전표번호</th>
								<th class="center">구분</th>
								<th class="center">계정과목코드</th>
								<th class="center">계정과목명</th>
								<th class="center">차변</th>
								<th class="center">대변</th>
								<th class="center">거래처번호</th>
								<th class="center">거래처</th>
								<th class="center">증빙종류</th>
								<th class="center">증빙코드</th>
								<th class="center">은행코드</th>
								<th class="center">은행명</th>
								<th class="center">카드번호</th>
								<th class="center">계좌번호</th>
								<th class="center">소유자</th>
								<th class="center">사용목적</th>
								<th class="center">관리팀</th>
							</tr>
						</thead>
						
						<tbody id="voucher_list">
							<c:forEach items='${dataResult.datas }' var='voucherVo' varStatus='status'>

								<tr>
									<td>${voucherVo.regDate }</td>
									<td>${voucherVo.no }</td>
									<c:choose>
								        <c:when test="${voucherVo.amountFlag == 'd' }">
								            <td>차변</td>
								        </c:when>
								        <c:otherwise>
								            <td>대변</td>
								        </c:otherwise>
								    </c:choose>
									<td>${voucherVo.accountNo }</td>
									<td>${voucherVo.accountName }</td>
									<c:choose>
								        <c:when test="${voucherVo.amountFlag == 'd' }">
								            <td style="text-align: right;"><fmt:formatNumber value="${voucherVo.amount}" pattern="#,###" /></td>
								            <td></td>
								        </c:when>
								        <c:otherwise>
								        	<td></td>
								            <td style="text-align: right;"><fmt:formatNumber value="${voucherVo.amount}" pattern="#,###" /></td>
								        </c:otherwise>
								    </c:choose>
								    <td>${voucherVo.customerNo }</td>
									<td>${voucherVo.customerName }</td>
									<c:choose>
										<c:when test="${voucherVo.manageNo == '' }">
								            <td></td>
								        </c:when>
								        <c:when test="${voucherVo.manageNo != null }">
								            <td>세금계산서</td>
								        </c:when>
								        <c:otherwise>
								            <td></td>
								        </c:otherwise>
								    </c:choose>
									<td>${voucherVo.manageNo }</td>
									<td>${voucherVo.bankCode }</td>
									<td>${voucherVo.bankName }</td>
									<c:choose>
										<c:when test="${(voucherVo.accountNo >= 8000000 && voucherVo.accountNo < 9000000) || (voucherVo.accountNo >= 9200000 && voucherVo.accountNo < 9300000) }">
											<td>${voucherVo.cardNo }</td>
								            <td></td>
								            <td>${voucherVo.cardUser }</td>
								        </c:when>
								        <c:otherwise>
								        	<td></td>
								        	<td>${voucherVo.depositNo }</td>
								            <td>${voucherVo.depositHost }</td>
								        </c:otherwise>
								    </c:choose>
									<td>${voucherVo.voucherUse }</td>
									<td>${voucherVo.insertTeam }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<!-- 페이징 영역 -->
			<div class="pagination">
				<ul>
					<c:choose>
						<c:when test="${dataResult.pagination.prev }">
							<li><a href="${pageContext.servletContext.contextPath }/01/04/read?page=${dataResult.pagination.startPage - 1 }&regDate=${param.regDate }&no=${param.no }&accountNo=${param.accountNo }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }&useYn=${param.useYn }"><i class="icon-double-angle-left"></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
						<c:choose>
							<c:when test="${pg eq dataResult.pagination.page }">
								<li class="active"><a href="${pageContext.servletContext.contextPath }/01/04/read?page=${pg }&regDate=${param.regDate }&no=${param.no }&accountNo=${param.accountNo }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }&useYn=${param.useYn }">${pg }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.servletContext.contextPath }/01/04/read?page=${pg }&regDate=${param.regDate }&no=${param.no }&accountNo=${param.accountNo }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }&useYn=${param.useYn }">${pg }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${dataResult.pagination.next }">
							<li><a href="${pageContext.servletContext.contextPath }/01/04/read?page=${dataResult.pagination.endPage + 1 }&regDate=${param.regDate }&no=${param.no }&accountNo=${param.accountNo }&customerNo=${param.customerNo }&voucherUse=${param.voucherUse }&useYn=${param.useYn }"><i class="icon-double-angle-right"></i></a></li>
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
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>

<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/date-time/daterangepicker.min.js"></script>
<script>
$(function(){
	$(".chosen-select").chosen(); 
	$('.date-picker').datepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	$(document.body).delegate('#voucher_list tr', 'click', function() {
		var tr = $(this);
		var td = tr.children();
		
		$('#regDate').val('');
		$('#accountNo').val('');
		$('#accountName').val('');
		$('#amountFlag').val('');
		$('#amount').val('');
		$('#manageNo').val('');
		$('#customerNo').val('');
		$('#customerName').val('');
		$('#bankCode').val('');
		$('#bankName').val('');
		$('#cardNo').val('');
		$('#cardUser').val('');
		$('#depositNo').val('');
		$('#depositHost').val('');
		$('#voucherUse').val('');
		
		$("input[name=regDate]").val(td.eq(0).text());
		$("input[name=no]").val(td.eq(1).text());
		$('#accountNo').val(td.eq(3).text()).trigger('chosen:updated');
		$("input[name=accountName]").val(td.eq(4).text());
		console.log($("input[name=no]").val());
		if(td.eq(5).text()== "") {
			$("input[name=amount]").val(td.eq(6).text());	
		} else {
			$("input[name=amount]").val(td.eq(5).text());	
		}
		$("input[name=customerNo]").val(td.eq(7).text());
		$("input[name=customerName]").val(td.eq(8).text());
		$("input[name=bankCode]").val(td.eq(11).text());
		$("input[name=bankName]").val(td.eq(12).text());
		$("input[name=cardNo]").val(td.eq(13).text());
		$("input[name=depositNo]").val(td.eq(14).text());
		if(td.eq(13).text()== "") {
			$("input[name=depositHost]").val(td.eq(15).text());
		} else {
			$("input[name=cardUser]").val(td.eq(15).text());
		}
		$("input[name=voucherUse]").val(td.eq(16).text());
		$("input[name=insertTeam]").val(td.eq(17).text());
		
		$("input[name=bankName]").prop("readonly", true);
		$("input[name='bankLocation']").prop("readonly", true);
		$("input[name='banker']").prop("readonly", true);
		$("input[name='bankPhoneCall']").prop("readonly", true);
	});
	
	$("#btn-reset").click(function(){
		$('#regDate').val('');
		$('#no').val('');
		$('#accountName').val('');
		$('#accountNo').val("계정과목코드").trigger('chosen:updated');
		$('#amountFlag').val("d").trigger('chosen:updated');
		$('#useYn').val("삭제여부").trigger('chosen:updated');
		$('#amount').val('');
		$('#manageNo').val('');
		$('#customerNo').val('');
		$('#customerName').val('');
		$('#bankCode').val('');
		$('#bankName').val('');
		$('#cardNo').val('');
		$('#cardUser').val('');
		$('#depositNo').val('');
		$('#depositHost').val('');
		$('#voucherUse').val('');
		
		$("#voucher_save").empty();
	});
	
	//계정과목에 따른 계정명 불러오기
    $('#accountNo').change(function () {
    	var accountName =$(this).find('option:selected').attr('data-accountName');
    	$('#accountName').val(accountName);
   	});
	
	// 팝업
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
	             width: 700,
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
	  });
	
  $('#dialog-message-table').on('click', '#a-dialog-customerNo', function(event) {
     event.preventDefault();
     $("#tbody-customerList").find("tr").remove();
     
     var customerNo = $("#input-dialog-customerNo").val();
     
     // ajax 통신
     $.ajax({
        url: "${pageContext.request.contextPath }/01/03/getCustomer?customerNo=" + customerNo,
        contentType : "application/json; charset=utf-8",
        type: "get",
        dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
        data : "",
        statusCode: {
            404: function() {
              alert("page not found");
            }
        },
        success: function(result){
      	  if(result.success) {
      	  	$("#input-dialog-customerNo").val('');
      	  	var customerList = result.customerList;
      	  	console.log(result.customerList);
      	  	for(let a in customerList) {
	      	  	if(customerList[a].cardNo == null) {
	  	  			customerList[a].cardNo = "";
	  	  			customerList[a].cardUser = "";
	  	  		}
	  	  		
	  	  		if(customerList[a].depositNo == null) {
	  	  			customerList[a].depositNo = "";
	  	  			customerList[a].depositHost = "";
	  	  		}
      	  		
      	  		$("#tbody-customerList").append("<tr>" +
	      	  			"<td class='center'>" + customerList[a].customerNo + "</td>" +
	                    "<td class='center'>" + customerList[a].customerName + "</td>" +
	                    "<td class='center'>" + customerList[a].bankCode + "</td>" +
	                    "<td class='center'>" + customerList[a].bankName + "</td>" +
	                    "<td class='center'>" + customerList[a].cardNo + "</td>" +
	                    "<td class='center'>" + customerList[a].cardUser + "</td>" +
	                    "<td class='center'>" + customerList[a].depositNo + "</td>" +
	                    "<td class='center'>" + customerList[a].depositHost + "</td>" +
                        "</tr>");
      	  	}
      	  }
        },
        error: function(xhr, error){
           console.error("error : " + error);
        }
     });
  });
  
  // 거래처 리스트에서 row를 선택하면 row의 해당 데이터 form에 추가
  $(document.body).delegate('#tbody-customerList tr', 'click', function() {
     var tr = $(this);
     var td = tr.children();
     $("input[name=customerNo]").val(td.eq(0).text());
     $("input[name=customerName]").val(td.eq(1).text());
     $("#dialog-message").dialog('close');
  });
}); // $(function

</script>
<script>
	function comma(str) {
	  str = String(str);
	  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	//콤마풀기
	function uncomma(str) {
		str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}

	//값 입력시 콤마찍기
	function inputNumberFormat(obj) {
	    obj.value = comma(uncomma(obj.value));
	}
</script>
<script type="text/javascript">
var regDate = "${param.regDate}";
$("#regDate").val(regDate);
</script>
<script type="text/javascript">
var no = "${param.no}";
$("#no").val(no);
</script>
<script type="text/javascript">
var accountNo = "${param.accountNo}";
$("#accountNo").val(accountNo);
</script>
<script type="text/javascript">
var customerNo = "${param.customerNo}";
$("#customerNo").val(customerNo);
</script>
<script type="text/javascript">
var voucherUse = "${param.voucherUse}";
$("#voucherUse").val(voucherUse);
</script>
<script type="text/javascript">
var useYn = "${param.useYn}";
$("#useYn").val(useYn);
</script>
</body>
</html>