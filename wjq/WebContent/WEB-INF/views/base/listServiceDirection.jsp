<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>服务方向管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-eject"></span><jdf:message code="服务方向管理"/>
			<div class="pull-right">
				 <a  href="${dynamicDomain}/serviceDirection/create?ajax=1"  class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/serviceDirection/page" method="post" class="form-horizontal"  >
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_serviceName" class="col-sm-3 control-label">
									<jdf:message code="服务方向名称"/>
								</label>
								<div class="col-sm-8">
									<input type="text"class="form-control" id="search_LIKES_serviceName" name="search_LIKES_serviceName" style="width: 240px;">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_isDelete" class="col-sm-3 control-label">是否删除</label>
									<select name="search_EQI_isDelete"  id="search_EQI_isDelete" class="input-medium" style="width: 240px;">
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="109"/>
									 </select>
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
						<jdf:export view="csv" fileName="menu.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="menu.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="serviceName" title="服务方向名称" style="width: 15%" />
							<jdf:column property="icon" title="图标" style="width: 15%" /><img src="">
							<jdf:column property="createDate" cell="date" title="创建时间" headerStyle="width:15%;" />
							<jdf:column property="isDelete" title="是否删除" style="width:15%;">
								 	<jdf:columnValue dictionaryId="109" value="${currentRowObject.isDelete}" />
							</jdf:column>
							<jdf:column property="remark" title="备注" headerStyle="width:15%;" />
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 30%">
								<a href="${dynamicDomain}/serviceDirection/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/serviceDirection/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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