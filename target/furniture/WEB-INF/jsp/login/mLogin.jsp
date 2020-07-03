<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>
     <link type="text/css" rel="stylesheet" href="${ctx}/resource/ml/css/style.css">
</head>
<style>
body {
    background: url('${ctx}/resource/ml/images/banner3.jpg')no-repeat;
    background-size: cover;
    padding: 70px 0px 70px 0px;
    min-height: 900px;
    font-family: 'Roboto', sans-serif;
    font-size: 100%;

}
</style>
<body>
<!--header start here-->
	<div class="login" style="opacity: 0.6;">
		 <div class="login-main">
		       <form name="form1" method="post" action="${ctx}/login/toLogin" autocomplete="off">
		 		<div class="login-top">
		 			<h1>管理员登录</h1>
		 			<input type="text" id="userid" name="userName" placeholder="　输入账号" value="admin">
		 			 <input type="password" id="pwd" name="passWord" placeholder="　输入密码" value="111111">
		 			<div class="login-bottom">
			 			<div class="clear"> </div>
		 			</div>
		 			<input type="submit" value="登录" />
		 		</div>
		 		
		 		
		 		</form>
		 	</div>
  </div>
<!--header end here-->
<div style="text-align:center;">
</div>
</body>
</html>