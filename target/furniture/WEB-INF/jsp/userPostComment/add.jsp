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

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="">首页</a><span class="crumb-step">&gt;</span></div>
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
        <div class="result-wrap">
            <div class="result-content">
                <form action="${ctx}/item/exAdd" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody>
                        
                        <tr>
                                <th><i class="require-red">*</i>商品名称：</th>
                                <td>
                                    <input class="common-text required" id="title" name="name" size="50" value="" type="text">
                                </td>
                        </tr>
                        
                          <tr>
                                <th><i class="require-red">*</i>商品价格：</th>
                                <td>
                                    <input class="common-text required" id="title" name="price" size="50" value="" type="text">
                                </td>
                        </tr>
                       <tr>
                                <th><i class="require-red">*</i>商品折扣：</th>
                                <td>
                                    <input class="common-text required" id="title" name="zk" size="50" value="" type="text">
                                </td>
                        </tr>
                       <tr>
                                <th><i class="require-red">*</i>商品库存：</th>
                                <td>
                                    <input class="common-text required" id="stock" name="stock" size="50" value="" type="text">
                                </td>
                        </tr>
                        
                        
                        <tr>
                            <th width="120"><i class="require-red">*</i>商品类别：</th>
                            <td>
                                <select name="categoryIdTwo" id="catid" class="required">
                                
                                   <c:forEach items="${types}" var="data" varStatus="l">
                                     <option value="${data.id}">${data.name}</option>
                                   </c:forEach>
                                </select>
                            </td>
                        </tr>
                            
                            <tr>
                                <th><i class="require-red">*</i>主图：</th>
                                <td><input name="file" id="" type="file"></td>
                            </tr>
                            
                              <tr>
                                <th><i class="require-red">*</i>副图1：</th>
                                <td><input name="file" id="" type="file"></td>
                            </tr>
                            
                              <tr>
                                <th><i class="require-red">*</i>副图2：</th>
                                <td><input name="file" id="" type="file"></td>
                            </tr>
                            
                              <tr>
                                <th><i class="require-red">*</i>副图3：</th>
                                <td><input name="file" id="" type="file"></td>
                            </tr>
                            
                              <tr>
                                <th><i class="require-red">*</i>副图4：</th>
                                <td><input name="file" id="" type="file"></td>
                            </tr>
                            
                            <tr style="padding-top: 30px">
                                <th>描述：</th>
                                <td>
                                
                 <!-- 加载编辑器的容器 -->
					        <script id="remark_txt_1" name="ms" type="text/plain" style="width:100%;height:300px;">${t1['plan']['remark'] }</script>
						    <!-- 实例化编辑器 -->
						    <script type="text/javascript">
						        var editor = UE.getEditor('remark_txt_1');
						        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;  
						        UE.Editor.prototype.getActionUrl = function(action) {  
						              if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo') {  
						                  return '${ctx}/ueditor/saveFile';  
						              } else {  
						                  return this._bkGetActionUrl.call(this, action);  
						              }  
						        }  
						    </script>    
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
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