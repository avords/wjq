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
<title>取回密码</title>
<jdf:themeFile file="css/home_login.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<script type="text/javascript">
	$(function() {
		$('#kaptchaImage').click(
				function() {
					$(this).attr('src','../validate.code?'+ Math.floor(Math.random() * 100));
				});
		$("#vForm").validate({
			rules : {
				email : {
					required : true,
					remote:"${dynamicDomain}/home/checkMemberEmail"
					
				},
				s_randomCode : {
					required : true,
					remote : '${dynamicDomain}/public/checkConfirmCode'
				}
			},
			messages : {
				email : {
					required :'请输入邮箱',
					remote:'注册邮箱不存在'
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
		$("#email").focus();
	});
	
	function checkEmailExist(email){
		if(email.length==0){
			return ;
		}
		
	}
</script>
</head>

<body>
<div class="box">
  <div class="wrap">
  	<div class="login-wrap">
  	<div class="title">注册邮箱 </div>
      <form id="vForm" name="vForm" action="${dynamicDomain}/home/sendEmail" method="post" >
      <div class="cont">
      	<div class="row">
     		<c:if test="${not empty message }">
				<span style="color:#a94442;font-size:14px;">${message }</span>
			</c:if>
        </div>	
        <div class="row">
      	<input class="text-input" type="email"  name="email" id="email" placeholder="您的注册邮箱" onblur="checkEmailExist(this.value);"/>
        </div>
        <div class="row">
      		<img src="../validate.code"style="height: 30px; width: 80px; vertical-align: middle;"id="kaptchaImage">
      		<input type="text" id="s_randomCode" class="text-input" name="s_randomCode"style=" width: 100px;" placeholder="请输入验证码" />
        </div>  
        <div class="row">
            <input class="login-btn" value="下一步" type="submit" name="submit">
        </div>
      </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
