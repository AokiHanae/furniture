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
            <div class="crumb-list"><i class="icon-font"></i><a href="">首页</a></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="${ctx}/userPostComment/findByObj" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="评论人" name="userName" value="${obj.userName}" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%" >
                        <tr>
                            <th width="10%" style="text-align: center;">帖子主题</th>
                            <th width="5%" style="text-align: center;">评论人</th>
                            <th width="30%" style="text-align: center;">评论内容</th>
                            <th width="10%" style="text-align: center;">创建时间</th>
                             <th width="5%" style="text-align: center;">操&nbsp;&nbsp;&nbsp;&nbsp;作</th>
                        </tr>
                        
                  <c:forEach items="${pagers.datas}" var="data" varStatus="l">
	                  <tr>
	                    <td>${data.field0}</td>
	                    <td align="center">${data.userName} </td>
	                    <td align="center">
	                      <c:if test="${fn:length(data.content) > 30 }">  
	                      	${fn:substring(data.content, 0, 30)}......
    					  </c:if>  
    					  <c:if test="${fn:length(data.content) <= 30 }">  
	                      	${data.content} 
    					  </c:if>  
	                    </td>
	                    <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${data.createTime}" /> </td>
	                    <td>
	                        <a class="link-del" href="${ctx}/userPostComment/delete?id=${data.id}">删除</a>
	                    </td>
	                </tr>
                  </c:forEach>
                  
                  
                   <tr>
        <td colspan="8">
		        <div class="pagelist">
		        <!-- 分页开始 -->
					      <pg:pager  url="${ctx}/userPostComment/findByObj" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
					        
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
				 </td>
                    <!-- 分页结束 -->
      			 </tr>
                    </table>
                    
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>