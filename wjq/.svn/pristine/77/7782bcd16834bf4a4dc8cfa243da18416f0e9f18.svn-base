<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>合作单位管理</title>
</head>
<body>
	 <div class="panel panel-default"> 
		<div class="panel-heading">
			<span class="glyphicon glyphicon-lock"></span>合作单位管理
			<div class="pull-right">
				 <a  href="${dynamicDomain}/cooperativeEnterprise/create"  class="btn btn-primary">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/cooperativeEnterprise/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_company" class="col-sm-3 control-label">公司名称</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_company" name="search_LIKES_company" >
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-3 control-label">法人代表</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_name" >
								</div>
							</div>
						</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_cellPhone" class="col-sm-3 control-label">手机号码</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_cellPhone" name="search_LIKES_cellPhone" >
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_address" class="col-sm-3 control-label">联系地址</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="search_LIKES_address" name="search_LIKES_address" >
								</div>
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
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="Role.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Role.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
						
							<jdf:column property="company" title="公司名称" style="width:10%;" />
							<jdf:column property="companyURL" title="公司网址" style="width:10%;" />
							<jdf:column property="address" title="联系地址" style="width:10%;" />
							<jdf:column property="name" title="法人代表" style="width:10%;" />
							<jdf:column property="cellPhone" title="手机号码" style="width:10%;" />
							<jdf:column property="creditRating" title="信用评级" style="width:10%;">
								 	<jdf:columnValue dictionaryId="1021" value="${currentRowObject.creditRating}" />
							</jdf:column>
							<jdf:column property="serviceType" title="服务类型" style="width:10%;">
								 	<jdf:columnValue dictionaryId="1111" value="${currentRowObject.serviceType}" />
							</jdf:column>
							<jdf:column property="cotimes" title="合作次数" style="width:10%;" />
							
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 30%;">
								<a href="${dynamicDomain}/cooperativeEnterprise/edit/${currentRowObject.objectId}" class="btn btn-primary btn-mini ">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="${dynamicDomain}/cooperativeEnterprise/viewCooperativeEnterprise/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large ">
									<span class="glyphicon glyphicon-fullscreen"></span><jdf:message code="查看"/>
								</a>
								<a href="${dynamicDomain}/cooperativeEnterprise/enterpriseService/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-asterisk"></span>
									<jdf:message code="服务方向"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/cooperativeEnterprise/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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
	<script type="text/javascript">

	</script>	
</body>
</html>