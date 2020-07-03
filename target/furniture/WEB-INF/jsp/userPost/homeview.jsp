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
	<a href="#" class="c_66">帖子详情</a>
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
	margin:10px 0px;
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
.list-item a{
	cursor: pointer;
	padding:2px 5px;
	background-color: #6495ED;
	color:white;
	float:right;
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
 <div class="result-content">
       	<div class="content-title">
       		<span>${userPost.title }</span>
       	</div>
       	<div class="content-sub">
       		<span>发布人：${userPost.field0}</span>
       		<span>发布时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${userPost.createTime}" /></span>
       	</div>
       	
       	<div class="content-detail">
       		<c:out value="${userPost.content}" escapeXml='false'></c:out>
       	</div>
   </div>
</div>
<div class="content-comment">
	<div class="comment-list">
		<span>评论列表</span>
	</div>
  <ul class="mylistul">
     <c:forEach items="${pagers.datas}" var="data" varStatus="l">
        <li>
        	<div class="list-item">
        		<span style="width:50px;display:inline-block;">${data.userName }</span>
        		<span class="item-date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${data.createTime}" /></span>
        		<c:if test="${sessionScope.user.id==data.userId }">
        		<a id="commentDel" onclick="deleteCom(${data.id})" href="#" >删除</a>
        		</c:if>
        		<div class="item-content">
        			${data.content}
        		</div>
        	</div>
        </li>
     </c:forEach>
    </ul>
</div>
<input id="postId" name="postId" type="hidden" value="${userPost.id}">
<div class="commentSubmit">
	<span class="title">请输入评论内容</span>
	<input name="content" id="content"/>
	<c:if test="${sessionScope.user==null}">
		<a href="${ctx}/login/uLogin">请先登录</a>
	</c:if>
	<c:if test="${sessionScope.user!=null}">
		<a id="mysubmit">提交</a>
	</c:if>
	
</div>
<script>
function deleteCom(id){
	var url="${ctx}/userPostComment/delete.json";
	$.post(url,{"id":id},function(res){
		
		console.log(res);
		console.log(typeof res);
		if(typeof res=='string'){
			res=JSON.parse(res);
		}
		if(res.code=='0000'){
			alert("删除成功！");
			location.reload();
		}else{
			alert(res.message);
		}
	});
}


	$("#mysubmit").click(function(){
		var content=$("#content").val();
		if(content==null||content==''){
			alert("请输入评价内容！");
			return false;
		}
		var postId=$("#postId").val();
		var url="${ctx}/userPostComment/exAddJson";
		$.post(url,{"content":content,"postId":postId},function(res){
			console.log(res);
			res=JSON.parse(res);
			if(res.code=='0000'){
				alert("添加成功！");
				location.reload();
			}else{
				alert(res.message);
			}
		});
		
	});
</script>

<div id="navs">
<div class="pagelist">
     <!-- 分页开始 -->
      <pg:pager  url="${ctx}/userPostComment/findByObjHome?postId=${obj.postId}" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
		<pg:last>  
			共${pagers.total}记录,共${pageNumber}页,  
		</pg:last>  
			当前第${curPage}页 
        <pg:first>  
    		<a href="${pageUrl}">首页</a>  
		</pg:first>  
		<pg:prev>  
    		<a href="${pageUrl}">上一页</a>  
		</pg:prev>  
       	<pg:pages>  
        	<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">[${pageNumber }]</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">${pageNumber}</a>  
            	</c:otherwise>  
        	</c:choose>  
    	</pg:pages>
             
        <pg:next>  
    		<a href="${pageUrl}">下一页</a>  
		</pg:next>  
		<pg:last>  
			<c:choose>  
            	<c:when test="${curPage eq pageNumber}">  
                	<font color="red">尾页</font>  
            	</c:when>  
            	<c:otherwise>  
               		<a href="${pageUrl}">尾页</a>  
            	</c:otherwise>  
        	</c:choose> 
    		  
		</pg:last>
	</pg:pager>
</div>
</div>
	
<input type="hidden" id="id" value="${obj.id}">
<script src="${ctx}/resource/user/js/163css.js"></script>
<script src="${ctx}/resource/user/js/lib.js"></script>

	<script type=text/javascript>
           $(function(){			
                  $(".jqzoom").jqueryzoom({
                       xzoom:400,
                       yzoom:400,
                       offset:10,
                       position:"right",
                       preload:1,
                       lens:1
                   });
                   $("#spec-list").jdMarquee({
                       deriction:"left",
                       width:350,
                       height:56,
                       step:2,
                       speed:4,
                       delay:10,
                       control:true,
                       _front:"#spec-right",
                       _back:"#spec-left"
                   });
                   $("#spec-list img").bind("mouseover",function(){
                       var src=$(this).attr("src");
                       $("#spec-n1 img").eq(0).attr({
                           src:src.replace("\/n5\/","\/n1\/"),
                           jqimg:src.replace("\/n5\/","\/n0\/")
                       });
                       $(this).css({
                           "border":"2px solid #ff6600",
                           "padding":"1px"
                       });
                   }).bind("mouseout",function(){
                       $(this).css({
                           "border":"",
                           "padding":"0"
                       });
                   });				
               })
       </script>
</div>
<%@ include file="/common/ufooter.jsp" %>

<script type="text/javascript">

$(function(){
	   $(".addCar").click(function(){
		   var id = $("#id").val();
		   var num = $("#t_a").val();
		   var s = "${ctx}/car/exAdd?itemId="+id+"&num="+num;
		   $.ajax({  
            type : "POST",  //提交方式  
            url : "${ctx}/car/exAdd?itemId="+id+"&num="+num,//路径  
            success : function(result) {//返回数据根据结果进行相应的处理  
            	var re = JSON.parse(result)
            	if (re.res == 0){
            		alert("请登陆");
            		window.location.href = "${ctx}/login/uLogin";
            	}else{
            		window.location.href = "${ctx}/car/findBySql";
            	}
            }  
        }); 
		   /*  window.location.href = "${ctx}/car/exAdd?itemId="+id+"&num="+num; */
	   });
	   
	   //直接提交
	   $(".buy-now").click(function(){
		   var id = $("#id").val();
		   var num = $(".count-input").val();
		   var s = "${ctx}/car/js2?itemId="+id+"&num="+num;
		   $.ajax({  
            type : "POST",  //提交方式  
            url : "${ctx}/car/js2?itemId="+id+"&num="+num,//路径  
            success : function(result) {//返回数据根据结果进行相应的处理  
            	var re = JSON.parse(result)
            	if (re.res == 0){
            		alert("请登陆");
            		window.location.href = "${ctx}/login/uLogin";
            	}else{
            		window.location.href = "${ctx}/car/view";
            	}
            }  
        }); 
		   /*  window.location.href = "${ctx}/car/exAdd?itemId="+id+"&num="+num; */
	   });
});
</script>

</body>
</html>