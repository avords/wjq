<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="查看详情" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<jdf:message code="查看详情" />
		</div>
		<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/links/save?ajax=1"
					class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="websiteName" class="col-sm-3 control-label"><jdf:message
										code="网站名称" /></label>
								<div class="col-sm-8">
									<input type="text" readonly="readonly" name="websiteName"
										value="${entity.websiteName}">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="websiteUrl" class="col-sm-3 control-label"><jdf:message code="网址" /></label>
								<div class="col-sm-8">
									<input type="text" readonly="readonly" name="websiteUrl">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="pictureWidth">
									<jdf:message code="图片宽度" />
								</label>
								<div class="col-sm-6">
									<input type="text" readonly="readonly" style="width: 157px"
										name="pictureWidth" id="pictureWidth" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="pictureHeight">
									<jdf:message code="图片高度" />
								</label>
								<div class="col-sm-6">
									<input type="text" readonly="readonly" style="width: 157px"
										name="pictureHeight" id="pictureHeight" class="form-control">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="orders" class="col-sm-3 control-label"><jdf:message
										code="显示顺序" /></label>
								<div class="col-sm-8">
									<input type="text" readonly="readonly" name="orders"
										value="${entity.orders}">
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="advertFileViewPath" class="col-sm-3 control-label"><jdf:message
										code="Logo图片" /></label>
								<div id="mainImg" style="width: 120px; margin-left: 120px;">
									<c:if
										test="${entity.objectId != null&& entity.pictureAddress!=null }">
										<img alt="" src="${dynamicDomain}${entity.pictureAddress}"
											width="120px">
									</c:if>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="description" class="col-sm-3 control-label"><jdf:message
										code="备注" /></label>
								<div class="col-sm-8">
									<textarea rows="8" cols="19" name="description"
										readonly="readonly"></textarea>
								</div>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
</body>
</html>