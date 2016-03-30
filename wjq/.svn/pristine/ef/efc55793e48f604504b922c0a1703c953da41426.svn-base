<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>友情链接管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-heart"></span><jdf:message code="友情链接"/>
			<div class="pull-right">
				 <a  href="${dynamicDomain}/links/create"  class="btn btn-primary ">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/links/page" method="post" class="form-horizontal"  >
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_websiteName" class="col-sm-2 control-label">
									<jdf:message code="网站名称"/>
								</label>
								<div class="col-sm-8">
									<input type="text"class="form-control" id="search_LIKES_websiteName" name="search_LIKES_websiteName">
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_websiteUrl" class="col-sm-2 control-label">
									<jdf:message code="网站地址"/>
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_websiteUrl" name="search_LIKES_websiteUrl">
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
						<jdf:export view="csv" fileName="menu.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="menu.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
							<jdf:column property="websiteName" title="网站名称" style="width: 15%" />
			                <jdf:column property="websiteUrl" title="网址" style="width: 15%" />
			                <jdf:column property="orders" title="显示顺序" style="width: 15%" />
			                <jdf:column property="description" title="备注" style="width: 15%" />
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 30%">
								<a href="${dynamicDomain}/links/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini">
									<span class="glyphicon glyphicon-edit"></span><jdf:message code="修改"/>
								</a>
								<a href="${dynamicDomain}/links/viewLogo/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/links/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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