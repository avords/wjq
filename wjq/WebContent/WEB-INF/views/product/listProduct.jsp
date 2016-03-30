<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
</head>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>
			<jdf:message code="商品管理" />
			<div class="actions-bar pull-right ">
				<a href="<%=dynamicDomain%>/product/create" class="btn btn-success">
				        <span class="glyphicon glyphicon-plus"></span>
				        <jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="<%=dynamicDomain%>/product/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="search_LIKES_name">
								<jdf:message code="商品名称" />
								</label>
								<div class="col-sm-8">
									<input type="text" name="search_LIKES_name" class="form-control" />
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="search_EQL_cateGoryId">
								<jdf:message code="所属分类" />
								</label>
								<div class="col-sm-8">
									<select name="search_EQL_cateGoryId" class="form-control" id="search_EQL_cateGoryId">
										<option value="">全部</option>
										<jdf:selectCollection items="productCateGorys" optionValue="objectId" optionText="name" />
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="search_EQI_status">
								<jdf:message code="当前商品状态" />
								</label>
								<div class="col-sm-8">
									<select name="search_EQI_status" class="form-control" id="search_EQI_status">
										<option>全部</option>
										<jdf:select dictionaryId="1501" valid="true" />
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
						<jdf:column property="cateGoryId" title="所属分类" headerStyle="width:10%;">
							<jdf:columnCollectionValue items="productCateGorys" nameProperty="name" value="${currentRowObject.cateGoryId }"  />
						</jdf:column>
						<jdf:column property="status" title="当前商品状态" headerStyle="width:10%;">
							<jdf:dictionaryName value="${currentRowObject.status}" dictionaryId="1501" />
						</jdf:column>
						<jdf:column alias="操作" title="操作" sortable="false" viewsAllowed="html" style="width: 20%">
							<a href="<%=dynamicDomain%>/product/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini">
								<i class="icon-pencil icon-white"></i>修改
							</a>
						</jdf:column>
					</jdf:row>
				</jdf:table>
		 </div>
	</div>
</div>
</body>