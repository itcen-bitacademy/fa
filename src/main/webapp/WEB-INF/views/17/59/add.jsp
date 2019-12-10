<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

<!-- 
<script src="${pageContext.servletContext.contextPath }/assets/ace/js/uncompressed/jquery-2.0.3.js" type="text/javascript"></script>
<script>
$(function(){
	
	$("#account-add-btn").click(function(){
		
		var AccountManagement = {
				"account_order" : $("#account_order").val(),                   //계정과목 순서
				"account_no" : $("#account_no").val(),                         //계정과목 코드
				"account_statement_type" : $("#account_statement_type option:selected").val(), //제무재표 구분
				"account_usedyear" : $("#account_usedyear").val()              //계정과목 사용년도
		};
		
		if(AccountManagement == ''){
			alert("항목을 모두 입력해주세요.");
			return;
		}
		
		
		// ajax 통신
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add",
			type: "post",
			dataType: "json",	
			contentType: 'application/json',
			data: JSON.stringify(AccountManagement),

         	error : function(xhr, error) {
	        	console.error("error : " + error);
	        }

		});
				
	});
	
	
	
	$(document).on("click", ".delete-category", function(event) {
		  event.preventDefault();      
			
		  var con_test = confirm("정말 삭제하시겠습니까?");
		  if(con_test == true){
			  var no = $(this).attr('id');
		      let clikedRow = $(this);
		      
		      $.ajax({
		         url : "${pageContext.servletContext.contextPath }/api/blog/delete?no=" + no,
		         type : "post",
		         dataType : "json",
		         success : function(data) {
		         	$(clikedRow).parent().parent().remove();
		         },
		         error : function(xhr, error) {
		            console.error("error : " + error);
		         }
		      });
		  }
		  else if(con_test == false){
		    return;
		  }
		  
	     
	   
	   });
	
	
});
</script>
 -->
    
</head>
<body class="skin-3">
	<c:import url="/WEB-INF/views/common/navbar.jsp" />
	<div class="main-container container-fluid">
		<c:import url="/WEB-INF/views/common/sidebar.jsp" />
		<div class="main-content">
			<div class="page-content">
				<div class="page-header position-relative">
					<h1 class="pull-left">재무제표계정관리</h1>
				</div>
				<!-- /.page-header -->				
				<div class="row-fluid">
					<div class="span12">
						<!-- PAGE CONTENT BEGINS -->
						<form id="form-babo" class="form-horizontal" method="post" action="">	
											
							<!-- 회계연도  -->
							<div class="control-group">
								<label class="control-label" for="form-field-1" style="text-align:left;width:120px;" >회계연도</label>
								<div class="controls">
									<input type="number" min="1900" max="2099" step="1" value="${accountUsedyear }" id="accountUsedyear" name="accountUsedyear" placeholder="회계연도" />
								</div>
							</div>
							 
							<!-- 구분  -->
							<div class="control-group">
								<label class="control-label" for="form-field-select-1" style="text-align:left;width:120px;">구분</label>
								<div class="controls">
									<select id="selectedAccountStatementType" name="selectedAccountStatementType" >
										<c:if test="${selectedAccountStatementType eq 'B' }">
											<option value="B" selected="selected">대차대조표</option>
											<option value="I">손익계산서</option>
										</c:if>
										<c:if test="${selectedAccountStatementType eq 'I' }">
											<option value="B">대차대조표</option>
											<option value="I" selected="selected">손익계산서</option>
										</c:if>
									</select>
								</div>
							</div>
							
							<!-- 순번  -->
							<div class="control-group">
								<label class="control-label" for="accountOrder" style="text-align:left;width:120px;" >순번</label>
								<div class="controls">
									<input type="number" min="0001" max="1000" step="1" value="${accountOrder }" id="accountOrder" name="accountOrder" placeholder="순번입력" />
									<input type="hidden" id="no" name="no" value="" >
								</div>
							</div>
							 
							<!-- 계정과목  -->
							<div class="control-group">
								<label class="control-label" for="form-field-select-1" style="text-align:left;width:120px;" >계정과목</label>
								<div class="controls">
									<select class="chosen-select" id="selectedAccount" name="selectedAccount" data-placeholder="계정과목">		
										<option value="" data-accountName=""></option>		
										<c:choose>
											<c:when test="${selectedAccount eq selectedAccount }">
												<option value="${selectedAccount}" data-accountName="${selectedAccount }" selected>${selectedAccount }</option>
											</c:when>										
										</c:choose>				
										<c:forEach items="${accountList }" var="vo">									
												<option value="${vo.accountNo}" data-accountName="${vo.accountName }" >${vo.accountNo }</option>
										</c:forEach>
									</select> 
									<input type="text" id="accountName" name="accountName" placeholder="계정명칭" value="" style="text-align: center; width: 300px; height: 18px;" disabled />
								
								</div>
							</div>
							<div class="controls" style="margin-left: 0px;">
								<button class="btn btn-info btn-small" type="submit" id="account-list-btn" name="account-list-btn"  value="list" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">조회</button>
								&nbsp;
								<button class="btn btn-danger btn-small" type="submit" name="action"  value="delete" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
								&nbsp;
								<button class="btn btn-warning btn-small" type="submit" name="action"  value="update" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
								&nbsp;
								<button class="btn btn-primary btn-small" type="submit" id="account-add-btn" name="action" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">입력</button>
								&nbsp;
								<button class="btn btn-default btn-small" type="button" id="account-reset-btn" name="account-reset-btn" >취소</button>
							</div>	
						</form>
					</div>
				</div>

				<!-- /.row-fluid -->
				<div class="row-fluid">
				<!-- 제무재표 계정과목 테이블  -->
				<div class="span12">
				<!-- 선 -->
				<div class="hr hr-18 dotted"></div>
				
				<!-- 게시글 총 수 -->
				<h6>총 ${dataResult.pagination.totalCnt }건</h6>
			
					<table id="tb_account_management" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>순번</th>
								<th>계정과목</th>
								<th>계정명칭</th>
								<th>잔액구분</th>
								<th>입력담당자</th>
								<th>입력일자</th>
								<th>수정담당자</th>
								<th>수정일자</th>
							</tr>
						</thead>

						<c:forEach items="${dataResult.datas }" var="vo" varStatus="status">
							<tbody>
								<tr>
									<td>${vo.accountOrder }</td>
									<td>${vo.accountNo }</td>
									<td>${vo.accountName }</td>
									<c:if test="${vo.balanceType eq 'D' }">	
									<td>차변</td>
									</c:if>
									<c:if test="${vo.balanceType eq 'C' }">	
									<td>대변</td>
									</c:if>
									<td>${vo.insertUserid }</td>
									<td>${vo.insertDay }</td>
									<td>${vo.updateUserid }</td>
									<td>${vo.updateDay }</td>
									<td id="no" style="display:none;">${vo.no }</td>
								</tr>
							</tbody>				
						</c:forEach>
					</table>
				</div>
				</div>
			</div>

		</div>
	</div>	
	
	
	<%-- 페이징 --%>
	<div class="pagination">
		<ul>
			<c:choose>
				<c:when test="${dataResult.pagination.prev }">
					<li><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${dataResult.pagination.startPage - 1 }"><i class="icon-double-angle-left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach begin="${dataResult.pagination.startPage }" end="${dataResult.pagination.endPage }" var="pg">
				<c:choose>
					<c:when test="${pg eq dataResult.pagination.page }">
						<li class="active"><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${pg }">${pg }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${pg }">${pg }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${dataResult.pagination.next }">
					<li><a href="${pageContext.servletContext.contextPath }/17/59/list?accountUsedyear=${accountUsedyear }&selectedAccountStatementType=${selectedAccountStatementType }&page=${dataResult.pagination.endPage + 1 }"><i class="icon-double-angle-right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href="#"><i class="icon-double-angle-right"></i></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- PAGE CONTENT ENDS -->
	
	<!-- /.main-container -->
	<!-- basic scripts -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
	<script>
		$(function() {
			$(".chosen-select").chosen();
		});
	</script>
	
	<script>

    // 테이블의 Row 클릭시 값 가져오기
    $("#tb_account_management tr").dblclick(function(){     
        var str = "";
        var tdArr = new Array();    // 배열 선언
        
        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();
        
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });
        
        console.log("배열에 담긴 값 : "+tdArr);
        
        var accountOrder = td.eq(0).text();
        var accountNo = td.eq(1).text();
        var accountName = td.eq(2).text();
        var hiddenNo = td.eq(8).text();
             
        //$(".selectedAccount").val(accountNo).trigger('change'); 
        //$("#selectedAccount").val(accountNo).prop("selected", true);
        //$("#selectedAccount").val("10230123").attr("selected", "selected");                       
       	//$("#selectedAccount").val(accountNo);
        //$("#selectedAccount  option:contains(" + accountNo + ")").text(accountNo);  
     	//$('#selectedAccount').chosen().val(accountNo);
     	
     	$('#selectedAccount').val(accountNo).trigger('chosen:updated');    	
        $("#accountOrder").val(accountOrder);
        $("#accountName").val(accountName);
        $("#no").val(hiddenNo);
     
    });
    
    
    //계정과목에 따른 계정명 불러오기
    $('#selectedAccount').change(function () {
    	var accountName =$(this).find('option:selected').attr('data-accountName');
    	$('#accountName').val(accountName);
   	});
    
    
    //리셋버튼 누를 시 초기화
    $("#account-reset-btn").click(function() {
    	$('#selectedAccountStatementType').val("B");
    	$('#accountOrder').val("");
    	$('#accountUsedyear').val("2019");
    	$('#accountName').val("");
    	$('#selectedAccount').val(null).trigger('chosen:updated'); 
    });
    
    //조회버튼 누를 시 초기화
    $("#account-list-btn").click(function() {
    	console.log($('#selectedAccount').val());
    	//$('#selectedAccount').val($('#selectedAccount').val()).trigger('chosen:updated');
    });
    
	$(function(){
		
		var result = "${param.result}";
		
		if('overlap' == result ){			
			alert("이미 있는 데이터입니다.");
			
			result = "";
			return;
		} else if('nullData' == result){
			alert("데이터가 없어서 저장하겠습니다.");
			
			result = "";
			return;
		} else if('NPE' == result){
			alert("데이터를 입력해주세요");
			
			result = "";
			return;
		} else if('NPE2' == result){
			alert("삭제할 데이터를 선택해주세요");
			
			result = "";
			return;
		}
	});
    
	</script>
</body>
</html>