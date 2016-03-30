<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>主题管理</title>
</head>
<body>
	 <div class="panel panel-default">
		<div class="panel-heading">
			<span class="glyphicon glyphicon-user"></span>主题管理
			<div class="pull-right">
				 <a href="${dynamicDomain}/postTheme/create"  class="btn btn-primary">
           			<span class="glyphicon glyphicon-plus"></span><jdf:message code="common.button.add"/>
           		 </a>
			</div>
		</div>
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="${dynamicDomain}/postTheme/page" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-12 alert alert-info" id="messageBox">
							${message}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_LIKES_name" class="col-sm-3 control-label">
									<jdf:message code="主题名称"/>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_LIKES_name" name="search_LIKES_name">
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label for="search_EQI_sortNo" class="col-sm-3 control-label">
									<jdf:message code="序号"/>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="search_EQI_sortNo" name="search_EQI_sortNo">
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
							<jdf:column property="name"   title="主题名称" headerStyle="width:15%;" />
							<jdf:column property="sortNo" title="序号" headerStyle="width:15%;" />
							<jdf:column property="remark" title="备注" headerStyle="width:15%;" />
							<jdf:column alias="common.lable.operate" title="common.lable.operate" sortable="false" viewsAllowed="html" style="width: 40%;">
								<a href="${dynamicDomain}/postTheme/edit/${currentRowObject.objectId}" class="btn btn-primary ">
									<span class="glyphicon glyphicon-edit"></span>
									<jdf:message code="common.button.edit"/>
								</a>
								<a href="javascript:enableToDelete('${currentRowObject.objectId}')" class="btn btn-danger btn-mini">
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
	
	function enableToDelete(id){
		if(confirm(sureToDelete)){
			$.ajax({
	            url:"${dynamicDomain}/postTheme/jsonDelete/"+id,
	            type : 'get',
	            dataType: "json", 
	            success : function(tf) {
	            	if(tf.result){
	            		location.reload();
	            	}else{
	            		alert("该主题下还有帖子，请先删除主题下的帖子！");
	            	}
	            },
	            error: function (data, status, e)//服务器响应失败处理函数
	            {
	                alert(e);
	            }
	        });
		}
	}
	
	</script>
</body>
</html>