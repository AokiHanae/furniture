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
                <form action="${ctx}/itemOrder/findBySql" method="post">
                    <table class="search-tab">
                        <tr>
                            <!-- <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id="">
                                    <option value="">全部</option>
                                    <option value="19">精品界面</option><option value="20">推荐界面</option>
                                </select>
                            </td> -->
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="订单号" name="code" value="${obj.code}" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
<!--  <result property="id" column="id"  jdbcType="INTEGER"/>
        <result property="itemId" column="item_id"  jdbcType="INTEGER"/>
        <result property="userId" column="user_id"  jdbcType="INTEGER"/>
        <result property="code" column="code"  jdbcType="VARCHAR"/>
        <result property="addTime" column="addTime"  jdbcType="TIMESTAMP"/>
        <result property="total" column="total"  jdbcType="VARCHAR"/>
        <result property="isDelete" column="isDelete"  jdbcType="INTEGER"/>
        <result property="status" column="status"  jdbcType="INTEGER"/>
         <result property="addressId" column="addressId"  jdbcType="INTEGER"/>
         <association property="user" column="user_id" select="com.neusoft.mapper.UserMapper.load"/>
        <collection property="details" column="id" 
                ofType="com.neusoft.po.OrderDetail" select="com.neusoft.mapper.OrderDetailMapper.listByOrderId"/> -->
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab"  width="100%">
                        <tr>
                            <th style="text-align: center;width:20%;">订单号</th>
                            <th style="text-align: center;width:20%;">下单时间</th>
                            <th style="text-align: center;width:15%;">总金额</th>
                            <th style="text-align: center;width:10%;">下单人</th>
                            <th style="text-align: center;width:15%;">订单状态</th>
                            <th style="text-align: center;width:25%;">操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
                        </tr>
                        
                  <c:forEach items="${pagers.datas}" var="data" varStatus="l">
	                  <tr>
	                    <td>${data.code}</td>
	                    <td><fmt:formatDate value="${data.addTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                    <td >${data.total} </td>
	                    <td>${data.user.userName}</td>
	                    <td style="color: red">
		                  <c:if test="${data.status == 0}"> 待发货</c:if>
	                      <c:if test="${data.status == 1}"> 已取消</c:if>
	                      <c:if test="${data.status == 2}"> 待收货</c:if>
	                      <c:if test="${data.status == 3}"> 已收货</c:if>
	                      <c:if test="${data.status == 4}"> 已评价</c:if>
	                      <c:if test="${data.status == 5}"> 退货确认(${data.content})</c:if>
	                      <c:if test="${data.status == 6}"> 已退货(${data.content})</c:if>
	                    </td>
	                   <td>
	                        <a class="link-update" href="${ctx}/orderDetail/ulist?orderId=${data.id}">查看购买商品</a>
	                        <c:if test="${data.status == 0}">
	                        	<a class="link-update" href="${ctx}/itemOrder/fh?id=${data.id}">去发货</a>
	                        </c:if>
	                        <c:if test="${data.status == 5}">
	                        	<a class="link-update" href="${ctx}/itemOrder/thConfirm?id=${data.id}">确认退货</a>
	                        </c:if>
	                    </td> 
	                </tr>
                  </c:forEach>
                  
                  
                   <tr>
        <td colspan="8">
		        <div class="pagelist">
		        <!-- 分页开始 -->
					      <pg:pager  url="${ctx}/itemOrder/findBySql" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
					        
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