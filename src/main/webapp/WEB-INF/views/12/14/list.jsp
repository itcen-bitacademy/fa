<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
    <c:import url="/WEB-INF/views/common/head.jsp" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <style>
        .daterangepicker .drp-calendar {
            max-width: 300px;
        }

        .form-horizontal .control-label {
            text-align: left
        }

        .controls input[type=text] {
            width: 50%;
            min-width: 200px
        }
    </style>
</head>

<body class="skin-3" style="min-width:1280px;">
    <c:import url="/WEB-INF/views/common/navbar.jsp" />
    <div class="main-container container-fluid">
        <c:import url="/WEB-INF/views/common/sidebar.jsp" />
        <div class="main-content">
            <div class="page-content">
                <div class="page-header position-relative">
                    <h1 class="pull-left">매출현황조회</h1>
                </div>
                <!-- /.page-header -->

                <!-- PAGE CONTENT BEGINS -->
                <div class="row-fluid">

                    <!-- PAGE CONTENT BEGINS -->
                    <div class="span12">
                        <form class="form-horizontal" method="post" id="searchForm" action="${pageContext.request.contextPath }/12/14">
                            <!-- left -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="salesNo">매출번호</label>
                                    <div class="controls">
                                        <input type="text" id="salesNo" name="salesNo" value="${search.salesNo }" placeholder="매출번호">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">매출기간</label>
                                    <div class="controls">
                                        <div class="input-append">
                                            <span class="add-on">
                                                <i class="icon-calendar"></i>
                                            </span>
                                            <input type="text" name="dates" id="salesDate" value="" class="form-control pull-left">
                                        </div>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="itemCode">품목코드</label>
                                    <div class="controls">
                                        <select class="chosen-select" id="itemCode" data-placeholder="품목코드" name="itemCode">
                                        <option value="">&nbsp;</option>
                                            <c:forEach items="${itemlist }" var="list" varStatus="status">
                                            	<c:choose>
                                            		<c:when test="${list.no eq search.itemCode }">
                                            			<option id="" value="${list.no }" selected>${list.no }(${list.name })</option>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<option id="" value="${list.no }">${list.no }(${list.name })</option>
                                            		</c:otherwise>
                                            	</c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="form-field-5">정렬기준</label>
                                    <div class="controls">
                                        <select class="chosen-select" id="form-field-select-1" name="orderData" data-placeholder="정렬기준">
                                        	<option value="">&nbsp;</option>
                                            <option value="sales_date">매출일</option>
                                            <option value="customer_code">거래처</option>
                                            <option value="supply_value">공급가액</option>
                                        </select>
                                        <div class="btn-group">
                                            <button class="btn btn-info btn-small" type="submit">조회</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- right -->
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label" for="customerCode">거래처코드</label>
                                    <div class="controls">
                                    <input type="hidden" value="${search.customerCode }">
                                        <select class="chosen-select" id="customerCode" data-placeholder="거래처코드" name="customerCode">
                                        <option value="">&nbsp;</option>
                                            <c:forEach items="${customerlist }" var="list" varStatus="status">
                                            	<c:choose>
                                            		<c:when test="${list.no eq search.customerCode }">
                                            			<option id="" value="${list.no }" selected>${list.no }(${list.name })</option>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<option id="" value="${list.no }">${list.no }(${list.name })</option>
                                            		</c:otherwise>
                                            	</c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="InsertUserid">매출담당자</label>
                                    <div class="controls">
                                        <input type="text" id="InsertUserid" name="InsertUserid" value="${search.insertUserid }" placeholder="매출담당자">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="deleteFlag">삭제여부</label>
                                    <input type="hidden" value="${search.deleteFlag }">
                                    <div class="controls">
                                        <select class="chosen-select" id="deleteFlag" name="deleteFlag" data-placeholder="팀선택">
                                        <c:choose>
                                        	<c:when test="${search.deleteFlag == 'Y' }">
                                        		<option value="Y" selected style="display:none">삭제</option>
                                        	</c:when>
                                        	<c:when test="${search.deleteFlag == 'N' }">
                                        		<option value="N" selected style="display:none">미삭제</option>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<option value="" selected style="display:none">전체</option>
                                        	</c:otherwise>                                        	
                                        </c:choose>
                                        		<option value="">전체</option>
                                        		<option value="Y">삭제</option>
                                        		<option value="N">미삭제</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="hr hr-10 dotted"></div>
                <div class="row-fluid">
                    <div class="span12">
                        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                            <tr>
                                <th>매출번호</th>
                                <th>매출일</th>
                                <th>출고일</th>
                                <th>거래처코드</th>
                                <th>거래처명</th>
                                <th>거래처담당자</th>
                                <th>거래처연락처</th>
                                <th>세금계산서번호</th>
                                <th>순번</th>
                                <th>품목코드</th>
                                <th>품목명</th>
                                <th>수량</th>
                                <th>공급가액</th>
                                <th>부가세</th>
                            </tr>
                            <c:forEach items="${dataResult.datas }" var="list" varStatus="status">
                            <tr>
                                <td>${list.salesNo }</td>
                                <td>${list.salesDate }</td>
                                <td>${list.releaseDate }</td>
                                <td>${list.customerCode }</td>
                                <td>${list.customerName }</td>
                                <td>${list.empManager }</td>
                                <td>${list.customerPhone }</td>
                                <td>${list.taxbillNo }</td>
                                <td>${list.number }</td>
                                <td>${list.itemCode }</td>
                                <td>${list.itemName }</td>
                                <td>${list.quantity }</td>
                                <td>${list.supplyValue }</td>
                                <td>${list.taxValue }</td>
                            </tr>
                            </c:forEach>
                        </table>
                        <input type="hidden" value="${search.searchFlag }" name="searchFlag" id="searchFlag">
                        <input type="hidden" value="${search.startDate }" name="" id="startDate">
                        <input type="hidden" value="${search.endDate }" name="" id="endDate">
                        <input type="hidden" value="${pg }" name="" id="currentPage">
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.span -->
                </div>
                <!-- /.row-fluid -->
                <div class="row-fluid">
                    <div class="pagination">
                        <ul>
                        <c:choose>
                            <c:when test="${dataResult.pagination.prev }">
                            <li><a href="javascript:movePage(${dataResult.pagination.startPage - 1 });"><i class="icon-double-angle-left"></i></a></li>
                            </c:when>
                            <c:otherwise>
                            <li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
                            <c:choose>
                                <c:when test="${pg eq dataResult.pagination.page }">
                                <li class="active"><a href="javascript:movePage(${pg });">${pg }</a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="javascript:movePage(${pg });">${pg }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${dataResult.pagination.next }">
                            <li><a href="javascript:movePage(${dataResult.pagination.endPage + 1 });"><i class="icon-double-angle-right"></i></a></li>
                            </c:when>
                            <c:otherwise>
                            <li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
                            </c:otherwise>
                        </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->
    </div>
    <!-- /.main-container -->
    <!-- basic scripts -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
    <script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
    <script>
        $(function() {
            $(".chosen-select").chosen();
     
       
	        $("#salesDate").daterangepicker({
	       		locale: {
	               	format: 'YYYY-MM-DD'
	            }
	        });
	        setDate();
	    });
        function movePage(page){
        	var searchFlag = $("#searchFlag").val();
        	var url = "${pageContext.request.contextPath }/12/14/"+page;
        	if(searchFlag=="true"){
        		$("#searchForm").attr("action", url).submit();
        	} else {
        		location.href = url;
        	}
        	
        }
        
        function setDate(){
        	if($("#searchFlag").val()=="true"){
        		/* if($("#currentPage").val()==""||$("#currentPage").val()==null){
        			history.pushState(null, null, "${pageContext.request.contextPath }/12/14/1");
        		} else {
        			history.pushState(null, null, "${pageContext.request.contextPath }/12/14/${pg}");
        		} */
  	    	   	$('#salesDate').data('daterangepicker').setStartDate($("#startDate").val());
  	    	   	$('#salesDate').data('daterangepicker').setEndDate($("#endDate").val());
  	       }
        }
      
    </script>
</body>

</html>