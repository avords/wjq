<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>在线留言板</title>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span><jdf:message code="在线留言板"/>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/onlineMessage/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_title" class="col-sm-4 control-label">
									<jdf:message code="留言主题"/>
								</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="search_LIKES_title" name="search_LIKES_title" >
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-4 control-label">
									<jdf:message code="留言者身份类型"/>
								</label>
								<div class="col-sm-5">
									<select name="search_EQI_type" class="form-control">
										<option value=""></option>
										<jdf:select dictionaryId="1101" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearForm(this)">
									<span class="glyphicon glyphicon-remove"></span>
									<jdf:message code="common.button.clear" />
								</button>
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-search"></span>
									<jdf:message code="common.button.query" />
								</button>
							</div>
						</div>
					 </div>
				 </form>
			</jdf:form>
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" var="currentRowObject" retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="onlineMessage.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="onlineMessage.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="onlineMessageDate" title="留言时间" style="width:10%" cell="date"/>
			                <jdf:column property="title" title="留言主题" style="width: 15%" />
			                 <jdf:column property="memberId" title="留言账号" style="width: 15%" >
			                 <jdf:columnCollectionValue items="users" nameProperty="loginName" value="${currentRowObject.memberId}"/>
							</jdf:column>
			                 <jdf:column property="content" title="留言内容" style="width: 15%" />
			                <jdf:column property="type" title="留言者身份类型" style="width:10%" >
							   <jdf:columnValue dictionaryId="1101" value="${currentRowObject.type}"/>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 20%">
								<a href="${dynamicDomain}/onlineMessage/view/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<jdf:message code="查看留言"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/onlineMessage/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
									<span class="glyphicon glyphicon-trash"></span>
									<jdf:message code="common.button.delete"/>
								</a>
							</jdf:column>
						</jdf:row>
					</jdf:table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>