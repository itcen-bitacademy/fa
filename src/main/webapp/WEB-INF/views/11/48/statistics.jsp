<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<!-- For Dialog -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/ace/css/chosen.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
<c:import url="/WEB-INF/views/common/head.jsp" />
<style>
	.mybtn{margin-right:10px;}
	
	.navbar-inner.fixed{background: #393939;}
	
	body{font-family: 'Apple SD Gothic Neo','나눔고딕',NanumGothic,'맑은 고딕',Malgun Gothic,'돋움',dotum,'굴림',gulim,applegothic,sans-serif;}
	
	html,body{
		height:100%;
		overflow-x: hidden;
	}
	     	
	.main-container{
	  	height:calc(100% - 45px);
	  	overflow-x: hidden;
	}
	
	.main-content{
	  	overflow:auto;
	}
	
	.page-content{
	  	min-width:1280px;
	}
	
	@media screen and (max-width: 920px) {
		.main-container{
		 	height:calc(100% - 84px);
		}
	}
	
	/* Tabbed Styles */
	.tabbed {
		min-width: 400px;
		margin: 0 auto;
		border-bottom: 4px solid #000;
		overflow: hidden;
		transition: border 250ms ease;
	}
	.tabbed ul {
		margin: 0px;
		padding: 0px;
		overflow: hidden;
		float: left;
		padding-left: 48px;
		list-style-type: none;
	}
	.tabbed ul * {
		margin: 0px;
		padding: 0px;
	}
	.tabbed ul li {
		display: block;
		float: left;
		padding: 10px 24px 8px;
		background-color: #FFF;
		margin-right: 46px;
		z-index: 2;
		position: relative;
		cursor: pointer;
		color: #777;

		text-transform: uppercase;
		font: 600 13px/20px roboto, "Open Sans", Helvetica, sans-serif;

		transition: all 250ms ease;
	}
	.tabbed ul li:before,
	.tabbed ul li:after {
		display: block;
		content: " ";
		position: absolute;
		top: 0;
		height: 100%;
		width: 44px; 	
		background-color: #FFF;
		transition: all 250ms ease;
	}
	.tabbed ul li:before {
		right: -24px;
		transform: skew(30deg, 0deg);
		box-shadow: rgba(0,0,0,.1) 3px 2px 5px, inset rgba(255,255,255,.09) -1px 0;
	}
	.tabbed ul li:after {
		left: -24px;
		transform: skew(-30deg, 0deg);
		box-shadow: rgba(0,0,0,.1) -3px 2px 5px, inset rgba(255,255,255,.09) 1px 0;
	}
	.tabbed ul li:hover,
	.tabbed ul li:hover:before,
	.tabbed ul li:hover:after {
		background-color: #F4F7F9;
		color: #444;
	}
	.tabbed ul li.active {
		z-index: 3;
	}
	.tabbed ul li.active,
	.tabbed ul li.active:before,
	.tabbed ul li.active:after {
		background-color: #000;
		color: #fff;
	}
	
	<!-- Pie Chart-->
	
	.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 660px;
    margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}
</style>
</head>
<body>
<input type="hidden" id="context-path" value="${pageContext.request.contextPath }"/>
<input type="hidden" id="main-menu-code" value="${menuInfo.mainMenuCode }"/>
<input type="hidden" id="sub-menu-code" value="${menuInfo.subMenuCode }"/>
<c:import url="/WEB-INF/views/common/navbar.jsp" />
<div class="main-container container-fluid">
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />
	<div class="main-content">
		<div class="page-content">
			<div class="page-header position-relative">
				<h1 class="pull-left">통계정보</h1>
				
			</div>
			<div class="tabbed">
				<ul>
					<li class="active">년간부채</li>
					<li>월별부채</li>
					<li>년간 지급이자</li>
					<li>계정별 부채비율</li>					
				</ul>
				<button class="pull-right" onclick="location.href='${pageContext.request.contextPath }/${menuInfo.mainMenuCode }/${menuInfo.subMenuCode}'" >돌아가기</button>
			</div>
			
			<figure class="highcharts-figure">
			    <div id="container"></div>
			    <p class="highcharts-description">
			        부채 통계
			    </p>
			</figure>
		</div><!-- /.page-content End-->
	</div><!-- /.main-content -->
</div><!-- /.main-container -->
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/date-time/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/ace/js/chosen.jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script>
$(function(){
	//테마 설정
	setBarChartTheme();
	
	//Tab Click Event 추가
	addTabClick();
});

function addTabClick(){
	var tabs = document.querySelectorAll('.tabbed li');
	setTabValue(tabs);										//각 tab에 value(url)를 설정한다.
	console.log("tabs : " + tabs);

	for (var i = 0, len = tabs.length; i < len; i++) {
		tabs[i].addEventListener("click", function() {
			if (this.classList.contains('active'))
				return;

			var parent = this.parentNode,
				innerTabs = parent.querySelectorAll('li');

			for (var index = 0, iLen = innerTabs.length; index < iLen; index++) {
				innerTabs[index].classList.remove('active');
			}

			this.classList.add('active');
			var chartInfo = JSON.parse($(this).find("input").val());
			
			if(chartInfo.type == "bar"){
				setBarChartTheme();
			}else if(chartInfo.type == "pie"){
				setPieChartTheme();
			}
			
			$.ajax(new ChartAjaxBody(chartInfo));
		});
	}// for End
	
	var chartInfo = JSON.parse($(tabs[0]).find("input").val());
	
	$.ajax(new ChartAjaxBody(chartInfo));
}

function setTabValue(tabs){
	$(tabs[0]).append("<input type='hidden' value='" + JSON.stringify(new ChartInfo("/getYearDebtStat", "년간 부채 합계", "bar", 100000000)) + "'/>");
	$(tabs[1]).append("<input type='hidden' value='" + JSON.stringify(new ChartInfo("/getMonthDebtStat", "월간 부채 합계", "bar", 10000000)) + "'/>");
	$(tabs[2]).append("<input type='hidden' value='" + JSON.stringify(new ChartInfo("/getYearIntStat", "년간 지급이자 합계", "bar", 10000000)) + "'/>");
	$(tabs[3]).append("<input type='hidden' value='" + JSON.stringify(new ChartInfo("/getDebtRatio", "계정별 부채비율", "pie")) + "'/>");
}	

function ChartAjaxBody(chartInfo){
	this.url = $("#context-path").val()  + "/" + $("#main-menu-code").val() + "/" + $("#sub-menu-code").val() + chartInfo.url;
	this.type = "POST";
	this.dataTYpe = "json";
	this.data="";
	this.success = function(response){
		console.log("data : " + response.data);
		
		if(chartInfo.type == "bar")
			createBarChart(response.data, chartInfo);
		else if(chartInfo.type == "pie")
			createPieChart(response.data, chartInfo);
	}
	this.error = function(xhr, error){
		
	}
}

function ChartInfo(url, subTitle, type, measure){
	this.url = url;
	this.subTitle = subTitle;
	if(typeof measure == "Number")
		this.measure = measure;
	this.type = type;
}

function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
</script>
<script>
//High Chart
function createPieChart(statMap, chartInfo){
	console.log("statMap : " + statMap[0].y);
	Highcharts.chart('container', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: chartInfo.subTitle
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '%'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                connectorColor: 'silver'
	            }
	        }
	    },
	    series: [{
	        name: 'Share',
	        data: statMap
	    }]
	});
}

function createBarChart(statMap, chartInfo){
	Highcharts.chart('container', {
	    chart: {
	    	// Edit chart spacing
	    	spacingBottom: 15,
	    	spacingTop: 10,
	    	spacingLeft: 10,
	    	spacingRight: 10,
	    	
	        type: 'column',
	        
	        // Explicitly Tell the width and height of a chart
	        width: 1590,
	        height: 800
	    },
	    title: {
	        text: '부채통계'
	    },
	    subtitle: {
	        text: chartInfo.subTitle
	    },
	    xAxis: {
	        categories: statMap.xAxis,
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
            startOnTick: false,
            endOnTick: false,
            tickInterval: chartInfo.measure,
			labels : {
				format: '{value:,.0f}',
			},
	        title: {
	            text: '(원)'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr class="tr-chart-hover"><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:,.0f}원</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [{
	        name: '단기차입금',
	        data: statMap.sList

	    }, {
	        name: '장기차입금',
	        data: statMap.lList

	    }, {
	        name: '사채',
	        data: statMap.pList
	    }]
	});
	
}

function setPieChartTheme(){
	// Radialize the colors
	Highcharts.setOptions({
	    colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
	        return {
	            radialGradient: {
	                cx: 0.5,
	                cy: 0.3,
	                r: 0.7
	            },
	            stops: [
	                [0, color],
	                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
	            ]
	        };
	    })
	});

	// Build the chart
	Highcharts.chart('container', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: 'Browser market shares in January, 2018'
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '%'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	                connectorColor: 'silver'
	            }
	        }
	    },
	    series: [{
	        name: 'Share',
	        data: [
	            { name: 'Chrome', y: 61.41 },
	            { name: 'Internet Explorer', y: 11.84 },
	            { name: 'Firefox', y: 10.85 },
	            { name: 'Edge', y: 4.67 },
	            { name: 'Safari', y: 4.18 },
	            { name: 'Other', y: 7.05 }
	        ]
	    }]
	});
}

function setBarChartTheme(){
	Highcharts.setOptions({
		lang: {
			thousandsSep: ','
		},		
	    colors: ['#2b908f', '#90ee7e', '#f45b5b', '#7798BF', '#aaeeee', '#ff0066',
	        '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
	    chart: {
	        backgroundColor: {
	            linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
	            stops: [
	                [0, '#2a2a2b'],
	                [1, '#3e3e40']
	            ]
	        },
	        style: {
	            fontFamily: '\'Unica One\', sans-serif'
	        },
	        plotBorderColor: '#606063'
	    },
	    title: {
	        style: {
	            color: '#E0E0E3',
	            textTransform: 'uppercase',
	            fontSize: '20px'
	        }
	    },
	    subtitle: {
	        style: {
	            color: '#E0E0E3',
	            textTransform: 'uppercase'
	        }
	    },
	    xAxis: {
	        gridLineColor: '#707073',
	        labels: {
	            style: {
	                color: '#E0E0E3'
	            }
	        },
	        lineColor: '#707073',
	        minorGridLineColor: '#505053',
	        tickColor: '#707073',
	        title: {
	            style: {
	                color: '#A0A0A3'
	            }
	        }
	    },
	    yAxis: {
	        gridLineColor: '#707073',
	        labels: {
	            style: {
	                color: '#E0E0E3'
	            }
	        },
	        lineColor: '#707073',
	        minorGridLineColor: '#505053',
	        tickColor: '#707073',
	        tickWidth: 1,
	        title: {
	            style: {
	                color: '#A0A0A3'
	            }
	        }
	    },
	    tooltip: {
	        backgroundColor: 'rgba(0, 0, 0, 0.85)',
	        style: {
	            color: '#F0F0F0'
	        }
	    },
	    plotOptions: {
	        series: {
	            dataLabels: {
	                color: '#F0F0F3',
	                style: {
	                    fontSize: '13px'
	                }
	            },
	            marker: {
	                lineColor: '#333'
	            }
	        },
	        boxplot: {
	            fillColor: '#505053'
	        },
	        candlestick: {
	            lineColor: 'white'
	        },
	        errorbar: {
	            color: 'white'
	        }
	    },
	    legend: {
	        backgroundColor: 'rgba(0, 0, 0, 0.5)',
	        itemStyle: {
	            color: '#E0E0E3'
	        },
	        itemHoverStyle: {
	            color: '#FFF'
	        },
	        itemHiddenStyle: {
	            color: '#606063'
	        },
	        title: {
	            style: {
	                color: '#C0C0C0'
	            }
	        }
	    },
	    credits: {
	        style: {
	            color: '#666'
	        }
	    },
	    labels: {
	        style: {
	            color: '#707073'
	        }
	    },
	    drilldown: {
	        activeAxisLabelStyle: {
	            color: '#F0F0F3'
	        },
	        activeDataLabelStyle: {
	            color: '#F0F0F3'
	        }
	    },
	    navigation: {
	        buttonOptions: {
	            symbolStroke: '#DDDDDD',
	            theme: {
	                fill: '#505053'
	            }
	        }
	    },
	    // scroll charts
	    rangeSelector: {
	        buttonTheme: {
	            fill: '#505053',
	            stroke: '#000000',
	            style: {
	                color: '#CCC'
	            },
	            states: {
	                hover: {
	                    fill: '#707073',
	                    stroke: '#000000',
	                    style: {
	                        color: 'white'
	                    }
	                },
	                select: {
	                    fill: '#000003',
	                    stroke: '#000000',
	                    style: {
	                        color: 'white'
	                    }
	                }
	            }
	        },
	        inputBoxBorderColor: '#505053',
	        inputStyle: {
	            backgroundColor: '#333',
	            color: 'silver'
	        },
	        labelStyle: {
	            color: 'silver'
	        }
	    },
	    navigator: {
	        handles: {
	            backgroundColor: '#666',
	            borderColor: '#AAA'
	        },
	        outlineColor: '#CCC',
	        maskFill: 'rgba(255,255,255,0.1)',
	        series: {
	            color: '#7798BF',
	            lineColor: '#A6C7ED'
	        },
	        xAxis: {
	            gridLineColor: '#505053'
	        }
	    },
	    scrollbar: {
	        barBackgroundColor: '#808083',
	        barBorderColor: '#808083',
	        buttonArrowColor: '#CCC',
	        buttonBackgroundColor: '#606063',
	        buttonBorderColor: '#606063',
	        rifleColor: '#FFF',
	        trackBackgroundColor: '#404043',
	        trackBorderColor: '#404043'
	    }
	});
}
</script>
</html>