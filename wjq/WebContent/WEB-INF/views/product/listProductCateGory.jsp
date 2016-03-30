<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			<jdf:message code="商品管理" />
			<div class="actions-bar pull-right ">
				<a href="<%=dynamicDomain%>/productCateGory/create" class="btn btn-success">
				        <span class="glyphicon glyphicon-plus"></span>
				        <jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="<%=dynamicDomain%>/productCateGory/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="search_LIKES_name">
								<jdf:message code="商品分类名称" />
								</label>
								<div class="col-sm-8">
									<input type="text" name="search_LIKES_name" class="form-control" />
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="parentId">
								<jdf:message code="父分类" />
								</label>
								<div class="col-sm-8">
									<select name="cateGoryId" class="form-control" id="cateGoryId">
										<option value="">全部</option>
										<jdf:selectCollection items="productCateGorys" optionValue="objectId" optionText="name" />
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="span12 pull-right text-right">
						<button type="button" class="btn" onclick="clearForm(this)">
							<i class="icon-search icon-white"></i>清理
						</button>
						<button type="submit" class="btn btn-primary">
							<i class="icon-search icon-white"></i>
							<jdf:message code="common.button.query" />
						</button>
					</div>
				</form>
			</jdf:form>
			<div id="tableDiv">
				<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
					<jdf:export view="csv" fileName="student.csv" tooltip="Export CSV" imageName="csv" />
					<jdf:export view="xls" fileName="student.xls" tooltip="Export EXCEL" imageName="xls" />
					<jdf:row>
						<jdf:column property="name" title="商品名称" headerStyle="width:10%;" />
						<jdf:column property="cateGoryId" title="父栏目" headerStyle="width:10%;">
							<jdf:columnCollectionValue nameProperty="name" items="productCateGorys" value="${currentRowObject.parentId }" />
						</jdf:column>
						<jdf:column alias="操作" title="操作" sortable="false" viewsAllowed="html" style="width: 20%">
							<a href="<%=dynamicDomain%>/productCateGory/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini">
								<i class="icon-pencil icon-white"></i>修改
							</a>
						</jdf:column>
					</jdf:row>
				</jdf:table>
		 </div>
	</div>
</div>
</body>