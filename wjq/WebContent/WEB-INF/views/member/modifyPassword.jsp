 	<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<!doctype html>
<html>
<head>
<jdf:themeFile file="css/home_merber.css" />
<jdf:themeFile file="jquery-1.42.min.js" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<meta charset="utf-8">
<style type="text/css">
	.loginClass{
 		font-size:14px;
 		height:24px;
 		width:160px;
	}
</style>
<title>会员中心-首页</title>
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
    request.setAttribute("dynamicDomain",dynamicDomain);
%> 
<jdf:themeFile file="css/home_merber.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<script type="text/javascript">
	var processMessage = "";
	$(function() {
		$("#vForm").validate({
			rules : {
				password : {
					required : true,
					maxlength:32,
					minlength:6
				},
				password : {
					required : true,
					minlength:6,
					maxlength:16
					
				},
				confirmPassword : {
					required : true,
					equalTo:'#password'
				},
			},
			
			messages : {
				password : {
					required : '密码不能为空',
					maxlength:'密码长度不超过16位',
					minlength:'密码长度不低于6位'
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
	function info(){
		alert("密码修改后即将重新登陆!");
		
	}
</script>
</head>
<body>
	<!--/主导航-->
	<div class="box clearfix">
		<div class="container">
			<%@ include file="member_left.jsp" %>
			<div class="merberBody">
				<%@ include file="member_header.jsp" %>
				<div class="ind-box" style="background:#EAEAAE">
					<div class="title">密码修改</div>	 
						<jdf:form bean="entity" scope="request">
							<form method="post" action="${dynamicDomain}/member/savePassword"  id="vForm" name="vForm">
							   <div class="divCenter" style="margin:0 auto;width:400px;height:auto">
									<input type="hidden" name="objectId">
					 					<div class="row">
											<div class="col-sm-12 alert alert-info" id="messageBox">
												${message}
											</div>
										</div>
							<div class="row">
								<div class="col-sm-6 col-md-6">
									<div class="form-group">
										<label for="password" >
											新的密码:
										</label>
										<input type="password" class="loginClass" name="password" id="password" placeholder="新密码"  value="">
									</div>
								</div>
								<div class="col-sm-6 col-md-6" style="margin-top: 10px">
									<div class="form-group">
										<label for="confirmPassword"  >
											再输一遍:
										</label>
										<input type="password" class="loginClass"   name="confirmPassword" id="confirmPassword" placeholder="再输一遍">
									 </div>
								</div>
							</div>
				 	  		<div class="row">
								<div class="col-sm-12 col-md-6" style="margin-top: 10px;margin-left: 50px">
									<div class="pull-right">
							 		 	<button type="submit" class="btn btn-primary" onclick="info()">
											<span class="glyphicon glyphicon-ok"></span>
											重置
										</button>
									</div>
								</div>
							</div>
						  </div>
						</form>
					</jdf:form>
				</div>
			 </div>
		</div>
	</div>
</body>
</html>
	
