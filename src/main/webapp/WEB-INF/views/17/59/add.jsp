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
				<div class="row">
					<div class="span10">
						<!-- PAGE CONTENT BEGINS -->
						<form id="form-babo" class="form-horizontal" method="post" action="">	
											
							<!-- 회계연도  -->
							<div class="control-group">
								<label class="control-label" for="form-field-1">회계연도</label>
								<div class="controls">
									<input type="number" min="1900" max="2099" step="1" value="2019" id="accountUsedyear" name="accountUsedyear" placeholder="회계연도" />
								</div>
							</div>
							 
							<!-- 구분d  -->
							<div class="control-group">
								<label class="control-label" for="form-field-select-1">구분</label>
								<div class="controls">
									<select id="accountStatementType" name="accountStatementType" >
										<option value="B">대차대조표</option>
										<option value="I">손익계산서</option>
									</select>
								</div>
							</div>
							
							<!-- 순번  -->
							<div class="control-group">
								<label class="control-label" for="accountOrder">순번</label>
								<div class="controls">
									<input type="number" min="0001" max="1000" step="1" value="1" id="accountOrder" name="accountOrder" placeholder="순번" />
								</div>
							</div>
							<!-- 계정과목  -->
							<div class="control-group">
								<label class="control-label" for="form-field-select-1">계정과목</label>
								<div class="controls">
									<select class="chosen-select" id="form-field-select-1"
										name="menuNo" data-placeholder="메뉴선택">
										<c:forEach items="${listMainMenu }" var="menuVo">
											<option value="${menuVo.no }">${menuVo.name }</option>
										</c:forEach>
									</select> <input type="text" id="form-field-1" name="financial_usedyear"
										placeholder="계정과목"
										style="text-align: center; width: 300px; height: 18px;"
										disabled />
								</div>
							</div>
							&nbsp; &nbsp; &nbsp;
							<button class="btn btn-info btn-small" type="submit" name="action"  value="getList" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">조회</button>
							&nbsp;
							<button class="btn btn-danger btn-small" type="submit" name="action"  value="delete" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete">삭제</button>
							&nbsp;
							<button class="btn btn-warning btn-small" type="submit" name="action"  value="update" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update">수정</button>
							&nbsp;
							<button class="btn btn-primary btn-small" type="submit" id="account-add-btn" name="action" formaction="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add">입력</button>
							&nbsp;
							<button class="btn btn-default btn-small" type="reset">취소</button>

						</form>
						<!-- PAGE CONTENT ENDS -->

					</div>
				</div>


				<!-- /.row-fluid -->
				<!-- 제무재표 계정과목 테이블  -->
				<div class="span12">
				<!-- 선 -->
				<div class="hr hr-18 dotted"></div>
					<table id="sample-table-1"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center"><label> <input type="checkbox"
										class="ace"> <span class="lbl"></span>
								</label></th>
								<th>순번</th>
								<th>계정과목</th>
								<th>계정명칭</th>
								<th>잔액구분</th>
								<th>입력일자</th>
								<th>입력담당자</th>
								<th>수정일자</th>
								<th>수정담당자</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace"> <span class="lbl"></span>
								</label></td>
								<td>0010</td>
								<td>1000001</td>
								<td>자산</td>
								<td>차변</td>
								<td>2019.11.27</td>
								<td>이성훈</td>
								<td>2019.11.27</td>
								<td>이성훈</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->			
	<div class="pagination">
		<ul>
			<li class="disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
		</ul>
	</div>
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
</body>
</html>