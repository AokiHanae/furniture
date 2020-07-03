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
   <title>详情</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/resource/user/css/style.css">
	<script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
	<script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
	
	  <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/css/main.css"/>
     <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
    <link rel="stylesheet" href="${ctx}/resource/css/reset.css" />
	<link rel="stylesheet" href="${ctx}/resource/css/style.css" />
	<script src="${ctx}/resource/js/Ecalendar.jquery.min.js"></script>
	
	<style type="text/css">
	
	.highligter{
	 color: red;
	 font-weight: bold;
	}
	</style>
</head>
<body>

 <%@ include file="/common/utop.jsp" %>
<!--导航条-->
<div class="width100" style="height:45px;background:#dd4545;margin-top:40px;position:relative;z-index:100;">
	<!--中间的部分-->	
	<div class="width1200 center_yh relative_yh" style="height:45px;">
    	<!--列表导航(downSlide就显示,否则就不显示)-->
        <!--普通导航-->
        <div class="left_yh font16" id="pageNav">
        	<a href="${ctx}/login/uIndex">首页</a>
        </div>
          <div class="left_yh font16" style="height: 45px">
        	<a href="${ctx}/userPost/homelist" style="line-height: 45px">买家交流</a>
        </div>
    </div>
</div>
<!--当前位置-->
<div class="width1200 center_yh hidden_yh font14" style="height:40px;line-height:40px;">
	<span>当前位置:</span><a href="${pageContext.servletContext.contextPath}/login/uIndex" class="c_66">首页></a>
	<a href="${pageContext.servletContext.contextPath}/userPost/homelist" class="c_66">帖子列表></a>
	<a href="#" class="c_66">我要发帖</a>
</div>
<!--详情-->
<div class="width1200 center_yh hidden_yh">
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
	border-bottom: 2px solid #efefef;
	padding-bottom: 5px;
	min-height:300px;
}
.list-item{
	width:100%;
	margin:5px 0px;
	padding-bottom:10px;
	border-bottom: 2px solid #efefef;
}
.comment-list{
	width:100%;
	background-color:#dd4545;
	color:white;
	padding:10px 0px;
}
.comment-list span{
	margin-left:1%;
}
.commentSubmit{
	display: flex;
	flex-direction:row;
	align-items:center;
	width:99%;
	padding-left:1%;
	height:40px;
	font-size:15px;
}
.commentSubmit title{
	width:10%;
	font-size:20px;
}
.commentSubmit a{
	cursor: pointer;
	padding:10px 15px;
	background-color: #6495ED;
	color:white;
}
.commentSubmit input{
	width:70%;
	margin:0 5%;
	height:40px;
	border:1px solid #e0e0e0;
	border-radius: 200px;
}
</style>
<div class="post_content">
<div class="result-wrap">
      <div class="result-content">
          <form action="${ctx}/userPost/homeExUpdate" method="post" id="myform" name="myform" enctype="multipart/form-data">
              <table class="insert-tab" width="100%">
               <input type="hidden" name="id" value="${obj.id}"/>
                  <tbody>
                  <tr>
                     <th style="width:100px;"><i class="require-red">*</i>帖子主题：</th>
                     <td>
                         <input class="common-text required" value="${obj.title }" style="width:100%;" id="title" name="title" size="50" value="" type="text">
                     </td>
                  </tr>
                      <tr style="padding-top: 30px">
                          <th>帖子详情：</th>
                          <td>
                          
           <!-- 加载编辑器的容器 -->
       <script id="remark_txt_1" name="content" type="text/plain" style="width:100%;height:300px;">${obj.content}</script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var editor = UE.getEditor('remark_txt_1');
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
        UE.Editor.prototype.getActionUrl = function(action) {  
              if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo') {  
                  return '${ctx}/ueditorReq/saveFile';
              } else {  
                  return this._bkGetActionUrl.call(this, action);  
              }  
        }  
    </script>    
                          </td>
                      </tr>
                      <tr>
                          <td colspan="2" style="text-align: center">
                              <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                              <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                          </td>
                      </tr>
                  </tbody></table>
          </form>
      </div>
  </div>
</div>

<script src="${ctx}/resource/user/js/163css.js"></script>
<script src="${ctx}/resource/user/js/lib.js"></script>
</div>
<%@ include file="/common/ufooter.jsp" %>
</body>
</html>