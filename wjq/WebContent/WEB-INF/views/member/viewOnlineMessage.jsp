<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="留言查看"/></title>
<style type="text/css">
	th{
		width: 70px;
	}
	td{
		width: 200px;
	}
	.om1{
		font-size: 15px; 
		line-height: 20px; 
		width:500px;
		height:300px;
		margin:100px auto;
	}
</style>
</head>
<body>
                 <div class="ind-box" >
					<table class="om1">
						<tr>
							<th>留言者账号:</th>
							<td>${member.loginName}</td>
						</tr>
						<tr>
							<th>留言者类型:</th>
							<td><jdf:columnValue dictionaryId="1101" value="${entity.type }"/></td>
						</tr>
						<tr>
							<th>留言的主题:</th>
							<td>${entity.title}</td>
						</tr>
						<tr>
							<th>留言的时间:</th>
							<td><fmt:formatDate value="${entity.onlineMessageDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						</tr>
						<tr>
							<th>留言的内容:</th>
							<td><span style="width:300px;height:100px">${entity.content}</span></td>
						</tr>
						</table>
						</div>
</body>
</html>