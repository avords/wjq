<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>我的订单</title>
</head>
<body>
	<h1>您的订单:</h1>
	
	<table class="table table-bordered">
	<thead>
	<tr><td>订单编号(详情)</td><td>日期</td><td>收货人</td><td>收货人电话</td></tr>
	</thead>
	<tbody>
	<tr class="info">
		<td><a href="#">abc12345</a></td>
		<td>2015-09-11</td>
		<td>叶知秋</td>
		<td>1399999999</td>
	</tr>
	<c:forEach items="${myOrders}" var="order">
	<tr class="success">
		<td><a href="${order.objectId}">${order.orderNumber}</a></td>
		<td>${order.orderDate}</td>
		<td>${order.consigneeName}</td>
		<td>${order.consigneePhone}</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
</body>
</html>