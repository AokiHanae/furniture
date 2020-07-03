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
   <title>提交订单</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/resource/user/css/style.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/resource/收银台_files/com_footer.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/resource/收银台_files/com_header.css">
	<script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
	<script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
	<style type="text/css">
	html{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}
	*{box-sizing:content-box}
	body{margin:0;color:#666;font-size:14px;line-height:1.5;font-family:PingFang SC,Hiragino Sans GB,WenQuanYi Micro Hei,tahoma,sans-serif}
	img{border:0;vertical-align:middle}a{color:inherit;cursor:pointer;text-decoration:none}
	a:active,a:hover{outline:0}a,button,input,select{padding:0}
	a:focus,button:focus,input:focus,select:focus{outline:0}
	button,input[type=button],input[type=submit]{-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}
	button,input,select,textarea{margin:0;font:inherit;color:inherit}button{overflow:visible}button,select{text-transform:none}
	button,html input[type=button],input[type=submit]{-webkit-appearance:button;cursor:pointer}input[type=radio]{cursor:pointer}
	input[type=radio]:active{outline:none}ul{margin:0;padding:0;list-style:none}
	h1,h2,h3,h4,h5,h6{margin:0;color:inherit;font-size:14px;font-weight:700;font-family:inherit;-webkit-font-smoothing:antialiased}p{margin:0 0 10px}
	.placeholder{color:#999}body{background:#f8f8f8}#body{padding:20px 0 40px}.container{width:1180px;margin:0 auto}
	.left{float:left;width:220px}.right{float:right;width:950px}.right-widen{width:1180px}.block-left,.block-right{width:50%;float:left}
	.block-right{text-align:right}.clear-fix{*zoom:1}.clear-fix:after,.clear-fix:before{display:table;content:" "}
	.clear-fix:after{clear:both}.mtgroup-header-container{height:162px;background:#fff}.mtgroup-footer-container{height:627px}
	.icon{font-size:0;background-image:url(./img/icon-common@2x.rcJBe.png);background-size:168px}.icon,.icon-sand{display:inline-block}
	.icon-sand{width:20px;height:20px;vertical-align:middle;background-position:0 -63px}
	.icon-ecom{top:5px;left:5px;width:60px;height:60px;position:absolute}
	.icon-close{top:13px;right:13px;width:13px;height:13px;z-index:5;cursor:pointer;position:absolute;background-position:-17px -88px}
	.icon-opinfo{width:48px;height:48px;position:absolute;background-position:-120px 0}
	.icon-qrcode{width:16px;height:16px;margin-right:3px;position:relative;display:inline-block;vertical-align:middle;background-position:0 -88px}
	.icon-clock{width:12px;height:12px;margin-right:5px}@-webkit-keyframes slide-left-in{0%{opacity:0;-webkit-transform:translate3d(-15px,0,0);transform:translate3d(-15px,0,0)}to{opacity:1;-webkit-transform:translateZ(0);transform:translateZ(0)}}@keyframes slide-left-in{0%{opacity:0;-webkit-transform:translate3d(-15px,0,0);transform:translate3d(-15px,0,0)}to{opacity:1;-webkit-transform:translateZ(0);transform:translateZ(0)}}@-webkit-keyframes scale-in{0%{opacity:0;-webkit-transform:scale3d(.8,.8,1);transform:scale3d(.8,.8,1)}to{opacity:1;-webkit-transform:scaleX(1);transform:scaleX(1)}}@keyframes scale-in{0%{opacity:0;-webkit-transform:scale3d(.8,.8,1);transform:scale3d(.8,.8,1)}to{opacity:1;-webkit-transform:scaleX(1);transform:scaleX(1)}}.amount{text-align:right;font-size:14px;color:#f60}.amount-price{font-size:30px;font-family:arial,sans-serif}.btn,.btn-primary{color:#fff;border:none;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;border-radius:2px;letter-spacing:2px;padding:5px 12px 4px;display:inline-block;-webkit-font-smoothing:antialiased}.btn{background-color:#f90;border-radius:100px;background-image:linear-gradient(180deg,#ffa114,#f59300)}.btn:hover{color:#fff;background-color:#f09000;background-image:linear-gradient(180deg,#ff9d0a,#eb8d00)}.btn-primary{border:1px solid #e3e3e3;border-bottom-color:#aaa;background-image:linear-gradient(180deg,#f7f7f7,#dedede)}.btn-primary,.btn-primary:hover{color:#333;background-color:#e9e9e9}.btn-primary:hover{border-color:#e5e5e5;border-bottom-color:#b3b3b3;background-image:linear-gradient(180deg,#fff,#e9e9e9)}.btn-primary:active{border-color:#ddd;border-bottom-color:#aaa;background-color:#efeffe;background-image:linear-gradient(180deg,#ddd,#eee)}.order{line-height:24px;padding:20px;background:#fff;border:1px solid #e5e5e5;border-radius:4px;margin-bottom:10px}.order-name{font-size:20px;color:#222;width:600px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;margin-right:15px}.order-name a{color:#333}.order-info{font-size:16px;color:#666;margin:10px 0}.order .block-left{width:75%;position:relative}.order .block-right{width:25%}.credit{height:61px;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;line-height:60px;border-bottom:1px dashed #e5e5e5;transition:border .1s;font-size:16px}.credit-total{float:left;cursor:pointer;padding-left:10px}.credit-amount{margin-left:10px;font-family:arial,sans-serif}.credit-description{color:#666}.credit-price{color:#f60;font-size:20px;font-family:arial,sans-serif}.credit .block-right{display:none}.credit.disabled{color:#ccc}.modal{display:none;position:fixed}.modal,.modal-mask{top:0;left:0;width:100%;height:100%;z-index:100}.modal-mask{position:absolute;background:#000;background:rgba(0,0,0,.2);filter:alpha(opacity=20)}.modal-box{top:50%;left:50%;z-index:101;overflow:hidden;position:absolute;border:6px solid #bbb;background-color:#fff;-webkit-animation:scale-in both cubic-bezier(.4,0,0,1.5) .3s;animation:scale-in both cubic-bezier(.4,0,0,1.5) .3s}.modal-head{height:40px;position:relative;background-color:#f7f7f7}.modal-title{margin-left:15px;line-height:40px}.modal-body{margin:40px;position:relative}.modal-content{padding-left:90px}.modal-content h3{font-size:16px;line-height:30px;margin-bottom:6px}.modal-content p{margin:0;line-height:20px}.modal-btn-group{margin:15px 0 20px}.modal-btn-group .btn{font-weight:700;padding:7px 20px 6px}.modal-btn-ok{margin-right:15px}.modal-back{cursor:pointer}.modal-back:hover{text-decoration:underline}.modal-input-line{height:64px}.modal-input-line button,.modal-input-line input,.modal-input-line label{float:left}.modal-input-line label{padding-left:5px;line-height:36px;padding-right:10px}.modal-input-password,.modal-input-text{height:24px;padding:5px 8px;line-height:24px;border:1px solid #ddd}.modal-input-password:hover,.modal-input-text:hover{border-color:#aaa}.modal-input-text{width:137px}.modal-input-password{width:230px;font-family:arial,sans-serif}.modal-input-error,.modal-input-error:hover{border-color:#ff8000}.modal-error-msg{top:38px;display:none;color:#f76120;font-size:12px;position:absolute}.modal-error-text{left:60px}.modal-error-password{left:71px}.modal-find-password{right:0;top:38px;color:#00c9b3;font-size:12px;position:absolute}.modal-submit-btn{display:block;font-size:18px;margin-left:120px;padding:6px 20px 5px}.confirm-modal .modal-box{width:466px;height:286px;margin:-143px 0 0 -233px}.timeout-modal .modal-box{width:400px;height:246px;margin:-123px 0 0 -200px}.timeout-modal p{padding:25px 0}.timeout-modal .btn{width:130px;padding-left:0;padding-right:0;margin-left:12px}.weixinqr-modal .modal-box{width:716px;height:438px;margin:-219px 0 0 -358px}.weixinqr-modal p{font-size:18px;text-align:center;line-height:32px;margin-bottom:16px}.weixinqr-modal .modal-info{height:14px;color:#f80;font-size:12px;line-height:1;padding:13px 0;text-align:center;background-color:#f7f7f7}.weixinqr-modal .modal-left{float:left;width:250px;padding:20px 50px 25px 45px}.weixinqr-modal .modal-left span{vertical-align:middle}.weixinqr-modal .modal-right{float:left}.weixinqr-modal .modal-right img{width:371px;height:438px}.weixinqr-modal .orange{color:#f80}.weixinqr-modal .modal-qrcode{width:210px;height:210px;display:block;margin:0 auto 20px}.weixinqr-modal .modal-qr{padding-top:20px;border:1px solid #ddd}.verify-modal .modal-box{width:384px;height:254px;margin:-127px 0 0 -192px}.verify-modal .modal-body{margin:28px 30px}.verify-modal .modal-body p{font-size:18px;text-align:center;margin-bottom:24px}.verify-modal .modal-body form{width:324px;height:103px;position:relative}.verify-modal .modal-sms-btn{width:100px;font-size:14px;margin-left:10px;letter-spacing:0;padding:7px 0 6px;_padding:5px 0 4px}.verify-modal .modal-sms-btn-disabled{color:#bebebe;cursor:default;background:#f8f8f8;border-bottom-color:#e3e3e3}.alert-modal .modal-body{min-height:48px}.alert-modal .modal-box{width:360px;height:auto;margin:-70px 0 0 -180px}.alert-modal .modal-content{color:#333;font-size:16px;padding:12px 0 0 60px}.alert-modal .alert-modal-multi-line{padding-top:3px}.payment{margin-top:30px}.payment-container{background:#fff;border:1px solid #e5e5e5;border-radius:4px;padding:0 20px 50px}.payment-type{position:relative}.payment-menu{height:39px;border-bottom:1px solid #e5e5e5}.payment-tab{float:left;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;line-height:20px;padding:9px 15px;border:1px solid transparent;_border-color:tomato;_-webkit-filter:chroma(color=tomato);_filter:chroma(color=tomato)}.payment-0 .payment-tab-0,.payment-1 .payment-tab-1,.payment-2 .payment-tab-2{color:#000;background:#fff;border:1px solid #ddd;border-bottom:1px solid #fff;border-radius:2px}
	.payment-list{display:block;margin-top:30px}.payment-list li{float:left;width:214px;cursor:pointer;margin:0 0 10px}
	.payment-list input{margin-top:10px;padding:0;vertical-align:top}
	.payment-list input[type=radio]:checked+label{border-color:#00c9b3}
	.payment-bank-tip{font-size:12px;margin:-8px 0 10px}.payment-weak-tip{height:8px;display:block;color:#f60;font-size:12px;line-height:14px;padding-left:20px;white-space:nowrap}.payment-0 .payment-list-0,.payment-1 .payment-list-1,.payment-2 .payment-list-2{display:block}.payment-unfold-list{float:left;cursor:pointer;line-height:34px;margin-left:-10px}.payment-unfold-list:hover{text-decoration:underline}.payment-icon{position:relative;cursor:pointer;margin-left:10px;display:inline-block;border:1px solid #e5e5e5;border-radius:2px;padding-right:4px}.payment-icon img{width:145px;height:32px}.payment-icon:hover+.payment-weak-tip{visibility:visible!important}.payment-submit-area{margin-top:50px}.payment-back,.payment-submit{float:right;margin-top:14px}.payment-submit .btn{font-size:14px;padding:10px 36px;border:none}.payment-back{line-height:40px;margin-right:20px}.payment-back a{font-size:12px;color:#666}.payment-back a:hover{text-decoration:underline}.payment-tips{top:11px;right:0;font-size:12px;position:absolute}.payment-tips li{float:right;line-height:22px;margin-left:15px}.payment-tips-feedback{color:#666}.payment-tips-arrow{position:absolute;width:0;height:0;top:10px;right:5px;border:3px solid transparent;_border-color:tomato;_-webkit-filter:chroma(color=tomato);_filter:chroma(color=tomato);border-top-color:inherit}.payment-dropdown{cursor:pointer;position:relative;padding-right:15px;display:inline-block}.payment-dropdown.hover,.payment-dropdown:hover{zoom:1}.payment-dropdown.hover .payment-dropdown-menu,.payment-dropdown:hover .payment-dropdown-menu{color:#666;display:block;cursor:default}.payment-dropdown-menu{display:none;z-index:2;top:22px;right:-58px;width:260px;padding:15px;font-size:12px;background:#fff;line-height:1.5;position:absolute;border:1px solid #ccc}.payment-dropdown-more{margin-left:15px}.payment-dropdown-more:hover{text-decoration:underline}.payment-collapse h4{zoom:1;color:#333;cursor:pointer;font-size:12px;margin-bottom:5px;padding-left:15px;position:relative;font-weight:400}.payment-collapse p{display:none;color:#666}.payment-collapse-arrow{position:absolute;width:0;height:0;top:7px;left:0;font-size:0;border:4px solid transparent;_border-color:tomato;_-webkit-filter:chroma(color=tomato);_filter:chroma(color=tomato);border-top-color:#666}.payment-collapse-open p{display:block}.payment-collapse-open .payment-collapse-arrow{top:3px;border-top-color:transparent;_border-top-color:tomato;_-webkit-filter:chroma(color=tomato);_filter:chroma(color=tomato);border-bottom-color:#666}.checkbox{float:left;cursor:pointer;margin-top:22px}.checkbox-icon{width:14px;height:14px;display:block;position:relative;background-color:#fff;border:1px solid #ddd;border-radius:2px;transition:background-color .1s}.checkbox-icon:after{top:1px;right:5px;content:"";width:5px;height:10px;position:absolute;border:solid #fff;border-width:0 2px 2px 0;-webkit-transform:rotate(45deg) scale(0);transform:rotate(45deg) scale(0);transition:.2s cubic-bezier(.18,.89,.32,1.28) .1s}.credit-expanded .checkbox-icon:after{-webkit-transform:rotate(45deg) scale(1);transform:rotate(45deg) scale(1)}.checkbox-shim{float:left;display:none;cursor:pointer;margin-top:25px;_margin-top:21px}.cd{height:40px;line-height:40px;margin-bottom:20px;background-color:#fff;box-shadow:0 3px 5px 0 rgba(0,0,0,.1);border-radius:4px;text-align:center;font-size:14px;color:#666}.cd-text{margin-left:8px;vertical-align:middle}.cd-text,.cd-time{display:inline-block}.cd-time{color:#f60;font-size:18px}.common-tip{margin-bottom:10px;text-align:center;position:relative;padding:10px 30px;border-radius:2px;background:#fff6db;border:1px solid #f5d8a7}.pay-tip{display:none;text-align:left}.pay-tip h3{color:#333;font-size:18px;margin-bottom:10px}.pay-tip a{margin-left:20px;display:inline-block}.pay-tip a:hover{text-decoration:underline}.pay-tip-list{list-style:disc;padding-left:20px}.pay-tip-list h5{color:#333}.pay-tip-list p{margin-bottom:5px}.qr{*display:none;background:#fff;border:1px solid #e5e5e5;border-radius:4px}.qr-img{width:218px;height:218px;box-sizing:border-box;padding:15px}.qr-img img{width:100%}.qr-scan,.qr-welcome{font-size:14px;color:#666;line-height:20px;text-align:center}.qr-welcome{margin-top:5px}.qr-welcome span{color:#00c9b3}.qr-scan{margin-top:2px;margin-bottom:20px}.qr-download{margin-top:10px;text-align:center}.qr-download a{font-size:12px;line-height:1;color:#999;text-decoration:underline}.header-search-module{visibility:hidden}.ie-modal .modal-box{font-size:12px;width:560px;height:340px;margin:-180px 0 0 -280px}.ie-modal .modal-box h3{color:#333;font-size:22px}.ie-modal .modal-box a{color:#2bb8aa;cursor:pointer}.ie-modal .modal-box a:hover{text-decoration:underline}.ie-modal .modal-body{margin:30px}.ie-modal .modal-content{padding:0}.ie-modal .btn-primary{float:left;padding:6px 20px}.ie-modal .modal-btn-group{width:310px;margin:10px auto 20px}.ie-browser-list{height:127px;margin:5px 0}.ie-browser-list a{float:left;margin:0 12px;text-align:center}.ie-recommend{margin-top:10px}.ie-browser{display:block;width:100px;height:100px;margin-bottom:5px;background-image:url(./img/icon-browser.3eKRIG.png)}.ie-chrome{background-position:0 -200px}.ie-firefox{background-position:0 -300px}.ie-qq{background-position:0 -100px}.ie8 .modal-btn-group:hover{background:#fff}.ie8 .checkbox{display:none}.ie8 .checkbox-shim{display:inline}.ie8 .icon{background-image:url(./img/icon-common.1XvTdx.png)}.ie8 .icon-sand{background-position:0 -63px}.ie8 .icon-close{background-position:-18px -88px}.ie8 .icon-opinfo{background-position:-120px 0}
	.ie8 .icon-qrcode{background-position:0 -88px}
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
    </div>
</div>


<!--当前位置-->
<div class="width1200 center_yh hidden_yh font14" style="height:40px;line-height:40px;">
	<span>当前位置:</span><a href="#" class="c_66">首页></a><a href="#" class="c_66">购物车></a><a href="#" class="c_66">支付方式</a>
</div>
<!--第一步为on1,on2-->

<!-- <div class="hidden_yh center_yh" style="width:344px;height:82px;margin-top:120px;"> -->
	    <div class="bj_fff hidden_yh center_yh" style="width:838px;border:1px solid #ddd;margin-top:29px;padding:50px;">
                <div class="width100" style="height:32px;line-height:32px;">
	               <div class="width100" style="height:32px;line-height:32px;margin:10px 0px;">
                	<div class="left_yh font16 tright" style="width:120px;"><font class="red">*</font>支付方式：</div>
                	<select id="payWay" name="payWay" style="width:303px;border:1px solid #ddd;outline:none;">
                		<option value="支付宝">支付宝</option>
                		<option value="微信">微信</option>
                		<option value="银联支付">银联支付</option>
                	</select>
                </div>
                <div style="margin-left:100px;">
                	<div class="payment-list payment-list-1">
                	<div class="payment-bank-tip">支持储蓄卡和信用卡，需要开通网银</div>
                	<ul class="clear-fix">
                	<li>
	                	<input type="radio" name="b2cebank" id="b2cebank_189" data-type="qdbpay" data-banktypeid="189" data-bankcode="b2c">
	                	<label class="payment-icon" for="b2cebank_189"><img src="${ctx}/resource/收银台_files/icbc.png" disabled="" alt="中国工商银行"></label>
	                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
                	<input type="radio" name="b2cebank" id="b2cebank_190" data-type="qdbpay" data-banktypeid="190" data-bankcode="b2c">
                	<label class="payment-icon" for="b2cebank_190"><img src="${ctx}/resource/收银台_files/cmb.png" disabled="" alt="招商银行"></label>
                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
	                	<input type="radio" name="b2cebank" id="b2cebank_191" data-type="qdbpay" data-banktypeid="191" data-bankcode="b2c">
	                	<label class="payment-icon" for="b2cebank_191"><img src="${ctx}/resource/收银台_files/ccb.png" disabled="" alt="中国建设银行"></label>
	                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
	                	<input type="radio" name="b2cebank" id="b2cebank_192" data-type="qdbpay" data-banktypeid="192" data-bankcode="b2c">
	                	<label class="payment-icon" for="b2cebank_192"><img src="${ctx}/resource/收银台_files/abc.png" disabled="" alt="中国农业银行"></label>
	                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
	                	<input type="radio" name="b2cebank" id="b2cebank_193" data-type="qdbpay" data-banktypeid="193" data-bankcode="b2c">
	                	<label class="payment-icon" for="b2cebank_193"><img src="${ctx}/resource/收银台_files/boc.png" disabled="" alt="交通银行"></label>
	                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
	                	<input type="radio" name="b2cebank" id="b2cebank_194" data-type="qdbpay" data-banktypeid="194" data-bankcode="b2c">
	                	<label class="payment-icon" for="b2cebank_194"><img src="${ctx}/resource/收银台_files/bofc.png" disabled="" alt="中国银行"></label>
	                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
                	<input type="radio" name="b2cebank" id="b2cebank_195" data-type="qdbpay" data-banktypeid="195" data-bankcode="b2c">
                	<label class="payment-icon" for="b2cebank_195"><img src="${ctx}/resource/收银台_files/spdb.png" disabled="" alt="浦发银行"></label>
                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
                	<input type="radio" name="b2cebank" id="b2cebank_196" data-type="qdbpay" data-banktypeid="196" data-bankcode="b2c">
                	<label class="payment-icon" for="b2cebank_196"><img src="${ctx}/resource/收银台_files/pspc.png" disabled="" alt="中国邮政储蓄银行"></label>
                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
	                	<input type="radio" name="b2cebank" id="b2cebank_352" data-type="qdbpay" data-banktypeid="352" data-bankcode="b2c">
	                	<label class="payment-icon" for="b2cebank_352"><img src="${ctx}/resource/收银台_files/ee150864df5119f003009fa1ae154f902918.png" disabled="" alt="中国民生银行"></label>
	                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
	                	<input type="radio" name="b2cebank" id="b2cebank_400" data-type="qdbpay" data-banktypeid="400" data-bankcode="b2c">
	                	<label class="payment-icon" for="b2cebank_400"><img src="${ctx}/resource/收银台_files/gfyh.png" disabled="" alt="广发银行"></label>
	                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	<li>
                	<input type="radio" name="b2cebank" id="b2cebank_197" data-type="qdbpay" data-banktypeid="197" data-bankcode="b2c">
                	<label class="payment-icon" for="b2cebank_197"><img src="${ctx}/resource/收银台_files/other.png" disabled="" alt="其他银行"></label>
                	<span class="payment-weak-tip" style="visibility:hidden;"></span>
                	</li>
                	</ul>
                	</div>
                </div>
               	<div class="width100" style="height:32px;line-height:32px; margin:10px 0px;">
                	<div class="left_yh font16 tright" style="width:120px;"><font class="red">*</font>支付备注：</div>
                	<textarea rows="" cols="" id="remark" placeholder="如果支付方式为银联支付等，请填写账号信息" name="remark" style="width:303px;border:1px solid #ddd;outline:none;height:100px;text-indent:10px;"></textarea>
               	</div>
                 <div class="width100" style="height:32px;line-height:32px;margin-top:83px;">
                	<a href="${ctx}/car/view?code=${code}"  class="left_yh block_yh font16 tcenter ff5802 con" style="width:244px;height:33px;line-height:33px;margin-left:120px;">提交</a>
                </div>
            </div>
</div>
    
    
 <%@ include file="/common/ufooter.jsp" %>



</body>
</html>