<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
   <title>后台管理中心</title>  
    <script src="${ctx}/resource/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/main.css"/>
     <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
    <link rel="stylesheet" href="${ctx}/resource/css/reset.css" />
	<link rel="stylesheet" href="${ctx}/resource/css/style.css" />
	<script src="${ctx}/resource/js/Ecalendar.jquery.min.js"></script>
</head>
<body>

 <%@ include file="/common/top.jsp" %>
 
<div class="container clearfix">
     <%@ include file="/common/menu.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">
<style>
.content-title{
	width:100%;
	text-align: center;
	font-size:20px;
	margin:10px 0px;
}
.content-sub{
	width:100%;
	text-align: center;
	font-size:15px;
	margin:10px 0px;
}
.content-detail{
	width:100%;
	font-size:15px;
}
</style>
        <div class="crumb-wrap">
            <div class="crumb-list">
	            <i class="icon-font"></i>
	            <a href="">首页</a>
	            <span class="crumb-step">&gt;</span>
	            <a href="javascript:void(0)" onclick="javascript:history.back(-1);">返回</a>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                	<div class="content-title">
                		<span>${obj.title }</span>
                	</div>
                	<div class="content-sub">
                		<span>发布人：${obj.field0}</span>
                		<span>发布时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${obj.createTime}" /></span>
                	</div>
                	
                	<div class="content-detail">
                		<c:out value="${obj.content}" escapeXml='false'></c:out>
                	</div>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
<script type="text/javascript">
		$(function(){
				$("#ECalendar_case1").ECalendar({
						 type:"date",
						 skin:"#233",
						 offset:[0,2]
				});
				$("#ECalendar_case2").ECalendar({
						 type:"time",
						 offset:[0,1]
				});
				$("#ECalendar_case3").ECalendar({
						 type:"date",
						 stamp:false,
						 skin:5,
						 format:"yyyy年mm月dd日",
						 callback:function(v,e)
						 {
							 $("#ECalendar_case3").val(v)
						 }
				});
		})
	</script>
</html>