<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<c:import url="/WEB-INF/views/common/head.jsp" />

<script src="/fa/ace/assets/js/jquery-2.0.3.min.js"></script>
<link href="/fa/ace/assets/css/jquery-ui-1.10.3.full.min.css" type="text/css" rel="stylesheet" />
<script src="/fa/ace/assets/js/jquery-ui-1.10.3.full.min.js"></script>
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
		$("#search").click(function(event) {
			var itemcode = $("#form-field-item-id").val();
			console.log(itemcode);
			
			if(itemcode != null && itemcode.length > 0) {
				event.preventDefault();
				
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
					type:"get",
					dataType:"json",
					data:{"itemcode" : itemcode},
					success:function(data) {
						$("#form-field-item-id").val(data.no);
						$("#form-field-section-name").val(data.section_name);
						$("#form-field-factory-name").val(data.factory_name);
						$("#form-field-factory-postaddress").val(data.postaddress);
						$("#form-field-factory-roadaddress").val(data.roadaddress);
						$("#form-field-factory-detailaddress").val(data.detailaddress);
						$("#form-field-standard").val(data.standard);
						$("#form-field-price").val(data.price);
						
						$("#form-field-item-name").val(data.name);
						$("#form-field-section-code").val(data.section_code);
						$("#form-field-factory-manager").val(data.manager_name);
						$("#id-date-picker-1").val(data.produce_date);
						$("#form-field-purpose").val(data.purpose);
					}, error:function(error) {
						alert("찾을 수 없는 품목입니다.");
					}
				});
			}
		});
		
		$("#delete").click(function() {
			var itemcode = $("#form-field-item-id").val();
			var factorycode = $("")
			console.log(itemcode);
			
			if(itemcode != null && itemcode.length > 0) {
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
					type:"get",
					dataType:"json",
					data:$("#form").serialize(),
					success:function(data) {
						alert("삭제 완료");
					}, error:function(error) {
						alert("찾을 수 없는 품목입니다.");
					}
				});
			}
		});
		
		$("#update").click(function() {
			var itemcode = $("#form-field-item-id").val();
			console.log(itemcode);
			
			if(itemcode != null && itemcode.length > 0) {
				event.preventDefault();
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update",
					type:"get",
					dataType:"json",
					data:$("#form").serialize(),
					success:function(purchaseitemList) {
						alert("수정 완료");
						
						updateTable(purchaseitemList);
					}, error:function(error) {
						alert("찾을 수 없는 품목입니다.");
					}
				});
			}
		});
		
		$("#add").click(function() {
			var itemcode = $("#form-field-item-id").val();
			console.log(itemcode);
			
			if(itemcode != null && itemcode.length > 0) {
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add",
					type:"get",
					dataType:"json",
					data:$("#form").serialize(),
					success:function(data) {
						alert("등록 완료");
					}, error:function(error) {
						alert("찾을 수 없는 품목입니다.");
					}
				});
			}
		});
		
		
		$("#btn-search-section").click(function() {
			var sectionname = $("#search-section-name").val();
			
			if(sectionname != null && sectionname.length > 0) {
				
				console.log(sectionname);
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/searchsection",
					type:"get",
					dataType:"json",
					data:{"sectionname" : sectionname},
					success:function(data) {
						
					}, error:function(error) {
						alert("찾을 수 없는 품목입니다.");
					}
				});
			}
		});
		
		function updateTable(purchaseitemList) {
			console.log(purchaseitemList);
			
			$("#select-purchaseitem-list").remove();
			$newTbody = $("<tbody id='select-purchaseitem-list'></tbody>")
			$("#sample-table-1").append($newTbody)
			var i = 1;
			for(var pur in purchaseitemList) {
				$newTbody.append(
					"<tr>" +
					"<td>" + i + "</td>" +
					"<td>" + purchaseitemList[pur].no + "</td>" +
					"<td>" + purchaseitemList[pur].name + "</td>" +
					"<td class='hidden-480'>" + purchaseitemList[pur].sectioncode + "</td>" +
					"<td class='hidden-phone'>" + purchaseitemList[pur].sectionname + "</td>" +
					"<td>" + purchaseitemList[pur].standard + "</td>" +
					"<td>" + purchaseitemList[pur].price + "</td>" +
					"<td>" + purchaseitemList[pur].managername + "</td>" +
					"<td>" + purchaseitemList[pur].producedate + "</td>" +
					"</tr>"
				);
				i++;
			}
		}
		
		$("#search-dialog").click(function(event) {
			$("#dialog-main").dialog({
				autoOpen : false
			});
			
			$("#dialog-main").dialog('open');
			$("#dialog-main").dialog({
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
		
		$("#select-purchaseitem-list tr").click(function() {
			var tr = $(this);
			var td = tr.children();
			var itemcode = td.eq(1).text().trim();
			
			if(itemcode != null && itemcode.length > 0) {
				event.preventDefault();
				
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
					type:"get",
					dataType:"json",
					data:{"itemcode" : itemcode},
					success:function(data) {
						$("#form-field-item-id").val(data.no);
						$("#form-field-section-name").val(data.section_name);
						$("#form-field-factory-name").val(data.factory_name);
						$("#form-field-factory-postaddress").val(data.postaddress);
						$("#form-field-factory-roadaddress").val(data.roadaddress);
						$("#form-field-factory-detailaddress").val(data.detailaddress);
						$("#form-field-standard").val(data.standard);
						$("#form-field-price").val(data.price);
						
						$("#form-field-item-name").val(data.name);
						$("#form-field-section-code").val(data.section_code);
						$("#form-field-factory-manager").val(data.manager_name);
						$("#id-date-picker-1").val(data.produce_date);
						$("#form-field-purpose").val(data.purpose);
					}, error:function(error) {
						alert("찾을 수 없는 품목입니다.");
					}
				});
			}
		});
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
				<h1 class="pull-left">매입품목관리</h1>
			</div><!-- /.page-header -->
			
			<!-- PAGE CONTENT BEGINS -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<form id="form" class="form-horizontal" method="post">
						<div style="height:330px">
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
											<input class="span5" id="form-field-section-name" name="sectionname" type="text" readonly/>
											<span class="add-on">
												<a href="#" id="search-dialog" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
											</span>
										</div>
									</div>
								</div>
								
								
								
								
								
								
								
								<div id="dialog-main" title="품목 대분류명 조회" hidden="hidden">
									<table id ="dialog-message-table">
										<tr>
											<td>
												&nbsp;품목 대분류명 &nbsp;&nbsp;
												<input type="text" id="search-section-name" style="width:170px; margin: 0 0 0 0;"/>
												
												<a href="#" id="btn-search-section">
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
										<tbody id="tbody-list">
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
										<input class="span5" type="text" id="form-field-factory-name" name="factoryname" placeholder="생산공장명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-postaddress">생산공장 주소</label>
									<div class="controls">
										<div class="row-fluid input-append" style="margin:0 0 5px 0">
											<input class="span3" id="form-field-factory-postaddress" name="postaddress" type="text" style="margin:0 10px 0 0;" placeholder="우편번호" readonly/>
											<input class="span2" onclick="execDaumPostcode()" class="btn-primary box" type="button" value="주소 찾기">
										</div>
										
										<input class="span5" type="text" id="form-field-factory-roadaddress" name="roadaddress" placeholder="도로명 주소" readonly/>
										<input class="span6" type="text" id="form-field-factory-detailaddress" name="detailaddress" placeholder="상세 주소"/>
									</div>
									
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-standard">규격</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-standard" name="standard" placeholder="ex) 20 x 35 cm"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-price">단가</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-price" name="price"/>&nbsp;원
									</div>
								</div>
							</div>
							
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="form-field-item-name">품목명</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-item-name" name="name" placeholder="품목명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-section-code">품목 대분류코드</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-section-code" name="sectioncode" readonly/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-manager">생산담당자</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-factory-manager" name="managername" placeholder="생산담당자"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="id-date-picker-1">생산 일자</label>
									<div class="controls">
										<div class="control-group">
											<div class="row-fluid input-append">
												<input class="span3 cl-date-picker" id="id-date-picker-1" type="text" name="producedate" data-date-format="yyyy-mm-dd" style="margin:0 0 16px 0">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-purpose">사용용도</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-purpose" name="purpose" style="margin:0 0 20px 0"/>
									</div>
								</div>
								<br>
								<br>
							</div>
							<div style="height:0; clear:both">&nbsp;</div>
						</div>
						
						<div class="hr hr-18 dotted"></div>
						
						<div>
							<button class="btn btn-info btn-small" type="submit" id="search">조회</button>
							<button class="btn btn-danger btn-small" type="submit" id="delete">삭제</button>
							<button class="btn btn-warning btn-small" type="submit" id="update">수정</button>
							<button class="btn btn-primary btn-small" type="submit" id="add">입력</button>
							<button class="btn btn-default btn-small" type="reset" id="reset">초기화</button>
						</div>
											
						<div class="hr hr-18 dotted"></div>
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
									<th>단가(원)</th>
									<th>담당자</th>
									<th>일자</th>
								</tr>
							</thead>

							<tbody id="select-purchaseitem-list">
								<c:forEach items="${purchaseitemList}" var="pl" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>${pl.no }</td>
										<td>${pl.name }</td>
										<td class="hidden-480">${pl.sectioncode }</td>
										<td class="hidden-phone">${pl.sectionname }</td>
										<td>${pl.standard }</td>
										<td>${pl.price }</td>
										<td>${pl.managername }</td>
										<td>${pl.producedate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- /span -->
					
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
	
	$(function() {
		$(".chosen-select").chosen();
		
		$('.date-picker').datepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	});
</script>

</body>
</html>