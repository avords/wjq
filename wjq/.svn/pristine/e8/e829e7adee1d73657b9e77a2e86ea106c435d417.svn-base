<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>文章编辑</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-list"></span>文章编辑
			<div class="pull-right">
				 <a href="${dynamicDomain}/content/create" class="btn btn-primary ">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/content/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_title" class="col-sm-3 control-label">文章标题</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_title" name="search_LIKES_title">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-3 control-label">文章类型</label>
								<div class="col-sm-6">
									<select class="form-control" name="search_EQI_type" id="search_EQI_type">
										<option value="">全部</option>
										<jdf:select dictionaryId="1502" />
									</select>
								</div>
							 </div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-3 control-label">文章状态</label>
								<div class="col-sm-6">
									<select class="form-control" name="search_EQI_status" id="search_EQI_status">
										<option value="">全部</option>
										<jdf:select dictionaryId="1501" />
									</select>
								</div>
							 </div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_title" class="col-sm-3 control-label">关键字</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_keyWords" name="search_LIKES_keyWords">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_type" class="col-sm-3 control-label">文章摘要</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_summary" name="search_LIKES_summary">
								</div>
							 </div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12  col-md-12">
							<div class="pull-right">
								<button type="button" class="btn" onclick="clearForm(this)">
									<span class="glyphicon glyphicon-remove"></span><jdf:message code="common.button.clear" />
								</button>
								<button type="submit" class="btn  btn-primary">
									<span class="glyphicon glyphicon-search"></span><jdf:message code="common.button.query" />
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
			<div id="tableDiv" class="row">
				<div class="col-sm-12 col-md-12">
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="User.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="User.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="title" title="文章标题" headerStyle="width:15%;" />
							<jdf:column property="type" title="文章类型" headerStyle="width:15%;" >
								<jdf:dictionaryName value="${currentRowObject.type }"  dictionaryId="1502"/>
							</jdf:column>
							<jdf:column property="status" title="文章状态" headerStyle="width:15%;" >
								<jdf:dictionaryName value="${currentRowObject.status }"  dictionaryId="1501"/>
							</jdf:column>
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 20%;">
								<a href="${dynamicDomain}/content/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/content/delete/${currentRowObject.objectId}')" class="btn btn-primary btn-mini">
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