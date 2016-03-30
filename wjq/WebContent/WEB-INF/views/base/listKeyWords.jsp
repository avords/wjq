<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>敏感词管理</title>
</head>
<body>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-remove-sign"></span>
			敏感词管理
			<div class="pull-right">
				<a href="${dynamicDomain}/keyword/create?ajax=1" class="btn btn-primary colorbox-large"> 
					<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/keyword/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-2 control-label">敏感词</label>
								<div class="col-sm-8">
									<input type="text" maxlength="32" class="form-control" id="search_LIKES_name" name="search_LIKES_name">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_GED_createDate" class="col-sm-2 control-label">创建时间</label>
								<div class="col-sm-8">
									<input type="text" id="search_GED_createDate" size="12" name="search_GED_createDate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'search_LED_createDate\')}',readOnly:true})">
										~
									<input type="text" id="search_LED_createDate" size="12" name="search_LED_createDate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'search_GED_createDate\')}',readOnly:true})">
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
						<jdf:export view="csv" fileName="敏感词.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="敏感词.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="name" title="敏感词" style="width: 15%" />
							<jdf:column property="createDate" cell="date" format="yyyy-MM-dd" title="创建时间" style="width: 15%" />
							<jdf:column property="createBy" title="创建人" style="width: 15%">
								<jdf:columnCollectionValue nameProperty="userName" items="users" value="${currentRowObject.createBy}"></jdf:columnCollectionValue>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 20%">
								<a href="${dynamicDomain}/keyword/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span><jdf:message code="common.button.edit" />
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/keyword/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
									<span class="glyphicon glyphicon-trash"></span> <jdf:message code="common.button.delete" />
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