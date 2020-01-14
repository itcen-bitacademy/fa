<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/ace/assets/css/jquery-ui-1.10.3.full.min.css" />
<style>
.chosen-search {
	display: none;
}
.form-horizontal .control-label {
    text-align: left
}
</style>


</head>
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".chosen-select").chosen();
		$("th").attr("class", "center");
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
			});
				
		});
		
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

		$('.cl-date-picker').datepicker({
			language: 'ko'
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		$("#btn-submit").on("click", function(){
			$("#form-customer input[name=page]").val("1");
			$("#form-customer").submit();
		});
		
		$(".pagination li a").on("click", function(event){
			event.preventDefault();
			if($(this).parent().attr("class") == "disabled"){
				return;
			}
			$("#form-customer input[name=page]").val($(this).parent().val());
			$("#form-customer").submit();
		});
		
		$("#btn-clear").on("click", function(){
			$('#form-customer input[type=text]').val("");
			$("#form-customer input[name=deleteFlag]").eq(0).attr("checked", true);
			$("#form-customer input[name=deleteFlag]").eq(1).attr("checked", false);
		});
		
		$("#dialog-message").dialog({
		       autoOpen : false
		});
		
	    $(".a-customerinfo-dialog").click(function() {
	       tf = $(this).parent().prev();
	       $("#dialog-message").dialog({
	          title: "매출거래처 정보",
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
	       $("#dialog-message").dialog('open');
	    });
	    
	    // 매출거래처 팝업 클릭시
		$('#dialog-message-table').on('click', '#a-dialog-customerNo', function(event, ui) {
			event.preventDefault();
			 $("#tbody-customerList").find("tr").remove();
			 
			 var searchOption = $("#searchOption").val();
			 var searchValue = $("#input-dialog-customerNo").val();
			 
			 // ajax 통신
			 $.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/gets?"+searchOption+"="+searchValue,
			    contentType : "application/json; charset=utf-8",
			    type: "get",
			    dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
			    data : "",
			    statusCode: {
			        404: function() {
			          alert("page not found");
			        }
			    },
			    success: function(data){
			  	  if(data.success) {
			  	  	$("#input-dialog-customerNo").val('');
			  	  	var customerList = data.customerList;
			  	  	console.log(data.customerList);
			  	  	for(let c in customerList) {
			  	  		$("#tbody-customerList").append("<tr>" +
			                    "<td class='center'>" + customerList[c].no + "</td>" +
			                    "<td class='center'>" + customerList[c].name + "</td>" +
			                    "</tr>");
			
			  	  	}
			  	  }
			    },
			    error: function(xhr, error){
			       console.error("error : " + error);
			    }
			});
		});
		// 매출거래처 리스트(customerList)에서 row를 선택하면 row의 해당 데이터 form에 추가
		$(document.body).delegate('#tbody-customerList tr', 'click', function() {
		 var tr = $(this);
		 var td = tr.children();

		 $(tf).val(td.eq(1).text());
		 $(tf).parent().prev().val(td.eq(0).text());
		 $("#dialog-message").dialog('close');
		});
		
		
		// 매출거래처 name 자동입력
		$('.no').on('change', function(event) {
			 var el = $(this);
			 
			 // ajax 통신
			 $.ajax({
			    url: "${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/get?no="+$(el).val(),
			    contentType : "application/json; charset=utf-8",
			    type: "get",
			    dataType: "json", // JSON 형식으로 받을거다!! (MIME type)
			    data : "",
			    statusCode: {
			        404: function() {
			          alert("page not found");
			        }
			    },
			    success: function(data){
			    	$(el).next().children("input").val("");
			    	if(data.success && data.customer != null) {
						var customer = data.customer;
				    	console.log(customer);
				    	console.log(customer.name);
						$(el).next().children("input").val(customer.name);
					}
			    },
			    error: function(xhr, error){
			       console.error("error : " + error);
			    }
			});
		});
			
	});
	
</script>
<body class="skin-3">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
		
		
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매출거래처 현황 조회</h1>
			</div><!-- /.page-header -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span12">
					<form class="form-horizontal" id="form-customer" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list" method="post">
					<input type="hidden" name="page">
                     <div class="span12">
                        <div class="control-group">
                           <label class="control-label" for="customer">거래처</label>
                           <div class="controls">
                              <input type="text" class="no" id="no" name="no" readonly style="width: 150px;" value="${customerVo.no }">
                              <div class="input-append">
	                              <input type="text" id="name" name="name" class="name" readonly style="width: 200px;" value="${customerVo.name }">
	                              <span class="add-on">
		                              <a href="#" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i>
		                              </a>
	                              </span>
                              </div> ~ 
                              <input type="text" class="no" id="no2" name="preNo" readonly style="width: 150px;" value="${customerVo.preNo }">
                              <div class="input-append">
	                              <input type="text" id="name2" name="preName" class="name" readonly style="width: 200px;" value="${customerVo.preName }">
	                              <span class="add-on"><a href="#" class="a-customerinfo-dialog"><i class="icon-search icon-on-right bigger-110"></i></a></span>
                              </div>
                           </div>
                        </div>
                     </div>
                  	 <!-- 매출거래처 사업자번호, 상호명 Modal pop-up : start -->
						<div id="dialog-message" title="매출거래처" hidden="hidden">
							<table id="dialog-message-table">
								<tr>
									<td>
									<select id="searchOption" style="width:120px;">
											<option value="no">사업자번호</option>
											<option value="name">상호명</option>
									</select>
									<div class="input-append">
										<input type="text" id="input-dialog-customerNo" style="width: 150px;" /> 
										<span class="add-on">
										<a href="#" id="a-dialog-customerNo"> 
										<i class="icon-search icon-on-right bigger-110"></i>
										</a>
										</span>
									</div>
									</td>
								</tr>
							</table>
							<!-- 사업자번호 및 상호명 데이터 리스트 -->
							<table id="modal-customer-table"
								class="table table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">사업자번호</th>
										<th class="center">상호명</th>
									</tr>
								</thead>
								<tbody id="tbody-customerList">
									
								</tbody>
							</table>
						</div>
						<!-- 사업자번호, 상호명, 지점명 Modal pop-up : end -->
                     <div class="span4">
                        <div class="control-group">
                           <label class="control-label" for="item">종목</label>
                           <div class="controls">
                              <input type="text" id="item" name="item" style="width: 150px;" value="${customerVo.item }">
                           </div>
                        </div>
                     
                        <div class="control-group">
                           <label class="control-label" for="delete_flag">삭제포함여부</label>

                           <div class="controls">
                           	  <c:choose>
								<c:when test="${customerVo.deleteFlag eq 'N' || customerVo.deleteFlag eq null }">
									<input name="deleteFlag" type="radio" class="ace" value="N" checked="checked">
									<span class="lbl">미포함</span>
									<input name="deleteFlag" type="radio" class="ace" value="Y">
									<span class="lbl">포함</span>	
								</c:when>
								<c:otherwise>
									<input name="deleteFlag" type="radio" class="ace" value="N">
									<span class="lbl">미포함</span>
									<input name="deleteFlag" type="radio" class="ace" value="Y" checked="checked">
									<span class="lbl">포함</span>
								</c:otherwise>
								
							  </c:choose>
                              
                           </div>
                        </div>
                     </div>
                  
                     <div class="span6">
                        <div class="control-group">
                           <label class="control-label" for="insert_date">입력일자</label>
                              <div class="controls">
                                 <div class="row-fluid input-append">
                                 <input class="cl-date-picker" name="insertDay" type="text" readonly style="width: 135px;" data-date-format="yyyy-mm-dd"  value="${customerVo.insertDay }"/>
                                    <span class="add-on">
                                    <i class="icon-calendar"></i>
                                    </span>
                                 </div>
                              </div>
                        </div>
                        
                        <div class="control-group">
                           <label class="control-label" for="manager_name">거래처 담당자</label>
                           <div class="controls">
                              <input type="text" name="managerName" id="manager_name" style="width: 150px;" value="${customerVo.managerName }">
                           </div>
                        </div>
                     </div>
                     
                     <div class="row-fluid">
                        <div class="span12">
                           <div class="control-group">
                              <div class="hr hr-18 dotted"></div>
                                 <button class="btn btn-info btn-small" id="btn-submit" style="float:left; margin-left:20px;">조회</button>
                                 <button class="btn btn-default btn-small" id="btn-clear" type="button" style="margin-left: 10px;">초기화</button>
                              <div class="hr hr-18 dotted"></div>
                           </div>
                        </div>
                     </div>
                  </form>
				</div>
				<p class="span6" style="margin:-30px 0 0 0;font-size:0.9rem">매출거래처 ${pagination.totalCnt } 건</p>
			</div>
					<div class="row-fluid">
						
						<div class="span12" style="overflow-x: scroll;">
							<table id="customer-table" class="table table-striped table-bordered table-hover" style="width:3000px;" aria-describedby="sample-table-2_info">
								<thead>
									<tr role="row">
										<th>사업자번호</th>
										<th>상호</th>
										<th>대표자</th>
										<th>법인번호</th>
										<th>주소</th>
										<th>전화번호</th>
										<th>업태</th>
										<th>종목</th>
										<th>개설일자</th>
										<th>관할사무소</th>
										<th>거래처담당자성명</th>
										<th>담당자이메일</th>
										<th>계좌번호</th>
										<th>예금주</th>
										<th>은행코드</th>
										<th>은행명</th>
										<th>입력일자</th>
										<th>입력담당자ID</th>
										<th>수정일자</th>
										<th>수정담당자ID</th>
										<th>삭제여부</th>
									</tr>
								</thead>
								<tbody role="alert" aria-live="polite" aria-relevant="all">
										<c:forEach items="${customerList }" var="customer">
											<tr class="rows">
												<td>${customer.no }</td>
												<td>${customer.name }</td>
												<td>${customer.ceo }</td>
												<td>${customer.corporationNo }</td>
												<td>${customer.addressAll }</td>
												<td>${customer.phone }</td>
												<td>${customer.conditions }</td>
												<td>${customer.item }</td>
												<td>${customer.openDate }</td>
												<td>${customer.jurisdictionOffice }</td>
												<td>${customer.managerName }</td>
												<td>${customer.managerEmail }</td>
												<td>${customer.depositNo }</td>
												<td>${customer.depositHost }</td>
												<td>${customer.bankCode }</td>
												<td>${customer.bankName }</td>
												<td>${customer.insertDay }</td>
												<td>${customer.insertUserid }</td>
												<td>${customer.updateDay }</td>
												<td>${customer.updateUserid }</td>
												<td>${customer.deleteFlag }</td>
											</tr>
										</c:forEach>
									</tbody>
							</table>
						</div>
					</div>
					<div class="pagination">
						<ul>
							<c:choose>
								<c:when test="${pagination.prev }">
									<li value="${pagination.startPage - 1 }"><a href="#"><i class="icon-double-angle-left"></i></a></li>								
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>
								
							
							<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
								<c:choose>
									<c:when test="${pageNum eq  pagination.page}">
										<li class="active" value="${pageNum }"><a href="#">${pageNum }</a></li>		
									</c:when>
									<c:otherwise>
										<li value="${pageNum }"><a href="#">${pageNum }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${pagination.next }">
									<li value="${pagination.endPage + 1 }"><a href="#"><i class="icon-double-angle-right"></i></a></li>								
								</c:when>
								<c:otherwise>
									<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div><!-- /.span -->
			</div><!-- /.row-fluid -->
			
			
			
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>