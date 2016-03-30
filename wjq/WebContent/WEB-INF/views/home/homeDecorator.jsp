<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<%@page import="com.mvc.config.ApplicationConfig"%>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@page import="com.mvc.framework.FrameworkConstants"%>
<%@page import="com.mvc.security.model.LoginLog"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<%@page import="com.mvc.framework.config.GlobalConfig"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.framework.model.Dictionary"%>
<%
	String dynamicDomain = DomainUtils.getDynamicDomain();
    request.setAttribute("dynamicDomain", dynamicDomain);
	session.setAttribute("dynamicDomain", dynamicDomain);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="no-cache" />
<jdf:themeFile file="css/home_base.css" />
<jdf:themeFile file="css/sweetalert.css" />
<jdf:themeFile file="jquery.min.js"/>
<jdf:themeFile file="jquery.twbsPagination.js" />
<jdf:themeFile file="sweetalert.min.js" />
<title><decorator:title default="" /></title>
<script type="text/javascript">
var loginUrl = "<%=GlobalConfig.getLoginUrl()%>";
var appRoot = "${dynamicDomain}";
var cookiePath = "<%=GlobalConfig.getCookiePath()%>";
var cookieDomain = "<%=GlobalConfig.getCookieDomain()%>";
var sessionName = "<%=GlobalConfig.getSessionName()%>";
var tokenName = "<%=SecurityConstants.SECURITY_TOKEN%>";
var timeoutOfLogout = 10;
var currentModuleId = "${currentModuleId}";
</script>
<decorator:head />
</head>
<body>
<%@ include file="home_header.jsp"%>
	<decorator:body />
<%@ include file="home_footer.jsp"%>
<script>
/* var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?bf318335497bbb6398effc0748de6650";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})(); */
</script>
</body>
</html>						