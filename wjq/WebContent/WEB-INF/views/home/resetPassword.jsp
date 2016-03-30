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
<title>重置密码</title>
<jdf:themeFile file="css/home_login.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<script type="text/javascript">
	$(function() {
		$("#vForm").validate({
			rules : {
				password : {
					required : true,
					minlength:6,
					maxlength:16
					
				},
				
				password2 : {
					required : true,
					minlength:6,
					maxlength:16,
					equalTo:'#password'
				}
			},
			messages : {
				password : {
					required : '密码不能为空',
					minlength:'密码设置最少要6位',
					maxlength:'超过了密码设置的最大长度16位'
				},
				
				password2 : {
					required : '密码不能为空',
					minlength:'密码设置最少要6位',
					maxlength:'超过了密码设置的最大长度16位',
					equalTo:'两次设置的密码不一致'
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
					error.appendTo( element.parent());
				} else {
					error.appendTo( element.parent());
				}
			}
		});
		$("#password").focus();
	});
	
</script>
</head>

<body>
<div class="box">
  <div class="wrap">
  	<div class="login-wrap">
  		<div class="title">重置密码</div>
	     <form id="vForm" name="vForm" action="${dynamicDomain}/home/update" method="post" >
	     	<input  type="hidden" name="email" id="account"  value="${account }"/>
	      <div class="cont">
	      	<div class="row">
	      	<input class="text-input" type="password" name="password" id="password"  placeholder="请输入新密码" />	<span class="red">*</span>
	        </div>
	      	<div class="row">
	      	<input class="text-input" type="password" name="password2" id="password2" placeholder="请再次输入密码" /><span class="red"> *</span></div>  
	        <div class="row">
	          <input class="login-btn" value="重置密码" type="submit" name="submit">
	        </div>
	      </div>
	      </form>
    </div>
  </div>
</div>
</body>
</html>
