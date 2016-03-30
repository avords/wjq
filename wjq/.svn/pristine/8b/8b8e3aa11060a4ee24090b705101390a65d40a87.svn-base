<%@page import="com.mvc.cms.model.Channel"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<title>栏目管理</title>
<script type="text/javascript">
function clearForm2(ele){
	$(ele).closest("form").find(':input').each(function() {
        switch(this.type) {
            case 'password':
            case 'select-multiple':
            case 'select-one':
            case 'text':
            case 'textarea':
                $(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;
        }
    });
	$("#search_EQL_parentId").select2("val", ""); 
}
</script>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="menu-icon glyphicon glyphicon-align-left icon-white"></span>栏目管理
			<div class="actions-bar pull-right ">
				<a href="<%=dynamicDomain%>/channel/create" class="btn btn-primary">
				        <span class="glyphicon glyphicon-plus"></span>
				        <jdf:message code="common.button.add" />
				</a>
			</div>
		</div>
		
		<div class="panel-body">
			<jdf:form bean="request" scope="request">
				<form action="<%=dynamicDomain%>/channel/page" id="selectForm" method="post" class="form-horizontal">
					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_name">
								<jdf:message code="栏目名称" />
								</label>
								<div class="col-sm-6">
									<input type="text" name="search_LIKES_name" class="form-control" onchange="nameIncludeChar(this)" />
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_positionCode">
								<jdf:message code="栏目编码" />
								</label>
								<div class="col-sm-6">
									<input type="text" name="search_LIKES_positionCode" class="form-control" onchange="nameIncludeChar(this)" />
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_EQL_parentId">
								<jdf:message code="父栏目" />
								</label>
								<div class="col-sm-6">
									<select id="search_EQL_parentId" name="search_EQL_parentId" class="js-example-placeholder-single" style="width: 100%" >
										<option value="">全部</option>
										<jdf:selectCollection items="channels" optionValue="objectId" optionText="fullName" />
									</select>
								</div>
							</div>
						</div>
						
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_EQI_isDisplay">
								<jdf:message code="是否显示" />
								</label>
								<div class="col-sm-6">
									<select class="form-control" name="search_EQI_isDisplay" id="search_EQI_isDisplay">
										<option value="">全部</option>
										<jdf:select dictionaryId="109" />
									</select>
								</div>
							</div>
						</div>
						
					</div>


					<div class="row">
						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_EQI_displayLocation">
								<jdf:message code="显示位置" />
								</label>
								<div class="col-sm-6">
									<select name="search_EQI_displayLocation" id="search_EQI_displayLocation" class="form-control">
										<option value="">全部</option>
										<jdf:select dictionaryId="1500" />
									</select>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-md-6">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="search_LIKES_channelExplian">
								<jdf:message code="备注" />
								</label>
								<div class="col-sm-6">
										<input type="text" name="search_LIKES_channelExplian" class="form-control" />
								</div>
							</div>
						</div>
					</div>
					
					<div class="span12 pull-right text-right">
						<button type="button" class="btn" onclick="clearForm2(this)">
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
						<jdf:column property="name" title="栏目名称" headerStyle="width:10%;" />
						<jdf:column property="positionCode" title="栏目编码" headerStyle="width:10%;" />
						<jdf:column property="priority" title="顺序" headerStyle="width:5%;" />
						<jdf:column property="isDisplay" title="是否显示" headerStyle="width:5%;">
							<jdf:dictionaryName value="${currentRowObject.isDisplay }" dictionaryId="109" />
						</jdf:column>
						<jdf:column property="isBlank" title="是否新窗口" headerStyle="width:5%;">
							<jdf:dictionaryName value="${currentRowObject.isBlank }" dictionaryId="109" />
						</jdf:column>
						<jdf:column property="displayLocation" title="显示位置" headerStyle="width:10%;">
							<jdf:dictionaryName value="${currentRowObject.displayLocation }" dictionaryId="1500" />
						</jdf:column>
						<jdf:column property="fullName" title="完整名称" headerStyle="width:10%;" />
						<jdf:column property="channelExplian" title="备注" headerStyle="width:10%;" />
						<jdf:column property="updateTime" cell="date" title="更新时间" headerStyle="width:10%;" />
						<jdf:column alias="操作" title="操作" sortable="false" viewsAllowed="html" style="width: 20%">
							<a href="<%=dynamicDomain%>/channel/edit/${currentRowObject.objectId}"class="btn btn-primary btn-mini">
								<i class="icon-pencil icon-white"></i>修改
							</a>
							
							<a href="javascript:void(0)" onclick="enableToDelete(${currentRowObject.objectId})" class="btn btn-danger btn-mini">
								<span class="glyphicon glyphicon-trash"></span>
								<jdf:message code="common.button.delete" />
							</a>
						</jdf:column>
					</jdf:row>
				</jdf:table>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		$(".js-example-placeholder-single").select2();
	});
	
	//通过是否有子栏目,判断是否可以删除
	function enableToDelete(id){
		$.ajax({
            url:"${dynamicDomain}/channel/jsonDelete/"+id,
            type : 'get',
            dataType: "json", 
            success : function(tf) {
            	if(tf.result){
            		location.reload();
            	}else{
            		alert("有隶属子栏目,不能删除");
            	}
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        });
	}
	</script>
	
</body>
</html>