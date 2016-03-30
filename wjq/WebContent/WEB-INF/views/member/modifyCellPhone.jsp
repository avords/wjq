<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
	request.setAttribute("dynamicDomain", dynamicDomain);
%>
<!DOCTYPE html>
<html>
<head>
<jdf:themeFile file="css/home_merber.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<jdf:themeFile file="ajaxfileupload.js" />
<title>手机号码修改</title>
<style type="text/css">
	.loginClass{
 		font-size:14px;
 		height:24px;
 		width:260px;
 		border:0px ;
 		box-shadow: inset 1px 1px 5px #d5e0e9;
 		margin-left: -20px;
	}
    
    .mytitle{
       font-size:15px; 
    }
    .help-block {
	color: red;
	font-size:14px
	}
</style>
<script type="text/javascript">
	var processMessage = "";
	$(function() {
		$("#vForm").validate({
			rules : {
				cellPhone : {
					required : true,
					maxlength:11,
					minlength:11,
					remote : {
	                    url : "${dynamicDomain}/member/checkCellPhone",
	                    type : "post",
	                    data: {
	                        value: function () {
	                            return $('#cellPhone').val();
	                        }
	                    },
	                    dataType : "json"
	                }
				},
			},
			
			messages : {
				cellPhone : {
					required : '手机号不能为空',
					maxlength:'手机号格式有误！',
					minlength:'手机号格式有误！',
					remote: "该手机号已注册"
				},
			},
			highlight : function(element) {
				$(element).closest('.form-group').addClass('has-error');
			},
			unhighlight : function(element) {
				$(element).closest('.form-group').removeClass('has-error');
			},
			errorElement : 'span',
			errorClass : 'help-block',
			errorPlacement : function(error, element) {
				if (element.parent('.input-group').length) {
					error.insertAfter(element.parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
	});
	
	
	/*验证码 */
	var countdown=120; 
	function settime(obj) { 
    	if (countdown == 0) { 
        	obj.removeAttribute("disabled");    
        	obj.value="获取验证码"; 
        	countdown = 120; 
        	return;
   		 } else { 
        	obj.setAttribute("disabled", true); 
        	obj.value="重新发送(" + countdown + ")"; 
        	countdown--; 
    	} 
		setTimeout(function() { 
    		settime(obj) }
    		,1000) 
} 
	var tempCode;
	function getValidateCode(obj){
		var cellPhone=$("#cellPhone").val();
		if(cellPhone!=""){
			settime(obj);
			$.ajax({
	            url:"${dynamicDomain}/member/sendCode",
	            type : 'post',
	            dataType : 'json',
	            data:{'cellPhone':cellPhone},
	            success : function(json) {
	            	if(json.flag){
	            		var temp=json.message;
	            		tempCode=json.tempCode;
	        			var x =document.getElementById("msg");
	        			x.innerHTML=temp;
	            	}else{
	            		var temp=json.message;
	        			var x =document.getElementById("msg");
	        			x.innerHTML=temp;
	            	}
	            }
	        });
		}
		else{
			alert("请输入电话号码！");
			return;
		}
	}
	
	 function submitForm(){
		var tempCodeOfForm=$("#tempCode").val();
		if(tempCode==tempCodeOfForm&&tempCodeOfForm!=""){
			$("#vForm").submit();
		}else{
			alert("您输入的验证码有误！");
			return;
		}
	} 
	
	
</script>
</head>
<body>
	<div class="box clearfix">
		<div class="container">
			<div class="merberNav">
				<div class="subNav">
					<h3 class="borderNone">
						<i class="icon_1"></i><a href="#">账户首页</a><span></span>
					</h3>
				</div>
				<div class="subNav">
					<h3>
						<i class="icon_2"></i>订单中心<span></span>
					</h3>
					<ul>
						<li><a href="${dynamicDomain }/home/myOrder/listMyOrder">我的订单</a></li>
						<li><a href="#">我的评价</a></li>
					</ul>
				</div>
				<div class="subNav">
					<h3>
						<i class="icon_3"></i>资产中心<span></span>
					</h3>
					<ul>
						<li><a href="#">交易记录</a></li>
						<li><a href="#">余额充值</a></li>
						<li><a href="#">我的积分</a></li>
						<li><a href="#">优惠券</a></li>
					</ul>
				</div>
				<div class="subNav">
					<h3>
						<i class="icon_4"></i>社区中心<span></span>
					</h3>
					<ul>
						<li><a href="#">我的发言</a></li>
					</ul>
				</div>
				<div class="subNav">
					<h3>
						<i class="icon_5"></i>个人设置<span></span>
					</h3>
					 <ul>
          				<li><a href="${dynamicDomain}/member/modify">基本资料</a></li>
          				<li><a href="${dynamicDomain}/member/modifyPassword">修改密码</a></li>
       				 </ul>
				</div>
				<div class="subNav">
					<h3>
						<i class="icon_6"></i><a href="#">退出</a><span></span>
					</h3>
				</div>
			</div>
			<div class="merberBody">
				<div class="ind-info">
					<dl>
						<dt class="avatar">
							<c:choose>
								<c:when test="${empty member.pictureAddress }">
									<img id="imageId"  src="<jdf:theme/>img/home/default_tx.jpg" />
								</c:when>
								<c:otherwise>
									<img id="imageId" src="${dynamicDomain}${member.pictureAddress}" />
								</c:otherwise>
							</c:choose>
						</dt>
						<dd>
							<div class="cont1">
								你好，<span class="red">${member.loginName} </span>！尽情享受一天宁静的时光吧！
							</div>
							<div class="cont2">
								昵称：${member.name} ｜ <span class="icon"><a
									class="tb1" href="#"></a><a class="tb2" href="#"></a><a
									class="tb3" href="#"></a></span> ｜ 会员等级：<span class="red">VIP客户</span>
								｜ 注册时间：2015.-12-08
							</div>
						</dd>
					</dl>
					<div class="tips">
						待付款：<span class="red">0</span> 待评价：<span class="red">2</span>
						<div style="float: right;">
							可用优惠券：<span class="red">0</span> 张 我的余额：<span class="red">5000</span>元
							<a class="recharge" href="#">充值</a>
						</div>
					</div>
				</div>


				<div class="ind-box" >
					<div class="title" >手机号码修改</div><hr style="border: 1px solid #f2f2f2;">
					<form id="vForm" name="vForm" action="${dynamicDomain}/member/saveCellPhone" class="form-horizontal">
							<table style="height:150px;width:300px;margin: 0px auto;">
								<tr>
									<td><label class="mytitle" for="cellPhone">手机号:</label></td>
									<td><input type="text" id="cellPhone" name="cellPhone" value="${member.cellPhone}" class="loginClass" style="width:100px;"></td>
								</tr>
								<tr>
									<td><label class="mytitle">验证码:</label></td>
									<td style="width:200px;"><input type="text" id="tempCode" name="tempCode" class="loginClass"   style="width:100px;">
									<input type="button" id="btn" value="获取验证码" onclick="getValidateCode(this)"/></td>
								</tr>
								
								<tr>
									<td><input type="button" value="返回" class="btn" onclick="window.location='<%=dynamicDomain%>/member/memberCenter';"></td>
									<td><input type="button"  id="save" value="保存" onclick="submitForm()" class="btn "></td>
								</tr>
							</table>
							<span id="msg" style="color:red;font-size:14px;position: relative;top:-82px;left:510px;">${message }</span>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="Member" />
</body>
</html>