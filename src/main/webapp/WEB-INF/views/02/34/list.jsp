<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/head.jsp" />

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="/fa/ace/assets/js/ace-elements.min.js"></script>
<script src="/fa/ace/assets/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="/fa/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/datepicker.css" />

<script type="text/javascript">
	$(function(){
		$(".chosen-select").chosen(); 
	});
	
	$(function() {
		$("#search-section-dialog").click(function(event) {
			$("#dialog-section-main").dialog({
				autoOpen : false
			});
			
			$("#dialog-section-main").dialog('open');
			$("#dialog-section-main").dialog({
				resizable: false,
				height: 400,
				width: 400,
				modal: true,
				buttons: {
					"확인": function() {
						$(this).dialog("close");
					}
				}
			});
		});
		
		$("#search-factory-dialog").click(function(event) {
			$("#dialog-factory-main").dialog({
				autoOpen : false
			});
			
			$("#dialog-factory-main").dialog('open');
			$("#dialog-factory-main").dialog({
				resizable: false,
			    height: 400,
			      width: 400,
			      modal: true,
			      buttons: {
			        "확인": function() {
			          $(this).dialog("close");
			        }
			      }
			});
		});
		
		function isEmpty(value) {
			if(value == null || value.length === 0) {
				return "";
			} else {
				return value;
			}
		}
		
		$("body").on("click",".page_go",function(e) {
			var page_num = $(this).text();
			var page_group = parseInt((page_num-1)/5);
			
			console.log("page_num : " + page_num);
			console.log("page_group : " + page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
				type:"get",
				dataType:"json",
				data:{"page" : page_num, "page_group" : page_group},
				success:function(data) {
					updateTable(data.pagepurchaseitemList, page_num);
					updatePagination(data.purchaseitemListall, data.purchaseitemList, page_num, page_group);
				}, error:function(error) {
					alert("찾을 수 없는 품목입니다.");
				}
			});
		});
		
		$("body").on("click",".page_go_prev",function(e) {
			var page_num = $("#select_num").text();
			var page_group = parseInt((page_num-1)/5);
			
			page_group = page_group - 1;
			page_num = (page_group*5) + 5;
			
			console.log("page_num : " + page_num);
			console.log("page_group : " + page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
				type:"get",
				dataType:"json",
				data:{"page" : page_num, "page_group" : page_group},
				success:function(data) {
					updateTable(data.pagepurchaseitemList, page_num);
					updatePagination(data.purchaseitemListall, data.purchaseitemList, page_num, page_group);
				}, error:function(error) {
					alert("찾을 수 없는 품목입니다.");
				}
			});
		});
		
		$("body").on("click",".page_go_next",function(e) {
			var page_num = $("#select_num").text();
			var page_group = parseInt((page_num-1)/5);
			
			page_group = page_group + 1;
			page_num = (page_group*5) + 1;
			
			console.log("page_num : " + page_num);
			console.log("page_group : " + page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/paging",
				type:"get",
				dataType:"json",
				data:{"page" : page_num, "page_group" : page_group},
				success:function(data) {
					updateTable(data.pagepurchaseitemList, page_num);
					updatePagination(data.purchaseitemListall, data.purchaseitemList, page_num, page_group);
				}, error:function(error) {
					alert("찾을 수 없는 품목입니다.");
				}
			});
		});
		
		function updateTable(purchaseitemList, page_num) {
			$("#select-purchaseitem-list").remove();
			$newTbody = $("<tbody id='select-purchaseitem-list'></tbody>")
			$("#sample-table-1").append($newTbody)
			var i = 1;
			
			for(var pur in purchaseitemList) {
				$newTbody.append(
					"<tr>" +
					"<td>" + isEmpty((i + (page_num-1)*11)) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].no) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].name) + "</td>" +
					"<td class='hidden-480'>" + isEmpty(purchaseitemList[pur].sectioncode) + "</td>" +
					"<td class='hidden-phone'>" + isEmpty(purchaseitemList[pur].sectionname) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].standard) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].price) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].purpose) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].factorycode) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].factoryname) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].factorypostaddress) + " " + isEmpty(purchaseitemList[pur].factoryroadaddress) + " " + isEmpty(purchaseitemList[pur].factorydetailaddress) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].managername) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].producedate) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].deleteflag) + "</td>" +
					"</tr>"
				);
				i++;
			}
		}
			
		function updatePagination(purchaseitemListall, purchaseitemList, page_num, page_group) {
			$("#pagination_list").remove();
			$newUl = $("<ul id='pagination_list'></ul>")
			$(".pagination").append($newUl);
			var page_all_count = parseInt((purchaseitemListall.length-1)/11) + 1;
			var list_size = parseInt((purchaseitemList.length-1)/11) + 1;
			var page_group_max = parseInt((page_all_count-1) / 5);
			
			console.log(page_group_max);
			
			if(0 < page_group) {
				$newUl.append("<li><a class='page_go_prev' href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
			}
			
			for(var li = 1; li <= list_size; li++) {
				if(page_num == (li + page_group*5)) {
					$newUl.append(
						"<li class='active'><a id='select_num' href='javascript:void(0);'>" + (li + page_group*5) + "</a></li>"
					);
				} else {
					$newUl.append(
						"<li><a class='page_go' href='javascript:void(0);'>" + (li + page_group*5) + "</a></li>"
					);
				}
			}
			
			if(page_group_max > page_group) {
				$newUl.append("<li><a class='page_go_next' href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
			}
		}
	});
</script>

</head>
<body class="skin-3" style="min-width:1500px">
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
		
			<div class="page-header position-relative">
				<h1 class="pull-left">매입품목 현황조회</h1>
			</div><!-- /.page-header -->
			
			<div class="row-fluid">
				<!-- PAGE CONTENT BEGINS -->
				<div class="span12">
				<div class="row-fluid">
					<form id="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/list">
						<div style="height:200px">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="form-field-item-id">품목코드</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-item-id" name="no" placeholder="품목코드" maxlength="10"/>
									</div>
								</div>
								
								
								
								
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-section-name">품목 대분류명</label>
									<div class="controls">
										<div class="row-fluid input-append">
											<input class="span5" id="form-field-section-name" name="sectionname" type="text" placeholder="품목 대분류명" readonly/>
											<span class="add-on">
												<a href="javascript:void(0);" id="search-section-dialog" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
											</span>
										</div>
									</div>
								</div>
								
								<div id="dialog-section-main" title="품목 대분류명 조회" hidden="hidden">
									<table id ="dialog-message-section-table">
										<tr>
											<td>
												&nbsp;품목 대분류명 &nbsp;&nbsp;
												<input type="text" id="search-section-name" style="width:170px; margin: 0 0 0 0;"/>
												
												<a href="javascript:void(0);" id="btn-search-section">
													<span class="btn btn-small btn-info">
														<i class="icon-search nav-search-icon"></i>
													</span>
												</a>
											</td>
										</tr>
									</table>
									
									<table id="section-table" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">대분류명</th>
												<th class="center">대분류코드</th>
											</tr>
										</thead>
										<tbody id="tbody-section-list">
										<c:forEach items="${sectionList}" var="sl" varStatus="status">
											<tr>
												<td class="center">${sl.classification}</td>
												<td class="center">${sl.code}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								
								
								
								
								
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-name">생산공장명</label>
									<div class="controls">
										<div class="row-fluid input-append">
											<input class="span5" type="text" id="form-field-factory-name" name="factoryname" placeholder="생산공장명" readonly/>
											<span class="add-on">
												<a href="javascript:void(0);" id="search-factory-dialog" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
											</span>
										</div>
									</div>
								</div>
								
								<div id="dialog-factory-main" title="생산공장명 조회" hidden="hidden">
									<table id ="dialog-message-factory-table">
										<tr>
											<td>
												&nbsp;생산공장명 &nbsp;&nbsp;
												<input type="text" id="search-factory-name" style="width:170px; margin: 0 0 0 0;"/>
												
												<a href="javascript:void(0);" id="btn-factory-factory">
													<span class="btn btn-small btn-info">
														<i class="icon-search nav-search-icon"></i>
													</span>
												</a>
											</td>
										</tr>
									</table>
									
									<table id="factory-table" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">공장명</th>
												<th class="center">공장코드</th>
											</tr>
										</thead>
										<tbody id="tbody-factory-list">
										<c:forEach items="${factoryList}" var="fl" varStatus="status">
											<tr>
												<td class="center">${fl.classification}</td>
												<td class="center">${fl.code}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								
								
								
								
								
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-price">단가</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-price1" name="field-price"/>
										&nbsp;~&nbsp;
										<input class="span4" type="text" id="form-field-price2" name="field-price"/> 원
									</div>
								</div>
							</div>
							
							
							
							
							
							
							
								<div class="span6">
									<div class="control-group">
										<label class="control-label" for="form-field-item-name">품목명</label>
										<div class="controls">
											<input class="span5" type="text" id="form-field-item-name" name="name" placeholder="품목명"/>&nbsp;&nbsp;&nbsp;
											<input class="ace" type="checkbox" id="id-disable-check" style="display:inline">
											<label class="lbl" for="id-disable-check" style="display:inline"> 삭제 품목 포함</label>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="form-field-section-code">품목 대분류코드</label>
										<div class="controls">
											<input class="span4" type="text" id="form-field-section-code" name="sectioncode" readonly/>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="form-field-factory-code">생산공장코드</label>
										<div class="controls">
											<input class="span4" type="text" id="form-field-factory-code" name="factorycode" readonly/>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="form-field-date">생산 일자</label>
									<div class="controls">
										<div class="control-group">
											<div class="input-append">
												<input class="span7 cl-date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" style="width:130px">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											&nbsp; ~ &nbsp;
											<div class="input-append">
												<input class="span7 cl-date-picker" id="id-date-picker-2" type="text" data-date-format="yyyy-mm-dd" style="width:130px">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button class="btn btn-small btn-info" style="display:inline">조회</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				
					
					<div class="row-fluid">
						<div class="span12">
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>품목코드</th>
										<th>품목명</th>
										<th>대분류코드</th>
										<th>대분류명</th>
										<th>규격</th>
										<th>단가</th>
										<th>사용용도</th>
										<th>생산공장코드</th>
										<th>생산공장명</th>
										<th>생산공장 주소</th>
										<th>생산담당자</th>
										<th>생산일자</th>
										<th>삭제여부</th>
									</tr>
								</thead>

								<tbody id="select-purchaseitem-list">
									<fmt:parseNumber var="pc" integerOnly="true" value="${(fn:length(purchaseitemList)-1) / 11 }" />
									<c:forEach items="${pagepurchaseitemList }" var="pl" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${pl.no }</td>
											<td>${pl.name }</td>
											<td class="hidden-480">${pl.sectioncode }</td>
											<td class="hidden-phone">${pl.sectionname }</td>
											<td>${pl.standard }</td>
											<td>${pl.price }</td>
											<td>${pl.purpose }</td>
											<td>${pl.factorycode }</td>
											<td>${pl.factoryname }</td>
											<td>${pl.factorypostaddress } ${pl.factoryroadaddress } ${pl.factorydetailaddress }</td>
											<td>${pl.managername }</td>
											<td>${pl.producedate }</td>
											<td>${pl.deleteflag }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!-- /span -->
						
						<div class="pagination">
							<ul id="pagination_list">
								<fmt:parseNumber var="page_all_count" integerOnly="true" value="${((fn:length(purchaseitemListall)-1)/11) + 1}" />
								<fmt:parseNumber var="page_count" integerOnly="true" value="${((fn:length(purchaseitemList)-1)/11) + 1}" />
								<fmt:parseNumber var="page_group_max" integerOnly="true" value="${(page_all_count-1) / 5 }" />
								
								<c:choose>
									<c:when test="${0 < page_group }">
										<li><a class="page_go_prev" href="javascript:void(0);"><i class="icon-double-angle-left"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><a href="javascript:void(0);"><i class="icon-double-angle-left"></i></a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="pur_size" begin="1" end="${page_count }" step="1">
									<c:choose>
										<c:when test="${cur_page == pur_size }">
											<li class="active"><a id="select_num" href="javascript:void(0);">${pur_size }</a></li>
										</c:when>
										<c:otherwise>
											<li><a class="page_go" href="javascript:void(0);">${pur_size }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${page_group_max > page_group }">
										<li><a class="page_go_next" href="javascript:void(0);"><i class="icon-double-angle-right"></i></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><a href="javascript:void(0);"><i class="icon-double-angle-right"></i></a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				<!-- PAGE CONTENT ENDS -->
				</div>
			</div><!-- /.row-fluid -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<!-- basic scripts -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script>
	$(function() {
		$.fn.datepicker.dates['ko'] = {
			days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
			daysShort: ["일", "월", "화", "수", "목", "금", "토"],
			daysMin: ["일", "월", "화", "수", "목", "금", "토"],
			months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			today: "Today",
			clear: "Clear",
			format: "yyyy-mm-dd",
			titleFormat: "yyyy MM",
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
	})
	
	$("#section-table tr").click(function(){ 
		var tr = $(this);
		var td = tr.children();
		$("input[name=sectionname]").val(td.eq(0).text());
		$("input[name=sectioncode]").val(td.eq(1).text());
	});
	
	$("#factory-table tr").click(function(){ 
		var tr = $(this);
		var td = tr.children();
		$("input[name=factoryname]").val(td.eq(0).text());
		$("input[name=factorycode]").val(td.eq(1).text());
	});
	
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullRoadAddr = data.roadAddress;
				var extraRoadAddr = '';
				
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}
				
				document.getElementById('form-field-factory-postaddress').value = data.zonecode;
				document.getElementById('form-field-factory-roadaddress').value = fullRoadAddr;
				
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				} else {
					document.getElementById('guide').innerHTML = '';
				}
			}
		}).open();
	};
	
	function reset() {
		$("#form")[0].reset();
	};
	
	$(function() {
		$(".chosen-select").chosen();
		
		$('.date-picker').datepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	});
</script>
</body>
</html>