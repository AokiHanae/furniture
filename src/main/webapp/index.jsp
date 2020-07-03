<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript">
function requestJson(){
		$.ajax({
			type:'post',
			url:'requestJson.action',
			contentType:'application/json;charset=utf-8',
			data:'{"username":"手机","address":888}',
			success:function(data){
				alert(data);
				alert(data.address);
			}
		});
		
	}

function requestJsonList(){
	$.ajax({
		type:'post',
		url:'requestJsonList.action',
		contentType:'application/json;charset=utf-8',
		data:'{"username":"手机","address":888}',
		success:function(data){
			$.each(data,function(index,user){
				alert(user.username);
				})
		}
	});
	
}

</script>
	</head>

	<body>
		<input type="button" value="请求是json，输出是json" onclick="requestJson()">
		<input type="button" value="请求是json，输出是jsonList" onclick="requestJsonList()">
		<br>
		This is my JSP page.
		<br>
		<input type="text"   name="username" />
		<input type="text"   name="address" />
		<input type="text"   name="role" />
		<input  type="button"  value="保存">

	</body>
	
	<form action="save.action"  method="post">
		<input type="text" name="user.username" />
	     <input type="submit"  />
	</form>
	
	
</html>
