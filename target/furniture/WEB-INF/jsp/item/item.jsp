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
                <form action="${ctx}/item/findBySql" method="post">
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
                            <td><input class="common-text" placeholder="商品名称" name="name" value="${obj.name}" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="${ctx}/item/add"><i class="icon-font"></i>新增商品</a>
                    </div>
                </div> 
  <!--   private String name;
	private String price;
	private Integer scNum;收藏数
	private Integer gmNum;购买数
	private String url1;
	private String url2;
	private String url3;
	private String url4;
	private String url5;
	private String ms;
	 -->
                <div class="result-content">
                    <table class="result-tab" width="100%" >
                        <tr>
                            <th width="25%" style="text-align: center;">商品名称</th>
                            <th width="10%" style="text-align: center;">商品主图</th>
                            <th width="10%" style="text-align: center;">商品价格</th>
                            <th width="10%" style="text-align: center;">商品折扣</th>
                             <th width="10%" style="text-align: center;">商品库存</th>
                            <th width="10%" style="text-align: center;">商品一级类别</th>
                             <th width="10%" style="text-align: center;">商品二级类别</th>
                             <th width="10%" style="text-align: center;">操&nbsp;&nbsp;&nbsp;&nbsp;作</th>
                        </tr>
                        
                  <c:forEach items="${pagers.datas}" var="data" varStatus="l">
	                  <tr>
	                    <td>${data.name}</td>
	                    <td align="center"><img alt="" src="${data.url1}" style="width: 100px;height: 100px"></td>
	                    <td align="center">${data.price} </td>
	                    <td align="center">${data.zk} </td>
	                    <td align="center">${data.stock} </td>
	                    <td align="center" >${data.yiji.name} </td>
	                    <td align="center" >${data.erji.name} </td>
	                    <td>
	                        <a class="link-update" href="${ctx}/item/update?id=${data.id}">修改</a>
	                        <a class="link-del" href="${ctx}/item/delete?id=${data.id}">下架</a>
	                    </td>
	                </tr>
                  </c:forEach>
                  
                  
                   <tr>
        <td colspan="8">
		        <div class="pagelist">
		        <!-- 分页开始 -->
					      <pg:pager  url="${ctx}/item/findBySql" maxIndexPages="5" items="${pagers.total}"  maxPageItems="15" export="curPage=pageNumber" >
					        
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