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
    
</head>
<body>

 <%@ include file="/common/top.jsp" %>
 
<div class="container clearfix">
    <%@ include file="/common/menu.jsp" %>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>欢迎使用管理系统。</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <div class="jumbotron" style="height: 300px;background-color: #ccc;font-size: 30px;font-weight: bold;line-height: 300px;padding-left: 100px">
                 <span>欢迎使用游戏商城</span>
				</div>
            </div>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>