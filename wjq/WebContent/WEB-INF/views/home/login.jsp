<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@page import="com.mvc.framework.config.GlobalConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
	request.setAttribute("dynamicDomain", dynamicDomain);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<jdf:themeFile file="css/home_login.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<jdf:themeFile file="jquery.cookie.js" />
<script type="text/javascript">
	$(function() {
		$('#kaptchaImage').click(
				function() {
					$(this).attr('src','../validate.code?'+ Math.floor(Math.random() * 100));
				});
	
		$("#vForm").validate({
			rules : {
				loginName : {
					required : true
				},
				password : {
					required : true
					
				},
				s_randomCode : {
					required : true,
					remote : '${dynamicDomain}/public/checkConfirmCode'
				}
			},
			messages : {
				loginName : {
					required : '用户名不能为空'
				},
				password : {
					required : '密码不能为空'
				},
				s_randomCode : {
					required : '验证码不能为空',
					remote : '验证码错误'
				}
			},
			highlight : function(element) {
				$(element).closest('.form-group').addClass('has-error');
			},
			unhighlight : function(element) {
				$(element).closest('.form-group').removeClass('has-error');
			},
			errorElement : 'span',
			errorClass : 'red help-block',
			errorPlacement : function(error, element) {
				if (element.parent('.input-group').length) {
					error.insertAfter(element.parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
		$("#loginName").focus();
	});
	
	
	 $(document).ready(function () {
	        if ($.cookie("remember") == "true") {
	        $("#loginName").val($.cookie("loginName"));
	        $("#remember").attr("checked","checked");//根据cookied，判断是否选上
	        }else{
		        $("#loginName").val("");
	        }
	    });

	    //记住用户名密码
	    function save() {
	         if($('input[name="remember"]').prop("checked")) {
	            var str_username = $("#loginName").val();
	            $.cookie("remember", "true", { expires: 7 }); //存储一个带7天期限的cookie
	            $.cookie("loginName", str_username, { expires: 7 });
	        }
	        else {
	            $.cookie("remember",null);
	            $.cookie("loginName",null);
	        }
	    };
</script>
</head>

<body>
<div class="box">
  <div class="wrap">
  	<div class="login-wrap">
    	<div class="title"><span>没有账号？<a href="${dynamicDomain}/home/register">马上注册</a></span>登录</div>
      <form id="vForm" name="vForm" action="${dynamicDomain}/home/login" method="post" >
      <div class="cont">
		<div class="row">
     		<c:if test="${not empty message }">
				<span style="color:#a94442;font-size:14px;">${message }</span>
			</c:if>
        </div>				
      	<div class="row">
      	<input class="text-input" type="text" id="loginName"name="loginName" placeholder="您的用户名" />
        </div>
        <div class="row">
      	<input class="text-input" type="password"  name="password" id="password" placeholder="您的密码" />
        </div>
        <div class="row">
      		<img src="../validate.code"style="height: 30px; width: 80px; vertical-align: middle;"id="kaptchaImage">
      		<input type="text" id="s_randomCode" class="text-input" name="s_randomCode"style=" width: 100px;" placeholder="请输入验证码" />
        </div>
        <div class="row fix">
            <label><input  type="checkbox" id="remember" name="remember" class="remember">记住用户名</label>
             <a class="find" href="${dynamicDomain}/home/findPassword" >忘记密码？</a> 
        </div>
        <div class="row">
            <input class="login-btn" value="登录" type="submit" onclick="save()" name="submit">
        </div>
      </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
