<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title><jdf:message code="在线留言"/></title>
</head>
<body>
<body>
<div class="panel panel-default">
		<div class="panel-heading">
			<jdf:message code="在线留言"/>
		</div>
	  	<div class="panel-body">
			<jdf:form bean="entity" scope="request">
				<form method="post" action="${dynamicDomain}/onlineMessage/save?ajax=1" class="form-horizontal" id="editForm">
					<input type="hidden" name="objectId">
			 		<div class="row">
			 			<div class="col-sm-12 alert alert-info" id="messageBox">
							${message=="success"?"操作成功":""}
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">
									<jdf:message code="留言主题" />
								</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="title"
										name="title" maxlength="28" placeholder="最大输入长度为28" onkeyup="replaceSpace(this)">
								</div>
							</div>
						</div>
					</div>	
					<div class="row">	
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">
									<jdf:message code="留言内容" />
								</label>
								<div class="col-sm-8">
									<textarea rows="6" cols="20" name="content" maxlength="120" placeholder="最大输入长度为120" class="form-control"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 col-md-4">
							<div class="pull-right">
								<button type="submit" class="btn btn-success">
									<span class="glyphicon glyphicon-ok"></span><jdf:message code="保存留言"/>
								</button>
							</div>
						</div>
					</div>
				</form>
			</jdf:form>
		</div>
	</div>
	<jdf:bootstrapDomainValidate domain="OnlineMessage"/>
</body>
</html>