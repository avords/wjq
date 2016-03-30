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
<title>页面失效</title>
<jdf:themeFile file="css/home_login.css" />
<jdf:themeFile file="jquery.SuperSlide.2.1.1.js" />
<jdf:themeFile file="jquery.validate.min.js" />
<jdf:themeFile file="jquery.validate_zh.js" />
<jdf:themeFile file="common.js" />

</head>

<body>
<div class="box">
  <div class="wrap">
  	<div class="login-wrap">
  		<div class="title">${message}</div>
	     <form id="vForm" name="vForm" action="${dynamicDomain}/home/index" method="post" >
	      <div class="cont">
	        <div class="row">
	          <input class="login-btn" value="返回主页" type="submit" name="submit">
	        </div>
	      </div>
	      </form>
    </div>
  </div>
</div>
</body>
</html>
