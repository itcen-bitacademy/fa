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
		$("#search").click(function(event) {
			event.preventDefault();
			
			var searchflag = $("#search").data("searchflag");
			var itemcode = $("#form-field-item-id").val();
			console.log(itemcode);
			
			if(itemcode != null && itemcode.length > 0) {
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
					type:"get",
					dataType:"json",
					data:{"itemcode" : itemcode},
					success:function(data) {
						if(data.dataflag === "ok") {
							$("#search").data("searchflag", "ok");
							$("#check_no").hide();
							$("#check_ok").hide();
							$("#form-field-item-id").attr("readonly", "true");
							$("#form-field-item-id").val(data.no);
							$("#form-field-section-name").val(data.section_name);
							$("#form-field-factory-name").val(data.factory_name);
							$("#form-field-factory-postaddress").val(data.postaddress);
							$("#form-field-factory-roadaddress").val(data.roadaddress);
							$("#form-field-factory-detailaddress").val(data.detailaddress);
							$("#form-field-standard").val(data.standard);
							$("#form-field-price").val(numberFormat(data.price));
							
							$("#form-field-item-name").val(data.name);
							$("#form-field-section-code").val(data.section_code);
							$("#form-field-factory-code").val(data.factory_code);
							$("#form-field-factory-manager").val(data.manager_name);
							$("#id-date-picker-1").val(data.produce_date);
							$("#form-field-purpose").val(data.purpose);
							console.log("searchflag :" + $("#search").data("searchflag"));
						} else if(data.dataflag === "no") {
							dialog("찾을 수 없는 품목입니다.", true);
						}
					}, error:function(error) {
						dialog("찾을 수 없는 품목입니다.", true);
					}
				});
			} else {
				dialog("품목코드를 입력해주세요.", true);
			}
		});
		
		$("#reset").click(function(event) {
			$("#check_no").show();
			$("#check_ok").hide();
			$("#form-field-item-id").removeAttr("readonly");
			$("#search").data("searchflag", "no");
			$("#check_no").data("checkid", "");
			var searchflag = $("#search").data("searchflag");
			console.log("searchflag :" + searchflag);
		});
		
		$("#delete").click(function(event) {
			event.preventDefault();
			
			var itemcode = $("#form-field-item-id").val();
			var page_num = $("#select_num").text();
			var searchflag = $("#search").data("searchflag");
			console.log(page_num);
			console.log("searchflag :" + searchflag);
			
			if(searchflag === "ok") {
				if(itemcode != null && itemcode.length > 0) {
					$.ajax({
						url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/delete",
						type:"get",
						dataType:"json",
						data:$("#form").serialize() + "&page=" + page_num,
						success:function(data) {
							if(data.delflag === "ok") {
								dialog("삭제 완료", false);
								
								$("#form-field-item-id").val("");
								$("#form-field-item-id").removeAttr("readonly");
								$("#search").data("searchflag", "no");
								$("#check_no").data("checkid", "");
								$("#check_no").show();
								$("#check_ok").hide();
								$("#form-field-section-name").val("");
								$("#form-field-factory-name").val("");
								$("#form-field-factory-postaddress").val("");
								$("#form-field-factory-roadaddress").val("");
								$("#form-field-factory-detailaddress").val("");
								$("#form-field-standard").val("");
								$("#form-field-price").val("");
								
								$("#form-field-item-name").val("");
								$("#form-field-section-code").val("");
								$("#form-field-factory-code").val("");
								$("#form-field-factory-manager").val("");
								$("#id-date-picker-1").val("");
								$("#form-field-purpose").val("");
							} else if(data.delflag === "no") {
								dialog("품목코드를 확인해주세요.", false);
							}
							
							updateTable(data.pagepurchaseitemList, page_num, data.purchaseitemListall);
							updatePagination(data.purchaseitemListall, data.purchaseitemList, data.page_num, data.page_group);
						}, error:function(error) {
							dialog("찾을 수 없는 품목입니다.", false);
						}
					});
				}
			} else if(searchflag === "no") {
				dialog("품목코드를 조회해주세요.", false);
			}
		});
		
		$("#update").click(function(event) {
			event.preventDefault();
			
			var itemcode = $("#form-field-item-id").val();
			var page_num = $("#select_num").text();
			var searchflag = $("#search").data("searchflag");
			console.log(page_num);
			console.log("searchflag :" + searchflag);
			
			if(searchflag === "ok") {
				if(itemcode != null && itemcode.length > 0) {
					var purchasename = $("#form-field-item-name").val();
					var sectionname = $("#form-field-section-name").val();
					var sectioncode = $("#form-field-section-code").val();
					var factoryname = $("#form-field-factory-name").val();
					var factorycode = $("#form-field-factory-code").val();
					var manager = $("#form-field-factory-manager").val();
					var producedate = $("#id-date-picker-1").val();
					var price = $("#form-field-price").val();
					
					if(purchasename.length === 0) {
						dialog("품목명을 입력해주세요.", false);
					} else if(sectionname.length === 0 || sectioncode.length === 0) {
						dialog("품목대분류를 선택해주세요.", false);
					} else if(factoryname.length === 0 || factorycode.length === 0) {
						dialog("공장을 선택해주세요.", false);
					} else if(manager.length === 0) {
						dialog("생산담당자를 입력해주세요.", false);
					} else if(producedate.length === 0) {
						dialog("생산일자를 선택해주세요.", false);
					} else if(price.length === 0) {
						dialog("단가를 입력해주세요.", false);
					} else {
						$.ajax({
							url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/update",
							type:"get",
							dataType:"json",
							data:$("#form").serialize() + "&page=" + page_num,
							success:function(data) {
								if(data.updateflag === "ok") {
									dialog("수정 완료", false);
								} else if(data.updateflag === "no") {
									dialog("품목코드를 확인해주세요.", false);
								}
								
								updateTable(data.pagepurchaseitemList, page_num, data.purchaseitemListall);
							}, error:function(error) {
								dialog("찾을 수 없는 품목입니다.", false);
							}
						});
					}
				}
			} else if(searchflag === "no") {
				dialog("품목코드를 조회해주세요.", false);
			}
		});
		
		$("#add").click(function(event) {
			event.preventDefault();
			
			var searchflag = $("#search").data("searchflag");
			var itemcode = $("#form-field-item-id").val();
			console.log(itemcode);
			console.log($("form").data("checkpurchaseno"));
			console.log("searchflag :" + searchflag);
			
			if(searchflag === "no") {
				var checkpurchaseno = $("#form").data("checkpurchaseno");
				var purchaseid = $("#form-field-item-id").val();
				var purchasename = $("#form-field-item-name").val();
				var sectionname = $("#form-field-section-name").val();
				var sectioncode = $("#form-field-section-code").val();
				var factoryname = $("#form-field-factory-name").val();
				var factorycode = $("#form-field-factory-code").val();
				var manager = $("#form-field-factory-manager").val();
				var producedate = $("#id-date-picker-1").val();
				var price = $("#form-field-price").val();
				
				if(checkpurchaseno === "no" || purchaseid.length < 10) {
					$("#form").data("checkpurchaseno", "no");
					
					dialog("품목코드를 중복확인 해주세요.", false);
				} else if(purchasename.length === 0) {
					dialog("품목명을 입력해주세요.", false);
				} else if(sectionname.length === 0 || sectioncode.length === 0) {
					dialog("품목대분류를 선택해주세요.", false);
				} else if(factoryname.length === 0 || factorycode.length === 0) {
					dialog("공장을 선택해주세요.", false);
				} else if(manager.length === 0) {
					dialog("생산담당자를 입력해주세요.", false);
				} else if(producedate.length === 0) {
					dialog("생산일자를 선택해주세요.", false);
				} else if(price.length === 0) {
					dialog("단가를 입력해주세요.", false);
				} else {
					$.ajax({
						url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/add",
						type:"get",
						dataType:"json",
						data:$("#form").serialize(),
						success:function(data) {
							dialog("등록 완료", true);
						}, error:function(error) {
							dialog("등록할 수 없는 품목입니다.", false);
						}
					});
				}
			} else if(searchflag === "ok") {
				dialog("조회 중입니다.<br>초기화 버튼을 눌러주세요.", false);
			}
			
		});
		
		function isEmpty(value) {
			if(value == null || value.length === 0) {
				return "";
			} else {
				return value;
			}
		}
		
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
				close: function() {
					$("#search-section-name").data("searchsectionname", "");
					$("#search-section-name").val("");
					var search_sectiondata = $("#search-section-name").data("searchsectionname");
					var section_page_num = 1;
					var section_page_group = parseInt((section_page_num-1)/5);
					
					$.ajax({
						url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/sectionpaging",
						type:"get",
						dataType:"json",
						data:{"section_page" : section_page_num, "section_page_group" : section_page_group, "search_sectiondata" : search_sectiondata},
						success:function(data) {
							section_updateTable(data.pagesectionList, section_page_num);
							section_updatePagination(data.sectionListall, data.sectionList, section_page_num, section_page_group);
						}, error:function(error) {
							dialog("찾을 수 없는 대분류명입니다.", false);
						}
					});
				},
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
			    close: function() {
			    	$("#search-factory-name").data("searchfactoryname", "");
			    	$("#search-factory-name").val("");
			    	var search_factorydata = $("#search-factory-name").data("searchfactoryname");
			    	var factory_page_num = 1;
			    	var factory_page_group = parseInt((factory_page_num-1)/5);
			    	
			    	$.ajax({
			    		url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/factorypaging",
			    		type:"get",
			    		dataType:"json",
			    		data:{"factory_page" : factory_page_num, "factory_page_group" : factory_page_group, "search_factorydata" : search_factorydata},
			    		success:function(data) {
			    			factory_updateTable(data.pagefactoryList, factory_page_num);
			    			factory_updatePagination(data.factoryListall, data.factoryList, factory_page_num, factory_page_group);
			    		}, error:function(error) {
			    			dialog("찾을 수 없는 공장명입니다.", false);
			    		}
			    	});
			    },
			    buttons: {
			    	"확인": function() {
			    		$(this).dialog("close");
			    	}
			    }
			});
		});
		
		$("body").on("click","#select-purchaseitem-list tr",function(e) {
			var tr = $(this);
			var td = tr.children();
			var itemcode = td.eq(1).text().trim();
			var searchflag = $("#search").data("searchfalg");
			
			if(itemcode != null && itemcode.length > 0) {
				event.preventDefault();
				
				$.ajax({
					url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/search",
					type:"get",
					dataType:"json",
					data:{"itemcode" : itemcode},
					success:function(data) {
						$("#search").data("searchflag", "ok");
						$("#check_no").hide();
						$("#check_ok").hide();
						$("#form-field-item-id").attr("readonly", "true");
						$("#form-field-item-id").val(data.no);
						$("#form-field-section-name").val(data.section_name);
						$("#form-field-factory-name").val(data.factory_name);
						$("#form-field-factory-postaddress").val(data.postaddress);
						$("#form-field-factory-roadaddress").val(data.roadaddress);
						$("#form-field-factory-detailaddress").val(data.detailaddress);
						$("#form-field-standard").val(data.standard);
						$("#form-field-price").val(numberFormat(data.price));
						
						$("#form-field-item-name").val(data.name);
						$("#form-field-section-code").val(data.section_code);
						$("#form-field-factory-code").val(data.factory_code);
						$("#form-field-factory-manager").val(data.manager_name);
						$("#id-date-picker-1").val(data.produce_date);
						$("#form-field-purpose").val(data.purpose);
						console.log("searchflag :" + $("#search").data("searchflag"));
					}, error:function(error) {
						dialog("찾을 수 없는 품목입니다.", false);
					}
				});
			}
		});
		
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
					updateTable(data.pagepurchaseitemList, page_num, data.purchaseitemListall);
					updatePagination(data.purchaseitemListall, data.purchaseitemList, page_num, page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 품목입니다.", false);
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
					updateTable(data.pagepurchaseitemList, page_num, data.purchaseitemListall);
					updatePagination(data.purchaseitemListall, data.purchaseitemList, page_num, page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 품목입니다.", false);
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
					updateTable(data.pagepurchaseitemList, page_num, data.purchaseitemListall);
					updatePagination(data.purchaseitemListall, data.purchaseitemList, page_num, page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 품목입니다.", false);
				}
			});
		});
		
		function numberFormat(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		function updateTable(purchaseitemList, page_num, purchaseitemListall) {
			$("#select-purchaseitem-list").remove();
			$("#purchaseitem_allcount").text("총 " + purchaseitemListall.length + "건");
			
			$newTbody = $("<tbody id='select-purchaseitem-list'></tbody>");
			$("#sample-table-1").append($newTbody);
			var i = 1;
			
			for(var pur in purchaseitemList) {
				$newTbody.append(
					"<tr>" +
					"<td>" + isEmpty((i + (page_num-1)*11)) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].no) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].name) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].sectioncode) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].sectionname) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].standard) + "</td>" +
					"<td style='text-align:right'>" + isEmpty(numberFormat(purchaseitemList[pur].price)) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].managername) + "</td>" +
					"<td>" + isEmpty(purchaseitemList[pur].producedate) + "</td>" +
					"</tr>"
				);
				i++;
			}
		}
			
		function updatePagination(purchaseitemListall, purchaseitemList, page_num, page_group) {
			$("#pagination_list").remove();
			$newUl = $("<ul id='pagination_list'></ul>");
			$("#purchase_pagination").append($newUl);
			var page_all_count = parseInt((purchaseitemListall.length-1)/11 + 1);
			var list_size = parseInt((purchaseitemList.length-1)/11 + 1);
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
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		$("#btn-search-section").click(function() {
			var search_section = $("#search-section-name").val();
			$("#search-section-name").data("searchsectionname", search_section);
			
			var search_sectiondata = $("#search-section-name").data("searchsectionname");
			var section_page_num = 1;
			var section_page_group = parseInt((section_page_num-1)/5);
			
			console.log("search_sectiondata : " + search_sectiondata);
			console.log("section_page_num : " + section_page_num);
			console.log("section_page_group : " + section_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/sectionpaging",
				type:"get",
				dataType:"json",
				data:{"section_page" : section_page_num, "section_page_group" : section_page_group, "search_sectiondata" : search_sectiondata},
				success:function(data) {
					section_updateTable(data.pagesectionList, section_page_num);
					section_updatePagination(data.sectionListall, data.sectionList, section_page_num, section_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 대분류명입니다.", false);
				}
			});
		});
		
		$("body").on("click",".section_page_go",function(e) {
			var section_page_num = $(this).text();
			var section_page_group = parseInt((section_page_num-1)/5);
			var search_sectiondata = $("#search-section-name").data("searchsectionname");
			
			console.log("search_sectiondata : " + search_sectiondata);
			console.log("section_page_num : " + section_page_num);
			console.log("section_page_group : " + section_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/sectionpaging",
				type:"get",
				dataType:"json",
				data:{"section_page" : section_page_num, "section_page_group" : section_page_group, "search_sectiondata" : search_sectiondata},
				success:function(data) {
					section_updateTable(data.pagesectionList, section_page_num);
					section_updatePagination(data.sectionListall, data.sectionList, section_page_num, section_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 대분류명입니다.", false);
				}
			});
		});
		
		$("body").on("click",".section_page_go_prev",function(e) {
			var section_page_num = $("#section_select_num").text();
			var section_page_group = parseInt((section_page_num-1)/5);
			var search_sectiondata = $("#search-section-name").data("searchsectionname");
			
			section_page_group = section_page_group - 1;
			section_page_num = (section_page_group*5) + 5;
			
			console.log("section_page_num : " + section_page_num);
			console.log("section_page_group : " + section_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/sectionpaging",
				type:"get",
				dataType:"json",
				data:{"section_page" : section_page_num, "section_page_group" : section_page_group, "search_sectiondata" : search_sectiondata},
				success:function(data) {
					section_updateTable(data.pagesectionList, section_page_num);
					section_updatePagination(data.sectionListall, data.sectionList, section_page_num, section_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 대분류명입니다.", false);
				}
			});
		});
		
		$("body").on("click",".section_page_go_next",function(e) {
			var section_page_num = $("#section_select_num").text();
			var section_page_group = parseInt((section_page_num-1)/5);
			var search_sectiondata = $("#search-section-name").data("searchsectionname");
			
			section_page_group = section_page_group + 1;
			section_page_num = (section_page_group*5) + 1;
			
			console.log("section_page_num : " + section_page_num);
			console.log("section_page_group : " + section_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/sectionpaging",
				type:"get",
				dataType:"json",
				data:{"section_page" : section_page_num, "section_page_group" : section_page_group, "search_sectiondata" : search_sectiondata},
				success:function(data) {
					section_updateTable(data.pagesectionList, section_page_num);
					section_updatePagination(data.sectionListall, data.sectionList, section_page_num, section_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 대분류명입니다.", false);
				}
			});
		});
	
		function section_updateTable(pagesectionList, section_page_num) {
			$("#tbody-section-list").remove();
			$newTbody = $("<tbody id='tbody-section-list'></tbody>");
			$("#section-table").append($newTbody);
			
			for(var sec in pagesectionList) {
				$newTbody.append(
					"<tr>" +
					"<td class='center'>" + isEmpty(pagesectionList[sec].classification) + "</td>" +
					"<td class='center'>" + isEmpty(pagesectionList[sec].code) + "</td>" +
					"</tr>"
				);
			}
		}
		
		function section_updatePagination(sectionListall, sectionList, section_page_num, section_page_group) {
			$("#section_pagination_list").remove();
			$newUl = $("<ul id='section_pagination_list'></ul>");
			$("#section_pagination").append($newUl);
			var section_page_all_count = parseInt((sectionListall.length-1)/6 + 1);
			var section_list_size = parseInt((sectionList.length-1)/6 + 1);
			var section_page_group_max = parseInt((section_page_all_count-1) / 5);
			
			console.log(section_page_group_max);
			
			if(0 < section_page_group) {
				$newUl.append("<li><a class='section_page_go_prev' href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
			}
			
			for(var li = 1; li <= section_list_size; li++) {
				if(section_page_num == (li + section_page_group*5)) {
					$newUl.append(
						"<li class='active'><a id='section_select_num' href='javascript:void(0);'>" + (li + section_page_group*5) + "</a></li>"
					);
				} else {
					$newUl.append(
						"<li><a class='section_page_go' href='javascript:void(0);'>" + (li + section_page_group*5) + "</a></li>"
					);
				}
			}
			
			if(section_page_group_max > section_page_group) {
				$newUl.append("<li><a class='section_page_go_next' href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
			}
		}
		
		$("body").on("click", "#search-section-dialog-refresh", function(e) {
			$("#form-field-section-name").val("");
			$("#form-field-section-code").val("");
		});
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		$("#btn-search-factory").click(function() {
			var search_factory = $("#search-factory-name").val();
			$("#search-factory-name").data("searchfactoryname", search_factory);
			
			var search_factorydata = $("#search-factory-name").data("searchfactoryname");
			var factory_page_num = 1;
			var factory_page_group = parseInt((factory_page_num-1)/5);
			
			console.log("search_factorydata : " + search_factorydata);
			console.log("factory_page_num : " + factory_page_num);
			console.log("factory_page_group : " + factory_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/factorypaging",
				type:"get",
				dataType:"json",
				data:{"factory_page" : factory_page_num, "factory_page_group" : factory_page_group, "search_factorydata" : search_factorydata},
				success:function(data) {
					factory_updateTable(data.pagefactoryList, factory_page_num);
					factory_updatePagination(data.factoryListall, data.factoryList, factory_page_num, factory_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 공장명입니다.", false);
				}
			});
		});
		
		$("body").on("click",".factory_page_go",function(e) {
			var search_factorydata = $("#search-factory-name").data("searchfactoryname");
			var factory_page_num = $(this).text();
			var factory_page_group = parseInt((factory_page_num-1)/5);
			
			console.log("factory_page_num : " + factory_page_num);
			console.log("factory_page_group : " + factory_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/factorypaging",
				type:"get",
				dataType:"json",
				data:{"factory_page" : factory_page_num, "factory_page_group" : factory_page_group, "search_factorydata" : search_factorydata},
				success:function(data) {
					factory_updateTable(data.pagefactoryList, factory_page_num);
					factory_updatePagination(data.factoryListall, data.factoryList, factory_page_num, factory_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 공장명입니다.", false);
				}
			});
		});
		
		$("body").on("click",".factory_page_go_prev",function(e) {
			var search_factorydata = $("#search-factory-name").data("searchfactoryname");
			var factory_page_num = $("#factory_select_num").text();
			var factory_page_group = parseInt((factory_page_num-1)/5);
			
			factory_page_group = factory_page_group - 1;
			factory_page_num = (factory_page_group*5) + 5;
			
			console.log("factory_page_num : " + factory_page_num);
			console.log("factory_page_group : " + factory_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/factorypaging",
				type:"get",
				dataType:"json",
				data:{"factory_page" : factory_page_num, "factory_page_group" : factory_page_group, "search_factorydata" : search_factorydata},
				success:function(data) {
					factory_updateTable(data.pagefactoryList, factory_page_num);
					factory_updatePagination(data.factoryListall, data.factoryList, factory_page_num, factory_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 공장명입니다.", false);
				}
			});
		});
		
		$("body").on("click",".factory_page_go_next",function(e) {
			var search_factorydata = $("#search-factory-name").data("searchfactoryname");
			var factory_page_num = $("#factory_select_num").text();
			var factory_page_group = parseInt((factory_page_num-1)/5);
			
			factory_page_group = factory_page_group + 1;
			factory_page_num = (factory_page_group*5) + 1;
			
			console.log("factory_page_num : " + factory_page_num);
			console.log("factory_page_group : " + factory_page_group);
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/factorypaging",
				type:"get",
				dataType:"json",
				data:{"factory_page" : factory_page_num, "factory_page_group" : factory_page_group, "search_factorydata" : search_factorydata},
				success:function(data) {
					factory_updateTable(data.pagefactoryList, factory_page_num);
					factory_updatePagination(data.factoryListall, data.factoryList, factory_page_num, factory_page_group);
				}, error:function(error) {
					dialog("찾을 수 없는 공장명입니다.", false);
				}
			});
		});
		
		function factory_updateTable(pagefactoryList, factory_page_num) {
			$("#tbody-factory-list").remove();
			$newTbody = $("<tbody id='tbody-factory-list'></tbody>");
			$("#factory-table").append($newTbody);
			
			for(var fac in pagefactoryList) {
				$newTbody.append(
					"<tr>" +
					"<td class='center'>" + isEmpty(pagefactoryList[fac].classification) + "</td>" +
					"<td class='center'>" + isEmpty(pagefactoryList[fac].code) + "</td>" +
					"</tr>"
				);
			}
		}
		
		function factory_updatePagination(factoryListall, factoryList, factory_page_num, factory_page_group) {
			$("#factory_pagination_list").remove();
			$newUl = $("<ul id='factory_pagination_list'></ul>");
			$("#factory_pagination").append($newUl);
			var factory_page_all_count = parseInt((factoryListall.length-1)/6 + 1);
			var factory_list_size = parseInt((factoryList.length-1)/6 + 1);
			var factory_page_group_max = parseInt((factory_page_all_count-1) / 5);
			
			console.log(factory_page_group_max);
			
			if(0 < factory_page_group) {
				$newUl.append("<li><a class='factory_page_go_prev' href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-left'></i></a></li>");
			}
			
			for(var li = 1; li <= factory_list_size; li++) {
				if(factory_page_num == (li + factory_page_group*5)) {
					$newUl.append(
						"<li class='active'><a id='factory_select_num' href='javascript:void(0);'>" + (li + factory_page_group*5) + "</a></li>"
					);
				} else {
					$newUl.append(
						"<li><a class='factory_page_go' href='javascript:void(0);'>" + (li + factory_page_group*5) + "</a></li>"
					);
				}
			}
			
			if(factory_page_group_max > factory_page_group) {
				$newUl.append("<li><a class='factory_page_go_next' href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
			} else {
				$newUl.append("<li class='disabled'><a href='javascript:void(0);'><i class='icon-double-angle-right'></i></a></li>");
			}
		}
		
		$("body").on("click", "#search-factory-dialog-refresh", function(e) {
			$("#form-field-factory-name").val("");
			$("#form-field-factory-code").val("");
		});
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		function addCommas(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		$("#form-field-price").on("keyup", function(event){
			$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		});
		
		$("#form-field-item-id").on("keyup", function(event){
			var check = $("#form").data("checkpurchaseno");
			var checkid = $("#check_no").data("checkid");
			
			console.log(checkid);
			if(check === "ok") {
				if($("#form-field-item-id").val().length < 10 || $("#form-field-item-id").val() !== checkid) {
					$("#form").data("checkpurchaseno", "no");
					$("#check_no").show();
					$("#check_ok").hide();
				}
			}
		});
		
		$("body").on("click", "#check_no", function(e) {
			e.preventDefault();
			
			var no = $("#form-field-item-id").val();
			
			$.ajax({
				url:"${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode }/checkNo",
				type:"get",
				dataType:"json",
				data:{"checkNo" : no},
				success:function(data) {
					if(data === "true") {
						dialog("사용가능한 품목코드입니다.", false);
						$("#form").data("checkpurchaseno", "ok");
						$("#check_no").data("checkid", $("#form-field-item-id").val());
						$("#check_no").hide();
						$("#check_ok").show();
					} else if(data === "false") {
						dialog("중복된 품목코드입니다.", false);
						$("#form").data("checkpurchaseno", "no");
					} else if(data === "none") {
						dialog("품목코드 10자를 입력해주세요.", false);
						$("#form").data("checkpurchaseno", "no");
					}
				}, error:function(error) {
					dialog("찾을 수 없는 품목입니다.", true);
				}
			});
		});
		
		function dialog(txt, flag) {
	        $("#dialog-txt").html(txt);
	    	var dialog = $( "#dialog-confirm" ).dialog({
				resizable: false,
				modal: true,
				buttons: [
					{
						text: "OK",
						"class" : "btn btn-danger btn-mini",
						click: function() {
							if(flag){
								$(this).dialog("close");
								location.reload();
							} else {
								$(this).dialog("close");
							}
						}
					}
				]
			});
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
				<h1 class="pull-left">매입품목관리</h1>
			</div><!-- /.page-header -->
			
			<!-- PAGE CONTENT BEGINS -->
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<form id="form" class="form-horizontal" data-checkpurchaseno="no" method="post">
						<div style="height:335px">
							<div class="span6" style="height:350px;">
								<div class="control-group">
									<label class="control-label" for="form-field-item-id" style="text-align:initial; width:100px;">품목코드</label>
									<div class="controls" style="margin-left:150px;">
										<div class="row-fluid">
											<input class="span4" type="text" id="form-field-item-id" name="no" style="margin:0 5px 0 0" placeholder="품목코드" maxlength="10"/>
											<input id="check_no" style="height:28px" data-checkid="" type="button" value="중복확인">
											<i id="check_ok" class="icon-ok bigger-150 blue" style="display:none;"></i>
										</div>
									</div>
								</div>
								
								<div id="dialog-confirm" class="hide">
									<p id="dialog-txt" class="bolder grey"></p>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-section-name" style="text-align:initial; width:100px;">품목 대분류명</label>
									<div class="controls" style="margin-left:150px;">
										<div class="row-fluid input-append">
											<input class="span5" id="form-field-section-name" name="sectionname" style="width:240px;" type="text" placeholder="품목 대분류명" readonly/>
											<span class="add-on">
												<a href="javascript:void(0);" id="search-section-dialog" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
											</span>
											<span class="add-on">
												<a href="javascript:void(0);" id="search-section-dialog-refresh" style="text-decoration:none"><i class="icon-refresh"></i></a>
											</span>
										</div>
									</div>
								</div>
								
								<div id="dialog-section-main" title="품목 대분류명 조회" hidden="hidden">
									<table id ="dialog-message-section-table">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;품목 대분류명&nbsp;&nbsp;
												<div class="row-fluid input-append" style="width:200px">
													<input class="span9" type="text" id="search-section-name" data-searchsectionname="" placeholder="품목 대분류명"/>
													<span class="add-on">
														<a href="javascript:void(0);" id="btn-search-section" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
													</span>
												</div>
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
										<c:forEach items="${pagesectionList}" var="sl" varStatus="status">
											<tr>
												<td class="center">${sl.classification}</td>
												<td class="center">${sl.code}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
									
									<div class="pagination" id="section_pagination">
										<ul id="section_pagination_list">
											<fmt:parseNumber var="section_page_all_count" integerOnly="true" value="${((fn:length(sectionListall)-1)/6) + 1}" />
											<fmt:parseNumber var="section_page_count" integerOnly="true" value="${((fn:length(sectionList)-1)/6) + 1}" />
											<fmt:parseNumber var="section_page_group_max" integerOnly="true" value="${(section_page_all_count-1) / 5 }" />
											
											<c:choose>
												<c:when test="${0 < section_page_group }">
													<li><a class="section_page_go_prev" href="javascript:void(0);"><i class="icon-double-angle-left"></i></a></li>
												</c:when>
												<c:otherwise>
													<li class="disabled"><a href="javascript:void(0);"><i class="icon-double-angle-left"></i></a></li>
												</c:otherwise>
											</c:choose>
											
											<c:forEach var="sec_size" begin="1" end="${section_page_count }" step="1">
												<c:choose>
													<c:when test="${section_cur_page == sec_size }">
														<li class="active"><a id="section_select_num" href="javascript:void(0);">${sec_size }</a></li>
													</c:when>
													<c:otherwise>
														<li><a class="section_page_go" href="javascript:void(0);">${sec_size }</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
											<c:choose>
												<c:when test="${section_page_group_max > section_page_group }">
													<li><a class="section_page_go_next" href="javascript:void(0);"><i class="icon-double-angle-right"></i></a></li>
												</c:when>
												<c:otherwise>
													<li class="disabled"><a href="javascript:void(0);"><i class="icon-double-angle-right"></i></a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
								
								
								
								
								
								
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-name" style="text-align:initial; width:100px;">생산공장명</label>
									<div class="controls" style="margin-left:150px;">
										<div class="row-fluid input-append">
											<input class="span5" type="text" id="form-field-factory-name" style="width:240px;" name="factoryname" placeholder="생산공장명" readonly/>
											<span class="add-on">
												<a href="javascript:void(0);" id="search-factory-dialog" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
											</span>
											<span class="add-on">
												<a href="javascript:void(0);" id="search-factory-dialog-refresh" style="text-decoration:none"><i class="icon-refresh"></i></a>
											</span>
										</div>
									</div>
								</div>
								
								<div id="dialog-factory-main" title="생산공장명 조회" hidden="hidden">
									<table id ="dialog-message-factory-table">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생산공장명&nbsp;&nbsp;
												<div class="row-fluid input-append" style="width:200px">
													<input class="span9" type="text" id="search-factory-name" data-searchfactoryname="" placeholder="생산공장명"/>
													<span class="add-on">
														<a href="javascript:void(0);" id="btn-search-factory" style="text-decoration:none"><i class="icon-search icon-on-right bigger-110"></i></a>
													</span>
												</div>
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
										<c:forEach items="${pagefactoryList}" var="fl" varStatus="status">
											<tr>
												<td class="center">${fl.classification}</td>
												<td class="center">${fl.code}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
									
									<div class="pagination" id="factory_pagination">
										<ul id="factory_pagination_list">
											<fmt:parseNumber var="factory_page_all_count" integerOnly="true" value="${((fn:length(factoryListall)-1)/6) + 1}" />
											<fmt:parseNumber var="factory_page_count" integerOnly="true" value="${((fn:length(factoryList)-1)/6) + 1}" />
											<fmt:parseNumber var="factory_page_group_max" integerOnly="true" value="${(factory_page_all_count-1) / 5 }" />
											
											<c:choose>
												<c:when test="${0 < factory_page_group }">
													<li><a class="factory_page_go_prev" href="javascript:void(0);"><i class="icon-double-angle-left"></i></a></li>
												</c:when>
												<c:otherwise>
													<li class="disabled"><a href="javascript:void(0);"><i class="icon-double-angle-left"></i></a></li>
												</c:otherwise>
											</c:choose>
											
											<c:forEach var="fac_size" begin="1" end="${factory_page_count }" step="1">
												<c:choose>
													<c:when test="${factory_cur_page == fac_size }">
														<li class="active"><a id="factory_select_num" href="javascript:void(0);">${fac_size }</a></li>
													</c:when>
													<c:otherwise>
														<li><a class="factory_page_go" href="javascript:void(0);">${fac_size }</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
											<c:choose>
												<c:when test="${factory_page_group_max > factory_page_group }">
													<li><a class="factory_page_go_next" href="javascript:void(0);"><i class="icon-double-angle-right"></i></a></li>
												</c:when>
												<c:otherwise>
													<li class="disabled"><a href="javascript:void(0);"><i class="icon-double-angle-right"></i></a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
								
								
								
								
								
								
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-postaddress" style="text-align:initial; width:100px;">생산공장 주소</label>
									<div class="controls" style="margin-left:150px;">
										<div class="row-fluid input-append" style="margin:0 0 5px 0">
											<input class="span3" id="form-field-factory-postaddress" name="postaddress" type="text" style="margin:0 10px 0 0;" placeholder="우편번호" readonly/>
											<input onclick="execDaumPostcode()" type="button" style="height:28px" value="주소찾기">
										</div>
										
										<input class="span5" type="text" id="form-field-factory-roadaddress" name="roadaddress" style="width:230px;" placeholder="도로명 주소" readonly/>
										<input class="span6" type="text" id="form-field-factory-detailaddress" name="detailaddress" style="width:280px;" placeholder="상세 주소"/>
									</div>
									
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-standard" style="text-align:initial; width:100px;">규격</label>
									<div class="controls" style="margin-left:150px;">
										<input class="span5" type="text" id="form-field-standard" style="width:230px;" name="standard" placeholder="ex) 20 x 35 cm"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-price" style="text-align:initial; width:100px;">단가</label>
									<div class="controls" style="margin-left:150px; ">
										<input class="span5" type="text" id="form-field-price" style="text-align:right; width:230px;" name="price"/>&nbsp;원
									</div>
								</div>
							</div>
							
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="form-field-item-name" style="text-align:initial; width:100px;">품목명</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-item-name" name="name" placeholder="품목명"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-section-code" style="text-align:initial; width:110px;">품목 대분류코드</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-section-code" name="sectioncode" readonly/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-code" style="text-align:initial; width:110px;">생산공장코드</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-factory-code" name="factorycode" readonly/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-factory-manager" style="text-align:initial; width:100px;">생산담당자</label>
									<div class="controls">
										<input class="span4" type="text" id="form-field-factory-manager" name="managername" placeholder="생산담당자"/>
									</div>
								</div>
								
								<div class="control-group" style="margin:0 0 10px 0">
									<label class="control-label" for="id-date-picker-1" style="text-align:initial; width:100px;">생산일자</label>
									<div class="controls">
											<div class="row-fluid input-append" style="margin: 0 0 10px 0">
												<input class="span3 cl-date-picker" id="id-date-picker-1" type="text" name="producedate" style="width:160px" data-date-format="yyyy-mm-dd">
												<span class="add-on">
													<i class="icon-calendar"></i>
												</span>
											</div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-purpose" style="text-align:initial; width:100px;">사용용도</label>
									<div class="controls">
										<input class="span5" type="text" id="form-field-purpose" name="purpose"/>
									</div>
								</div>
								<br>
								<br>
							</div>
							<div style="height:0; clear:both">&nbsp;</div>
						</div>
						
						<div class="hr hr-18 dotted"></div>
						
						<div>
							<button class="btn btn-primary btn-small" type="submit" id="add">입력</button>
							<button class="btn btn-warning btn-small" type="submit" id="update">수정</button>
							<button class="btn btn-danger btn-small" type="submit" id="delete">삭제</button>
							<button class="btn btn-info btn-small" type="submit" data-searchflag="no" id="search">조회</button>
							<button class="btn btn-default btn-small" type="reset" id="reset">초기화</button>
						</div>
											
						<div class="hr hr-18 dotted"></div>
					</form>
				</div>
				
				<div class="row-fluid">
					<div class="span12">
						<label id="purchaseitem_allcount">총 ${fn:length(purchaseitemListall) }건</label>
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
									<th>생산담당자</th>
									<th>일자</th>
								</tr>
							</thead>

							<tbody id="select-purchaseitem-list">
								<fmt:parseNumber var="pc" integerOnly="true" value="${(fn:length(purchaseitemList)-1) / 11 }" />
								
								<c:forEach items="${pagepurchaseitemList }" var="pl" varStatus="status">
								
									<tr>
										<td>${status.count}</td>
										<td>${pl.no }</td>
										<td>${pl.name }</td>
										<td>${pl.sectioncode }</td>
										<td>${pl.sectionname }</td>
										<td>${pl.standard }</td>
										<td style="text-align:right"><fmt:formatNumber value="${pl.price }" pattern="#,###"/></td>
										<td>${pl.managername }</td>
										<td>${pl.producedate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- /span -->
					
					<div class="pagination" id="purchase_pagination">
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
	
	$("body").on("click","#section-table tr",function(e) {
		var tr = $(this);
		var td = tr.children();
		$("input[name=sectionname]").val(td.eq(0).text());
		$("input[name=sectioncode]").val(td.eq(1).text());
	});
	
	$("body").on("click","#factory-table tr",function(e) {
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