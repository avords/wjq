<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<jdf:themeFile file="FilterMultSelect.js" />
<title><jdf:message code="服务方向"/></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-edit"></span><jdf:message code="服务方向"/>(${cooperativeEnterprise.company})
		</div>
		<div class="panel-body">
			<form action="${dynamicDomain}/cooperativeEnterprise/saveEnterpriseService?ajax=1" method="post" name="EnterpriseService" id="EnterpriseService"  class="form-horizontal" onsubmit="prepare();">
				<input type="hidden" name="enterpriseId" value="${cooperativeEnterprise.objectId}">
				<div class="row">
					<div class="col-sm-12 alert alert-info" id="messageBox">
						${message}
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5 col-md-5">
						<span>已选</span>
						<div class="form-group">
							<label for="name" class="col-sm-6 control-label">
								<select name="serviceDirectionId" id="selected" multiple="multiple" style="width: 300px;" size="15">
									<jdf:selectCollection items="haveServiceDirections" optionValue="objectId" optionText="serviceName"/>
								</select>
							</label>
						</div>
					</div>
					<div class="col-sm-2 col-md-2">
						<div class="span2" style="line-height: 300px;vertical-align:middle;text-align: center;margin: 0 auto;">
							<img title="Add Select" src="<jdf:theme/>img/oneLeft.gif" id="rightToLeft" class="moveButton">
							<img title="Delete Select" src="<jdf:theme/>img/oneRight.gif" id="leftToRight" class="moveButton">
						</div>
					</div>
					<div class="col-sm-5 col-md-5">
						<span>未选</span>
						<div class="form-group">
							<label for=serviceName class="col-sm-6 control-label">
								<select name="unSelected" id="unSelected" multiple="multiple" style="width: 300px;" size="15">
									<jdf:selectCollection items="notHaveServiceDirections" optionValue="objectId" optionText="serviceName"/>
								</select>
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="pull-right">
							<button type="submit" class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span><jdf:message code="common.button.save"/>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	function prepare() {
		var theform = document.EnterpriseService;
		var userIdSelected = theform.selected;
		for(var i = userIdSelected.options.length-1; i >= 0; i--){
			userIdSelected.options[i].selected = true;
		}

		//$("#unSelected").empty();
	}
	$(document).ready(function() {
		filterMultSelect("selected","unSelected","rightToLeft","leftToRight","leftInput","rightInput","leftFilter","rightFilter");
		refreshParentPage(false);
		parent.reloadParent= true;
	});
	</script>
</body>
</html>