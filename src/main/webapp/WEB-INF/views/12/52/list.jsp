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
</head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		
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
			$("#form-customer").submit();
		});
		
		$(".pagination li a").on("click", function(event){
			event.preventDefault();
			var page = $(this).text();
			$("#form-customer input[name=page]").val(page);
			$("#form-customer").submit();
		});
	})
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
                              <input type="text" id="no1" name="no" style="width: 150px;" value="${customerVo.no }">
                              <input type="text" id="name1" name="name1" readonly style="width: 200px;">
                              <span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span> ~ 
                              <input type="text" id="no2" name="preNo" style="width: 150px;" value="${customerVo.preNo }">
                              <input type="text" id="name2" name="name2" readonly style="width: 200px;">
                              <span class="btn btn-small btn-info"><i class="icon-search nav-search-icon"></i></span>
                           </div>
                        </div>
                     </div>
                  
                     <div class="span4">
                        <div class="control-group">
                           <label class="control-label" for="item">종목</label>
                           <div class="controls">
                              <input type="text" id="item" name="item" style="width: 150px;">
                           </div>
                        </div>
                     
                        <div class="control-group">
                           <label class="control-label" for="delete_flag">삭제포함여부</label>

                           <div class="controls">
                              <input name="deleteFlag" type="radio" class="ace" value="N" checked="checked">
                              <span class="lbl">미포함</span>
                              <input name="deleteFlag" type="radio" class="ace" value="Y">
                              <span class="lbl">포함</span>
                           </div>
                        </div>
                     </div>
                  
                     <div class="span6">
                        <div class="control-group">
                           <label class="control-label" for="insert_date">입력일자</label>
                              <div class="controls">
                                 <div class="row-fluid input-append">
                                 <input class="cl-date-picker" name="insertDay" type="text" style="width: 135px;" data-date-format="yyyy-mm-dd"  value="${customerVo.insertDay }"/>
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
                           </div>
                           <div class="hr hr-18 dotted"></div>
                        </div>
                     </div>
                  </form>
				</div>
			</div>
					<div class="row-fluid">
						<div class="span12">
							<table id="customer-table" class="table table-striped table-bordered table-hover" aria-describedby="sample-table-2_info">
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
							<c:if test="${!pagination.prev }">
								<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
							</c:if>
							<c:if test="${pagination.prev }">
								<li><a href="#"><i class="icon-double-angle-left"></i></a></li>
							</c:if>
							
							<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
								<c:choose>
									<c:when test="${pageNum eq  pagination.page}">
										<li class="active"><a href="#">${pageNum }</a></li>		
									</c:when>
									<c:otherwise>
										<li><a href="#">${pageNum }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${!pagination.prev }">
								<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
							</c:if>
							<c:if test="${pagination.prev }">
								<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
							</c:if>
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