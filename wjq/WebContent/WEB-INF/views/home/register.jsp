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
<title>注册</title>
<jdf:themeFile file="css/home_login.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />
<script type="text/javascript">
	$(function() {
		$("#vForm").validate({
			rules : {
				loginName : {
					required : true,
					maxlength:10,
					 remote : {
	                    url : "${dynamicDomain}/home/register/checkMemberName",
	                    type : "post",
	                    data: {
	                        value: function () {
	                            return $('#loginName').val();
	                        }
	                    },
	                    dataType : "json"
	                }
				},
				password : {
					required : true,
					minlength:6,
					maxlength:16
					
				},
				email : {
					required : true,
					email:true,
					remote : {
		                    url : "${dynamicDomain}/home/register/checkEmailUnique",
		                    type : "post",
		                    data: {
		                        value: function () {
		                            return $('#email').val();
		                        }
		                    },
		                    dataType : "json"
		             }
		             
				},
				password2 : {
					required : true,
					minlength:6,
					maxlength:16,
					equalTo:'#password'
				},
				s_randomCode : {
					required : true,
				  	remote : {
	                    url : "${dynamicDomain}/home/register/checkValidateCode",
	                    type : "post",
	                    data: {
	                    	s_randomCode: function () { return $('#s_randomCode').val();},
	                    	email:function () { return $('#email').val();}
	                    },
	                    dataType : "json"
	                }
				},
				agreeMent : {
					required : true
				}
			},
			messages : {
				loginName : {
					required : '用户名不能为空',
					maxlength:'用户名最大长度10位',
					remote: "该用户已注册",
				},
				password : {
					required : '密码不能为空',
					minlength:'密码设置最少要6位',
					maxlength:'超过了密码设置的最大长度16位'
				},
				email : {
					remote: "该邮箱已注册"
					
				},
				password2 : {
					required : '密码不能为空',
					minlength:'密码设置最少要6位',
					maxlength:'超过了密码设置的最大长度16位',
					equalTo:'两次设置的密码不一致'
				},
				s_randomCode : {
					required : '验证码不能为空',
					remote : '验证码错误'
				},
				agreeMent : {
					required : "请勾选注册协议"
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
		$("#loginName").focus();
	});
	
	function getValidateCode(){
		var email=$("#email").val();
		if(email==null){
			alert("请输入邮箱账号");
			return;
		}
		$.ajax({
            url:"${dynamicDomain}/home/register/sendEmail",
            type : 'post',
            dataType : 'json',
            data:{'email':email},
            success : function(json) {
            	if(json.flag){
            		$("#validateId").attr("value",json.validateId);
            		var temp=json.message;
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
	
	function ifChecked(){
		if(document.getElementById("agreeMent").checked){
			openProtocol();
		}
	}
	
	function openProtocol(){
		document.getElementById("win").style.display="";
		document.getElementById("back").style.display="";//border
		document.getElementById("agreebtn").disabled=true;
		document.getElementById("agreebtn").style.backgroundColor='gray';
		settime(document.getElementById("agreebtn"));
	}
	
	var countdown=8; 
	function settime(obj) { 
    	if (countdown == 0) { 
        	obj.disabled=false;
        	obj.value="同意并继续";
        	obj.style.backgroundColor="red";
        	countdown = 8; 
        	return;
   		 } else { 
        	obj.value="请仔细阅读!(" + countdown + ")"; 
        	countdown--; 
    	} 
		setTimeout(function() { 
    		settime(obj) }
    		,1000) 
       } 
	
	function closeProtocol(){
		document.getElementById("win").style.display="none";
		document.getElementById("back").style.display="none";
		document.getElementById("agreeMent").checked=true;
	}
</script>
</head>
<body>
<div class="box">
  <div class="wrap">
  	<div class="login-wrap">
    	<div class="title"><span>已有账号！请 <a href="${dynamicDomain}/home/login">登录</a></span>注册</div>
     <form id="vForm" name="vForm" action="${dynamicDomain}/home/register/save" method="post" >
     	<input type="hidden" id="validateId" name="validateId">
       <div class="cont">
       <div class="row">
			<span id="msg" style="color:#a94442;font-size:14px;">${message }</span>
        </div>
      	<div class="row">
      	<input class="text-input" type="text" id="loginName"name="loginName"  placeholder="请输入用户名" />	<span class="red"> *</span>
        </div>
      	<div class="row">
      	<input class="text-input" type="text" name="email" id="email"  placeholder="请输入邮箱"  />	<span class="red"> *</span>
        </div>
      	<div class="row">
      	<input class="text-input" type="password" name="password" id="password"  placeholder="请输入密码" />	<span class="red">*</span>
        </div>
      	<div class="row">
      	<input class="text-input" type="password" name="password2" id="password2" placeholder="请再次输入密码" /><span class="red"> *</span></div>  
      	<div class="row">
      		<input type="text" id="s_randomCode" class="text-input" name="s_randomCode"  style="width:150px" placeholder="请输入邮箱验证码" /><span class="red"> *</span>
       		&nbsp;&nbsp;&nbsp;
       		<input class="login-btn" style="width:50px" value="获取" onclick="getValidateCode();" type="button" name="submit">
        </div>  
        <div class="row fix">
          <label><input type="checkbox" name="agreeMent" id="agreeMent" onclick="ifChecked()" class="remember">
            <a href="javascript:openProtocol();">同意并阅读《万家桥网络注册协议》</a></label>
        </div>
        <div id="back" style="display:none;POSITION:fixed; left:0; top:0; width:100%;height:100%; background-color:gray;z-index:70;opacity:0.5;"  onclick="closeProtocol()"></div>
        <div id="win" style="display:none;POSITION:fixed;left:280px; top:170px;width:50%;background-color:white;padding:7px;z-index:100;opacity:1;border:10px solid gray;">
			<div><br><span><h4>《万家桥网络注册协议》</h4></span></div>
			<h4>一、总则</h4>
			 <p>1.1 万家桥的所有权和运营权归万家桥公司所有。</p>
			<h4>二、服务内容</h4>
			 <p>2.1 万家桥的具体内容由本站根据实际情况提供。</p> 
			<h4> 三、用户帐号</h4>
			 <p>3.1 经本站注册系统完成注册程序并通过身份认证的用户即成为正式用户，可以获得本站规定用户所应享有的一切权限。</p> 
			 <h4> 三、用户帐号</h4>
			 <p>3.1 经本站注册系统完成注册程序并通过身份认证的用户即成为正式用户，可以获得本站规定用户所应享有的一切权限。</p>
			<br>
			<p style="text-align: center;">
			<input style="background-color: red;color:white;" id="agreebtn" value="同意并继续" onclick="closeProtocol()" type="button">
			</p><br>
        </div>
        <div class="row">
          <input class="login-btn" value="注册" type="submit" name="submit">
        </div>
      </div>
      </form>
    </div>
  </div>
</div>
 </body>
</html>
