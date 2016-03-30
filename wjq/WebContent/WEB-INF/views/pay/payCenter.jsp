<%@ page import="com.mvc.security.util.SecurityUtils" %>
<%@page import="com.mvc.framework.util.DomainUtils"%>
<%@page import="com.mvc.pay.model.PayConfig" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>支付</title></head>

<body>

<form action="https://pay.ecpss.com/sslpayment" method="post" name="E_FORM">
    <input type="hidden" name="Amount" value="${amount}">
    <input type="hidden" name="MerNo" value="${merNo}">
    <input type="hidden" name="BillNo" value="${billNo}">
    <input type="hidden" name="ReturnURL" value="${returnURL}" >
    <input type="hidden" name="AdviceURL" value="${adviceURL}" >
    <input type="hidden" name="SignInfo" value="${signInfo}">
    <input type="hidden" name="orderTime" value="${orderTime}">
    <input type="hidden" name="products" value="${products}">
  <table align="center">
     <tr>
      <td></td>
      <td>
          <input type="radio" name="defaultBankNumber" value="ICBC">工商银行&nbsp;&nbsp;
          <input type="radio" name="defaultBankNumber" value="ABC">农业银行&nbsp;&nbsp;
          <input type="radio" name="defaultBankNumber" value="BOCSH">中国银行&nbsp;&nbsp;
          <input type="radio" name="defaultBankNumber" value="CCB">建设银行&nbsp;&nbsp;
          <input type="radio" name="defaultBankNumber" value="CMB">招商银行
      </td>
    </tr>
    <tr>
      <td></td>
      <td><input type="hidden" name="Remark" value=""></td>
    </tr>
  </table>
  <p align="center">
    <input type="submit" name="b1" value="Payment">
  </p>
</form>
</body>
</html>
