<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>会员管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-eject"></span>会员管理
			<div class="pull-right">
				 <a href="${dynamicDomain}/adminMember/create?ajax=1"  class="btn btn-primary colorbox-large">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/adminMember/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
			
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_loginName" class="col-sm-3 control-label">登录名</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_loginName" name="search_LIKES_loginName" >
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_cellPhone" class="col-sm-3 control-label">手机号码</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_cellPhone" name="search_LIKES_cellPhone" >
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_email" class="col-sm-3 control-label">邮箱</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_email" name="search_LIKES_email" >
								</div>
							</div>
						</div>
					<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_serviceType" class="col-sm-3 control-label">服务类型</label>
								<div class="col-sm-8">
									<select name="search_EQI_serviceType"  class="input-medium" style="width: 240px;" >
										 <option value="">请选择</option>
										 <jdf:select dictionaryId="1111"/>
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
					<jdf:table items="items" retrieveRowsCallback="limit" var="currentRowObject" filterRowsCallback="limit" sortRowsCallback="limit" action="page">
						<jdf:export view="csv" fileName="Role.csv" tooltip="Export CSV" imageName="csv" />
						<jdf:export view="xls" fileName="Role.xls" tooltip="Export EXCEL" imageName="xls" />
						<jdf:row>
						
							<jdf:column property="loginName" title="登录名" style="width:10%;" />
							<jdf:column property="sex" title="性别" style="width:10%;">
								<jdf:columnValue dictionaryId="100" value="${currentRowObject.sex}" />
							</jdf:column>
							<jdf:column property="cellPhone" title="手机号码" style="width:10%;" />
							<jdf:column property="email" title="邮箱" style="width:10%;" />
							<jdf:column property="memberRank" title="会员等级" style="width:10%;">
								<jdf:columnValue dictionaryId="1112" value="${currentRowObject.memberRank}" />
							</jdf:column>
							<jdf:column property="creditRating" title="信用评级" style="width:10%;">
								<jdf:columnValue dictionaryId="1021" value="${currentRowObject.creditRating}" />
							</jdf:column>
							<jdf:column property="serviceType" title="服务类型" style="width:10%;">
								<jdf:columnValue dictionaryId="1111" value="${currentRowObject.serviceType}" />
							</jdf:column>
							<jdf:column property="status" title="状态" style="width:10%;">
								<jdf:columnValue dictionaryId="111" value="${currentRowObject.status}" />
							</jdf:column>
							<jdf:column property="remark" title="备注" style="width:10%;" />
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 40%;">
								<a href="${dynamicDomain}/adminMember/edit/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox-large">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:toDeleteUrl('${dynamicDomain}/adminMember/delete/${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
									<span class="glyphicon glyphicon-trash"></span>
									<jdf:message code="common.button.delete"/>
								</a>
								<a href="${dynamicDomain}/adminMember/resetPassword/${currentRowObject.objectId}?ajax=1" class="btn btn-primary btn-mini colorbox">
									<span class="glyphicon glyphicon-lock"></span> 
									<jdf:message code="system.lable.user.reset_password" />
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