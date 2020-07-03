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
   <title>帖子列表</title>
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
	<a href="#" class="c_66">帖子列表</a>
</div>
<style>
.mR {
    display: block;
    float: left;
    font-size: 14px;
    color: #000;
    width: 58px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    border-right: 1px solid #ddd;
    overflow: hidden;
    padding:0px 10px;
}
</style>
<div class="width1198 center_yh" style="height:35px;background:#f0f0f0;border:1px solid #ddd;margin-top:25px;">
	<a href="${ctx}/userPost/homelist" class="mR">热门帖子</a>
	<a href="${ctx}/userPost/homelist?userId=${sessionScope.user.id}" class="mR">我的帖子</a>
	<a href="${ctx}/userPost/homeadd?userId=${sessionScope.user.id}" class="mR">我要发帖</a>
    <script>
    	$(".mR").click(function(){
    		var src = '${ctx}/resource/user/images/gg2.png';
    		//alert(src);
    		$(this).addClass("on");
			//$(this).addClass("on").find("img").attr("src",src);
			//$(this).siblings().removeClass("on");
			})
    </script>
</div>
<style>
.mylistul {
    width: 1220px;
    height: auto;
    overflow: hidden;
}
.list-item{
	display: flex;
	width:100%;
	flex-direction:row;
	align-items:center;
	margin: 5px 0px;
	padding-bottom:5px;
	border-bottom: 2px solid #D8BFD8
}

.mybjk {
    width: 90%; 
/*     height: 160px; */
    display: block;
    overflow: hidden;
    color:black;
}
.item-title{
	width:20%;
}
.item-content{
	width:60%;
}
.item-user{
	width:5%;
}
.item-date{
width:15%;
}

.myaction{
    margin: 5px 0px;
    padding-bottom: 5px;
    border-bottom: 2px solid #D8BFD8;
}
.commentDel{
	cursor: pointer;
 	padding:0px 10px; 
	background-color: #6495ED;
	color:white;
	float:right;
}
.mylistul li{
	display: flex;
	width:100%;
	flex-direction:row;
	align-items:center;
}
</style>
<!--商品列表-->
<div class="width1200 center_yh hidden_yh" style="margin-top:25px;">
    <ul class="mylistul">
     <c:forEach items="${pagers.datas}" var="data" varStatus="l">
        <li>
            <a href="${ctx}/userPostComment/findByObjHome?postId=${data.id}" class="mybjk">
            	<div class="list-item">
            		<span class="item-title">${data.title }</span>
            		<div class="item-content">
            			  <c:if test="${fn:length(data.content) > 40 }">  
            				<c:out value="${fn:substring(data.content, 0, 40)}......" escapeXml="true"/>
	                      	
    					  </c:if>  
    					  <c:if test="${fn:length(data.content) <= 40 }">  
    					  <c:out value="${data.content} " escapeXml="true"/>
	                      	
    					  </c:if>  
            		</div>
            		<span class="item-user">${data.field0 }</span>
            		<span class="item-date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${data.createTime}" /></span>
            	</div>
            </a>
            <div class="myaction">
          	<c:if test="${sessionScope.user.id==data.userId }">
      				<span id="goToUpdatePage" class="commentDel" onclick="goToUpadtePage(${data.id})" href="#" >修改</span>
      				<span id="commentDel" class="commentDel" onclick="deletePost(${data.id})" href="#" >删除</span>
      		</c:if>
          	<c:if test="${sessionScope.user.id!=data.userId }">
      				<span onclick="detail(${data.id})"  class="commentDel" style="padding:0px 20px">查看详情</span>
      		</c:if>
            </div>
        </li>
     
     </c:forEach>
    </ul>
</div>
<script type="text/javascript">
function detail(id){
	window.location.href="${ctx}/userPostComment/findByObjHome?postId="+id; 
}


$(function() {
    $("#goToUpdatePage").click(function(event) {
        event.stopPropagation();
        
    });
});
function goToUpadtePage(id){
	window.location.href="${ctx}/userPost/homeupdate?id="+id;
}
function deletePost(id){
	var url="${ctx}/userPost/delete.json";
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
</script>
<div id="navs">
     <div class="pagelist">
		        <!-- 分页开始 -->
					      <pg:pager  url="${ctx}/userPost/findByObj" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
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
    
 <%@ include file="/common/ufooter.jsp" %>

</body>
</html>