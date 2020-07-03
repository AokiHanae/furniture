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
   <title>订单退货</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/resource/user/css/style.css">
	<script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
	<script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
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
    </div>
</div>


<!--当前位置-->
<div class="width1200 center_yh hidden_yh font14" style="height:40px;line-height:40px;">
	<span>当前位置:</span><a href="#" class="c_66">首页></a><a href="#" class="c_66">我的账户></a>
</div>
<div class="width100 hidden_yh" style="background:#f0f0f0;padding-top:34px;padding-bottom:34px;">
	<div class="width1200 hidden_yh center_yh">
    	<div id="vipNav">
           <a href="${ctx}/user/view" >个人信息</a>
            <a href="${ctx}/itemOrder/my"  class="on">我的订单</a>
            <a href="${ctx}/sc/findBySql">商品收藏</a>
            <a href="${ctx}/login/pass">修改密码</a>
        </div>
        <div id="vipRight">
            <div class="font24" style="height:60px;line-height:60px;text-indent:50px;background:#f5f8fa;width:938px;border:1px solid #ddd;">
            	商品退货
         	</div>
         	
         	<form action="${ctx}/itemOrder/thUpadte" method="post" id="myf">
         	  <input type="hidden" name="id" value="${id}">
            <div class="bj_fff hidden_yh" style="width:838px;border:1px solid #ddd;margin-top:29px;padding:50px;">
            	 <div class="width100" style="height:32px;line-height:32px;margin:10px 0px;">
                	<div class="left_yh font16 tright" style="width:120px;"><font class="red">*</font>退款方式：</div>
                	<select id="refundWay" name="refundWay" style="width:303px;border:1px solid #ddd;outline:none;">
                		<option value="原路返回">原路返回</option>
                		<option value="支付宝">支付宝</option>
                		<option value="微信">微信</option>
                	</select>
                </div>
                <div class="width100" style="height:32px;line-height:32px;">
                	<div class="left_yh font16 tright" style="width:120px;"><font class="red">*</font>退货缘由：</div>
                    <input type="text" id="jiu" name="content"  style="width:303px;border:1px solid #ddd;outline:none;height:30px;text-indent:10px;">
                </div>
                <div class="width100" style="height:32px;line-height:32px; margin:10px 0px;">
                	<div class="left_yh font16 tright" style="width:120px;"><font class="red">*</font>退货备注：</div>
                	<textarea rows="" cols="" id="remark" placeholder="如果退款方式为支付宝或者微信等，请填写账号信息" name="remark" style="width:303px;border:1px solid #ddd;outline:none;height:100px;text-indent:10px;"></textarea>
                	</div>
                 <div class="width100" style="height:32px;line-height:32px;margin-top:83px;">
                	<a href="javascript:void(0)" class="left_yh block_yh font16 tcenter ff5802 con" style="width:244px;height:33px;line-height:33px;margin-left:120px;">保存</a>
                </div>
            </div>
            </form>
    	</div>
    </div>    
</div>
</body>
<script type="text/javascript">
		$(function(){
			
			$(".con").click(function(){
				$("#myf").submit();
			});
			
		});
	</script>
</html>