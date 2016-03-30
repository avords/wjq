<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<%@page import="com.mvc.security.SecurityConstants"%>
<title><jdf:message code="敏感词管理" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<jdf:message code="敏感词管理" />
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/keyword/save?ajax=1"
					class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label"> <jdf:message
										code="敏感词" />
								</label>
								<div class="col-sm-8">
									<input type="text" maxlength="32" placeholder="最多输入32个字" class="form-control" id="name" name="name">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<c:if test="${message!='操作成功'}">
								<div class="pull-right">
									<button type="submit" class="btn btn-primary">
										<span class="glyphicon glyphicon-ok"></span>
										<jdf:message code="common.button.save" />
									</button>
								</div>
							</c:if>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="KeyWords" />
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#name")
								.rules(
										"add",
										{
											remote : {
												url : "${dynamicDomain}/keyword/isUnique?ajax=1&fieldName=name&objectId=${entity.objectId}",
												type : "post",
												data : {
													value : function() {
														return $('#name').val();
													}
												},
												dataType : "json"
											},
											messages : {
												remote : "该敏感词已存在"
											}
										});
						refreshParentPage(true);
					});
</script>
</html>