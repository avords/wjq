<%@ page import="com.mvc.security.util.SecurityUtils" %>
<%--
 Created by IntelliJ IDEA.
 User: Bluewater
 Date: 2005-7-21
 Time: 20:55:45
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //字符编码
    String CharacterEncoding = "UTF-8";
    request.setCharacterEncoding(CharacterEncoding);
    String BillNo = request.getParameter("BillNo");
    String Amount = request.getParameter("Amount");
    String tradeOrder = request.getParameter("tradeOrder");
    String Succeed = request.getParameter("Succeed");
    String Result = request.getParameter("Result");
    String SignMD5info = request.getParameter("SignMD5info");
    String MD5key = "ecpss123";
    String md5src = BillNo+"&"+Amount+"&"+Succeed+"&"+MD5key;
    String md5sign; //MD5加密后的字符串
    md5sign = SecurityUtils.generatePassword(md5src);//MD5检验结果
  
%>

<html>
<head><title>Payment Result</title></head>

<body>
<!-- 请加上你们网站的框架。就是你们网站的头部top，左部left等。还有字体等你们都要做调整。 -->

 <%
 if (SignMD5info==md5sign){
 %>
 <!-- MD5验证成功 -->
	<table width="728" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td  align="right" valign="top" width="200">Your order number is：</td>
    <td  align="left" valign="top"><%= BillNo%></td>
  </tr>
    <tr>
    <td  align="right" valign="top">Amount：</td>
    <td  align="left" valign="top"><%= Amount%></td>
  </tr>
    <tr>
    <td  align="right" valign="top">Payment result：</td>
	<%if ( Succeed=="88" ) 
	{
	%><!-- 可修改订单状态为正在付款中 -->
	<!-- 提交支付信息成功，返回绿色的提示信息 -->
	<td  align="left" valign="top" style="color:green;"><%= Result%></td>
	<%
	}
	else
	{
	%><!-- 提交支付信息失败，返回红色的提示信息 -->
    <td  align="left" valign="top" style="color:red;"><%= Result%>&nbsp;&nbsp;&nbsp;&nbsp;<%= Succeed%></td>
	<%
	}%>
  </tr>
  
</table>
<%
}
else 
{
%>
 <!-- MD5验证失败 -->
<table width="728" border="0" cellspacing="0" cellpadding="0" align="center">
 <tr>
    <td  align="center" valign="top" style="color:red;">Validation failed!</td>
	</tr>
	</table>
<%	
}
 %>
</body>

</html>

